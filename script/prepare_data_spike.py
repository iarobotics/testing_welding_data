from pandas import read_csv
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
                end = idx
                short_idx.append((start, end))
                short = False
                start = 0
            else:
                pass

    return short_idx

def get_rupture_region_from_short(short_idx, short_circuit_list, region_size: int=10):

    rupture = short_circuit_list.copy()
    for start, end in short_idx:
        if end - start < 10:
            continue
        else:
            idx = start
            while idx < end-region_size:
                rupture[idx] = 0
                idx += 1
    return rupture

def remove_small_short_circuits(short_idx, data_frame):

    cut_data_frame = data_frame
    for start, end in short_idx:
        if end - start < 10:
            #print(f'Got here {start}')
            cut_data_frame = cut_data_frame.drop(data_frame.index[start:end+1])

    return cut_data_frame


headers = ["current", "voltage", "short", "ref", "rupture"]

data = read_csv('..\data\modified\data_with_rupture.csv', sep = "\t")
data_cut_small_sc = read_csv('..\data\modified\data_with_rupture_cut_small_sc.csv', sep = "\t")
data_cut_all_non_sc = read_csv('..\data\modified\data_with_rupture_cut_all_non_sc.csv', sep = "\t")

# Generate spike rupture signal
# Some signals are higher than 10?

short_list = data.short
short_idx = get_short_circuit_idx(short_list)

rupture_list = get_rupture_region_from_short(short_idx, short_list)

cut_data_frame = remove_small_short_circuits(short_idx, data)

rupture_idx = get_short_circuit_idx(cut_data_frame.rupture)

count = 0
for s,e in rupture_idx:
    if e-s <= 0:
        print(f'zero {e-s}')
    if e-s == 10:
        count += 1

print(len(rupture_idx))
print(count)
#short_idx = [(0,5)]
#short_list = [1 for _ in range(31)]
#print(short_list)
#rupture_list = get_rupture_region_from_short(short_idx, short_list)
#print(rupture_list)



def plot_figure():
    plt.figure()
    start = 12700
    end = 12800
    plt.plot(data_cut_all_non_sc.rupture[start:end], 'y')
    plt.plot(data_cut_all_non_sc.voltage[start:end], 'r')
    plt.legend()
    plt.show()
