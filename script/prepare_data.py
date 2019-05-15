from pandas import read_csv, concat
import matplotlib.pyplot as plt


def get_short_circuit_idx(short_circuit_list):
    short_idx = []
    short = False
    start = 0

    for idx, isShort in enumerate(short_circuit_list):

        if isShort:
            short = True
            if start == 0:
                start = idx
        else:
            if short:
                #end = idx-1 TODO: Enable this
                end = idx
                short_idx.append((start, end))
                short = False
                start = 0
            else:
                pass

    return short_idx

def get_rupture_region_from_short(short_idx, short_circuit_list, region_size: int=10, ignore_short_sc=True, spike_rupture=False):
    """
    Generate rupture region as the last region_size (10) samples of a short-circuit period.
    Set SC period lower than the region_size to 0
    Returns the rupture region list and the modified short_circuit list.
    """

    rupture = short_circuit_list.copy()
    short_list = short_circuit_list.copy()

    for start, end in short_idx:

        idx = start

        if end - start < region_size:
            if ignore_short_sc:
                while idx <= end:
                    rupture[idx] = 0
                    short_list[idx] = 0
                    idx += 1
            else:
                continue
        else:
            while idx < end-region_size:
                rupture[idx] = 0
                idx += 1
            if spike_rupture:
                idx += 1
                while idx < end:
                    rupture[idx] = 0
                    idx += 1

    return rupture, short_list

def remove_small_short_circuits(short_idx, short_circuit_list):

    cut_short = short_circuit_list.copy()
    cut_data_frame = data_frame
    for start, end in short_idx:
        if end - start < 10:
            #print(f'Got here {start}')
            cut_data_frame = cut_data_frame.drop(data_frame.index[start:end+1])

    return cut_data_frame


headers = ["current", "voltage", "short", "ref"]

data = read_csv('..\data\log4.txt', names=headers, sep = "\t")
#log2 = read_csv('..\data\log2.txt', names=headers, sep = "\t")
#log3 = read_csv('..\data\log3.txt', names=headers, sep = "\t")

#data = concat([log1, log2, log3])


#short_list = data.values[:, 2]
short_list = data.short

# Get the start,end indexes of short-circuit regions
short_idx = get_short_circuit_idx(short_list)

# Generate rupture region
rupture_list, short_list = get_rupture_region_from_short(short_idx, short_list, region_size=10)

# Add rupture region to dataframe
data['rupture_10'] = rupture_list
data['short'] = short_list

rupture_list_5, _ = get_rupture_region_from_short(short_idx, short_list, region_size=5)
data['rupture_5'] = rupture_list_5

rupture_list_spike, _ = get_rupture_region_from_short(short_idx, short_list, region_size=10, spike_rupture=True)
data['rupture_spike'] = rupture_list_spike


# New data frame with removed non-short-circuit samples
data_cut_non_sc = data[data.short != 0]

# new_list = []
# for start,end in short_idx:
#     alist = []
#     while start < end+1:
#         alist.append(short_list[start])

#     new_list.append(alist)
#     alist.clear()




#data.to_csv('..\data\modified\data4.csv', index=False, sep='\t')
#data_cut_non_sc.to_csv('..\data\modified\data4_cut_non_sc.csv', index=False, sep='\t')


plt.figure()
start = 20000
end = 31000
plt.plot(data.short[start:end], color='b', linewidth=2)
#plt.plot(data.short[start:end], color='b')
plt.plot(data.rupture_5[start:end], color='y', linestyle='--')
plt.plot(data.rupture_10[start:end], color='g', linestyle='--')
#plt.plot(data.rupture_spike[start:end], color='r', linestyle='--')
plt.legend()

plt.figure()
#plt.plot(data_cut_non_sc.short[start:end], color='b', linewidth=3)
plt.plot(data_cut_non_sc.short[start:end], color='b')
plt.plot(data_cut_non_sc.rupture_5[start:end], color='y')
plt.plot(data_cut_non_sc.rupture_10[start:end], color='g')
plt.plot(data_cut_non_sc.rupture_spike[start:end], color='r', linestyle='--')
plt.legend()

plt.show()


# short_idx = get_short_circuit_idx(data_cut_non_sc.rupture_10)

# count = 0
# for s,e in short_idx:
#     if e-s <= 0:
#         print(f'zero {e-s}')
#     if e-s == 10:
#         count += 1

# print("Here")
# print(count)
# print(len(short_idx))

for start,end in short_idx:
    print(end - start)




"""
At this point we have a data frame with 5 columns.
The firth one being rupture, set to a fixed size of 10 samples.
Short-circuit period with less than 10 samples are not assigned a rupture region.
All short-circuits less than 10 samples are also removed
"""


"""
data_cut_small_sc = remove_small_short_circuits(short_idx, data)

# New data frame with removed non-short-circuit samples
data_cut_all_non_sc = data_cut_small_sc[data_cut_small_sc.short != 0]

#print(short_idx)
print(len(data.values))
print(len(data_cut_small_sc.values))
print(len(data_cut_all_non_sc.values))


# Generate rupture region as a spike


data.to_csv('..\data\modified\data_with_rupture.csv', index=False, sep='\t')
data_cut_small_sc.to_csv('..\data\modified\data_with_rupture_cut_small_sc.csv', index=False, sep='\t')
data_cut_all_non_sc.to_csv('..\data\modified\data_with_rupture_cut_all_non_sc.csv', index=False, sep='\t')

plt.figure()
start = 20000
end = 20200
plt.plot(data_cut_small_sc.rupture[start:end], 'y')
#plt.plot(data_cut_small_sc.rupture_spike[start:end], 'r')
plt.legend()
plt.show()

def plot_data():
    #cut_shor, cut_rupture = remove_small_short_circuits(short_list, rupture_list)

    #print('S {}'.format(short_list[28623:28640]))
    #print('R {}'.format(rupture_list[28623:28640]))
    start = 20000
    end = 20200
    plt.figure()
    plt.plot(short_list[start:end], 'y')
    plt.plot(rupture_list[start:end], 'r')
    plt.legend()

    plt.figure()
    plt.plot(data_cut_small_sc.short[start:end], 'y')
    plt.plot(data_cut_small_sc.rupture[start:end], 'r')
    plt.legend()


    plt.figure()
    plot_len = 3

    plt.subplot(plot_len, 1, 1)
    plt.plot(data_cut_all_non_sc.current[start:end])
    plt.title('Current', y=0.5, loc='right')

    plt.subplot(plot_len, 1, 2)
    plt.plot(data_cut_all_non_sc.voltage[start:end])
    plt.title('Voltage', y=0.5, loc='right')

    plt.subplot(plot_len, 1, 3)
    plt.plot(data_cut_all_non_sc.rupture[start:end])
    plt.title('Rupture', y=0.5, loc='right')

    plt.show()
"""
