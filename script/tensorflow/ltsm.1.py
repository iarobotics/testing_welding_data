from sklearn.model_selection import train_test_split
import numpy as np
from matplotlib import pyplot as plt
from pandas import read_csv
from pandas import concat
import tensorflow as tf



def generate_time_series(datalen):
    freq1 = 0.2
    freq2 = 0.15
    noise = [np.random.random() * 0.1 for i in range(datalen)]
    x1 = np.sin(np.arange(0, datalen) * freq1) + noise
    x2 = np.sin(np.arange(0, datalen) * freq2) + noise
    x = x1 + x2
    return x.astype(np.float32)


DATA_SEQ_LEN = 24000

#data = generate_time_series(DATA_SEQ_LEN)

# load dataset
headers = ["current", "voltage", "arc", "ref"]
data = read_csv('data\log1.txt', names=headers, sep = "\t", skiprows=50000)
data = data.voltage
#log2 = read_csv('data\log2.txt', names=headers, sep = "\t", skiprows=50000)
#log3 = read_csv('data\log3.txt', names=headers, sep = "\t", skiprows=50000)
#log4 = read_csv('data\log4.txt', names=headers, sep = "\t", skiprows=50000)

#data = concat([log1, log2, log3, log4])


SEQLEN = 16  # unrolled sequence length
BATCHSIZE = 32

X = data
Y = np.roll(data, -1)

X_train, X_test, Y_train, Y_test = train_test_split(X, Y,
                                                    test_size=.2,
                                                    random_state=0)

X_train = np.reshape(X_train, [-1, SEQLEN])
Y_train = np.reshape(Y_train, [-1, SEQLEN])

X_test = np.reshape(X_test, [-1, SEQLEN])
Y_test = np.reshape(Y_test, [-1, SEQLEN])


def train_dataset():
    dataset = tf.data.Dataset.from_tensor_slices((X_train, Y_train))
    dataset = dataset.repeat()
    dataset = dataset.shuffle(DATA_SEQ_LEN * 4 // SEQLEN)
    dataset = dataset.batch(BATCHSIZE)
    samples, labels = dataset.make_one_shot_iterator().get_next()
    return samples, labels


def eval_dataset():
    evaldataset = tf.data.Dataset.from_tensor_slices((X_test, Y_test))
    evaldataset = evaldataset.repeat(1)
    evaldataset = evaldataset.batch(BATCHSIZE)

    samples, labels = evaldataset.make_one_shot_iterator().get_next()
    return samples, labels

RNN_CELLSIZE = 80
N_LAYERS = 2
DROPOUT_PKEEP = 0.7

def model_rnn_fn(features, labels, mode):

    X = tf.expand_dims(features, axis=2)

    batchsize = tf.shape(X)[0]
    seqlen = tf.shape(X)[1]

    cells = [tf.nn.rnn_cell.GRUCell(RNN_CELLSIZE) for _ in range(N_LAYERS)]

    cells[:-1] = [tf.nn.rnn_cell.DropoutWrapper(cell, output_keep_prob=DROPOUT_PKEEP) for cell in cells[:-1]]
    # a stacked RNN cell still works like an RNN cell
    cell = tf.nn.rnn_cell.MultiRNNCell(cells, state_is_tuple=False)

    # X[BATCHSIZE, SEQLEN, 1], Hin[BATCHSIZE, RNN_CELLSIZE*N_LAYERS]
    Yn, H = tf.nn.dynamic_rnn(cell, X, dtype=tf.float32)

    Yn = tf.reshape(Yn, [batchsize * seqlen, RNN_CELLSIZE])
    Yr = tf.layers.dense(Yn, 1)  # Yr [BATCHSIZE*SEQLEN, 1]
    Yr = tf.reshape(Yr, [batchsize, seqlen, 1])  # Yr [BATCHSIZE, SEQLEN, 1]

    Yout = Yr[:, -1, :]  # Last output Yout [BATCHSIZE, 1]

    loss = train_op = None
    if mode != tf.estimator.ModeKeys.PREDICT:
        labels = tf.expand_dims(labels, axis=2)
        loss = tf.losses.mean_squared_error(Yr, labels)  # la  bels[BATCHSIZE, SEQLEN, 1]
        lr = 0.001
        optimizer = tf.train.AdamOptimizer(learning_rate=lr)

        train_op = tf.contrib.training.create_train_op(loss, optimizer)

    return tf.estimator.EstimatorSpec(
        mode=mode,
        predictions={"Yout": Yout},
        loss=loss,
        train_op=train_op
    )

training_config = tf.estimator.RunConfig(model_dir="./outputdir")
estimator = tf.estimator.Estimator(model_fn=model_rnn_fn, config=training_config)

estimator.train(input_fn=train_dataset,steps=2000)

results = estimator.predict(eval_dataset)

Yout_ = [result["Yout"] for result in results]

actual = Y_test[:, -1]

colors = plt.rcParams['axes.prop_cycle'].by_key()['color']
plt.plot(actual, label="Actual Values", color='green')
plt.plot(Yout_, label="Predicted Values", color='red', )

plt.show()
