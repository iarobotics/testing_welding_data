from math import sqrt
from numpy import concatenate
from matplotlib import pyplot
from pandas import read_csv
from pandas import DataFrame
from pandas import concat

def draw_plot(dataset: DataFrame):
    # lists of c,v,a,ref
    values = dataset.values
    # specify columns to plot
    #groups = [0, 1, 2, 3]
    groups = [1, 2]
    i = 1
    # plot each column
    pyplot.figure()
    for group in groups:
        pyplot.subplot(len(groups), 1, i)
        pyplot.plot(values[:, group])
        pyplot.title(dataset.columns[group], y=0.5, loc='right')
        i += 1
    pyplot.show()


# load dataset
headers = ["current", "voltage", "arc", "ref"]
log1 = read_csv('data\log1.txt', names=headers, sep = "\t", skiprows=50000)
log2 = read_csv('data\log2.txt', names=headers, sep = "\t", skiprows=50000)
log3 = read_csv('data\log3.txt', names=headers, sep = "\t", skiprows=50000)
log4 = read_csv('data\log4.txt', names=headers, sep = "\t", skiprows=50000)

log5 = read_csv('predictions\short_4.txt', names=["short"])
log6 = read_csv('predictions\short_1_2_3.txt', names=["short"])
log7 = read_csv('predictions\short_1_2_3_rupture.txt', names=["short"])

y_d10_n2 = read_csv('predictions\y_d10_n2.txt', names=["short"])
y_d10_n4 = read_csv('predictions\y_d10_n2.txt', names=["short"])
y_d10_n4 = read_csv('predictions\y_d10_n2.txt', names=["short"])

y_d20_n10 = read_csv('predictions\y_d20_n10.txt', names=["short"])
y_d4_n10 = read_csv('predictions\y_d4_n10.txt', names=["short"])

data = concat([log1, log2, log3, log4])

#draw_plot(data[1100:2100])

#plt.plot(data.voltage, color='g')
#plt.plot(arc*300, color='y', linewidth=3)
#plt.plot(arc_mod*300, color='r', linestyle='--')
#plt.legend()
#plt.grid()
#plt.show()

pyplot.figure()
plot_len = 4

pyplot.subplot(plot_len, 1, 1)
pyplot.plot(data.values[1100:2100, 1])
pyplot.title('Voltage', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 2)
pyplot.plot(data.values[1100:2100, 2])
pyplot.title('Actual short', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 3)
pyplot.plot(log6.values[1100:2100])
pyplot.title('Predicted short', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 4)
pyplot.plot(log7.values[1100:2100])
pyplot.title('Rupture region', y=0.5, loc='right')

#pyplot.show()


# Delay 10 variable neurons
pyplot.figure()
plot_len = 4

pyplot.subplot(plot_len, 1, 1)
pyplot.plot(log4.values[1100:2100, 1])
pyplot.title('Voltage', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 2)
pyplot.plot(log4.values[1100:2100, 2])
pyplot.title('Actual short', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 3)
pyplot.plot(y_d10_n2.values[1100:2100])
pyplot.title('D20_n10', y=0.5, loc='right')

pyplot.subplot(plot_len, 1, 4)
pyplot.plot(y_d4_n10.values[1100:2100])
pyplot.title('y_d4_n10', y=0.5, loc='right')


pyplot.show()
