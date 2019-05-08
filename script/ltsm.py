from math import sqrt
from numpy import concatenate
from matplotlib import pyplot
from pandas import read_csv
from pandas import DataFrame
from pandas import concat
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import LabelEncoder
from sklearn.metrics import mean_squared_error
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM

def draw_plot(dataset: DataFrame):
    # lists of c,v,a,ref
    values = dataset.values
    # specify columns to plot
    groups = [0, 1, 2, 3]
    i = 1
    # plot each column
    pyplot.figure()
    for group in groups:
        pyplot.subplot(len(groups), 1, i)
        pyplot.plot(values[:, group])
        pyplot.title(dataset.columns[group], y=0.5, loc='right')
        i += 1
    pyplot.show()


def series_to_supervised(data, n_in=1, n_out=1, dropnan=True):
	"""
	Frame a time series as a supervised learning dataset.
	Arguments:
		data: Sequence of observations as a list or NumPy array.
		n_in: Number of lag observations as input (X).
		n_out: Number of observations as output (y).
		dropnan: Boolean whether or not to drop rows with NaN values.
	Returns:
		Pandas DataFrame of series framed for supervised learning.
	"""
	n_vars = 1 if type(data) is list else data.shape[1]
	df = DataFrame(data)
	cols, names = list(), list()
	# input sequence (t-n, ... t-1)
	for i in range(n_in, 0, -1):
		cols.append(df.shift(i))
		names += [('var%d(t-%d)' % (j+1, i)) for j in range(n_vars)]
	# forecast sequence (t, t+1, ... t+n)
	for i in range(0, n_out):
		cols.append(df.shift(-i))
		if i == 0:
			names += [('var%d(t)' % (j+1)) for j in range(n_vars)]
		else:
			names += [('var%d(t+%d)' % (j+1, i)) for j in range(n_vars)]
	# put it all together
	agg = concat(cols, axis=1)
	agg.columns = names
	# drop rows with NaN values
	if dropnan:
		agg.dropna(inplace=True)
	return agg

# load dataset
headers = ["current", "voltage", "arc", "ref"]
log1 = read_csv('data\log1.txt', names=headers, sep = "\t", skiprows=50000)
log2 = read_csv('data\log2.txt', names=headers, sep = "\t", skiprows=50000)
log3 = read_csv('data\log3.txt', names=headers, sep = "\t", skiprows=50000)
log4 = read_csv('data\log4.txt', names=headers, sep = "\t", skiprows=50000)

data = concat([log1, log2, log3, log4])

#draw_plot(data[1100:2100])


values = data.values

# integer encode direction
# encoder = LabelEncoder()
# values[:,4] = encoder.fit_transform(values[:,4])

# ensure all data is float
values = values.astype('float32')
# normalize features
scaler = MinMaxScaler(feature_range=(0, 1))
scaled = scaler.fit_transform(values)
# frame as supervised learning
reframed = series_to_supervised(scaled, 1, 1)
# drop columns we don't want to predict - predict voltage and time t given current and voltage and time t-1
# Drop arc and ref
reframed.drop(reframed.columns[[2, 3, 4, 6, 7]], axis=1, inplace=True)

# split into train and test sets
values = reframed.values
n_train_hours = 25000
train = values[:n_train_hours, :]
test = values[n_train_hours:n_train_hours*3, :]
# split into input and outputs
train_X, train_y = train[:, :-1], train[:, -1]
test_X, test_y = test[:, :-1], test[:, -1]
# reshape input to be 3D [samples, timesteps, features]
train_X = train_X.reshape((train_X.shape[0], 1, train_X.shape[1]))
test_X = test_X.reshape((test_X.shape[0], 1, test_X.shape[1]))
print(train_X.shape, train_y.shape, test_X.shape, test_y.shape)
#(25000, 1, 2) (25000,) (25000, 1, 2) (25000,)

# design network
model = Sequential()
model.add(LSTM(50, input_shape=(train_X.shape[1], train_X.shape[2])))  # The input shape will be 1 time step with 2 features. See print above
model.add(Dense(1))
model.compile(loss='mae', optimizer='adam')
# fit network
history = model.fit(train_X, train_y, epochs=1, batch_size=72, validation_data=(test_X, test_y), verbose=2, shuffle=False)

# plot history
#pyplot.plot(history.history['loss'], label='train')
#pyplot.plot(history.history['val_loss'], label='test')
#pyplot.legend()
#pyplot.show()


# make a prediction
# make a prediction
yhat = model.predict(test_X)
print(f'shape pre: {test_X.shape}')
test_X = test_X.reshape((test_X.shape[0], test_X.shape[2]))
print(f'shape post: {test_X.shape}')
# invert scaling for forecast
inv_yhat = concatenate((yhat, test_X[:, :-2]), axis=1)
print(f'inv_yhat shape post: {inv_yhat.shape}')
inv_yhat = scaler.inverse_transform(inv_yhat)
inv_yhat = inv_yhat[:,0]
# invert scaling for actual
test_y = test_y.reshape((len(test_y), 1))
inv_y = concatenate((test_y, test_X[:, 1:]), axis=1)
inv_y = scaler.inverse_transform(inv_y)
inv_y = inv_y[:,0]
# calculate RMSE
rmse = sqrt(mean_squared_error(inv_y, inv_yhat))
print('Test RMSE: %.3f' % rmse)
#print(data.head())
#print("Data shape: {}".format(data.shape))
#print(reframed.head())

# plot prediction and actual
pyplot.plot(inv_yhat[:100], label='prediction')
pyplot.plot(inv_y[:100], label='actual')
pyplot.legend()
pyplot.show()
