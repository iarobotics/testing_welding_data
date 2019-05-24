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


#headers = ["current", "voltage", "short", "ref"]
headers = ["current", "voltage", "short", "iac", "ref"]

data = read_csv('..\data\log4.txt', names=headers, sep = "\t")
#data = read_csv('..\data\log_iac.txt', names=headers, sep = "\t", skiprows=50000)
pred = read_csv('d10n16_r5_thr065.txt', names=["rpred"], sep = "\n")
#log3 = read_csv('..\data\log3.txt', names=headers, sep = "\t")

#d10n4_r10_thr05
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

# rupture_list_spike, _ = get_rupture_region_from_short(short_idx, short_list, region_size=10, spike_rupture=True)
# data['rupture_spike'] = rupture_list_spike


# New data frame with removed non-short-circuit samples
data_cut_non_sc = data[data.short != 0]


#data.to_csv('..\data\modified\data4.csv', index=False, sep='\t')
#data_cut_non_sc.to_csv('..\data\modified\data4_cut_non_sc.csv', index=False, sep='\t')

d=10
start = 50000+d-1
#end = 50500+d-1
end = 60500+d-1

# plt.figure()
# plt.plot(data.short[start:end], color='b', linewidth=2)
# #plt.plot(data.short[start:end], color='b')
# plt.plot(data.rupture_5[start:end], color='y', linestyle='--')
# #plt.plot(data.rupture_10[start:end], color='g', linestyle='--')
# #plt.plot(data.rupture_spike[start:end], color='r', linestyle='--')
# #plt.plot(pred.rpred[:1000], color='y', linestyle='--')
# plt.legend()

# plt.figure()
# #plt.plot(data_cut_non_sc.short[start:end], color='b', linewidth=3)
# plt.plot(data_cut_non_sc.short[start:end], color='b')
# plt.plot(data_cut_non_sc.rupture_5[start:end], color='y')
# plt.plot(data_cut_non_sc.rupture_10[start:end], color='g')
# plt.plot(data_cut_non_sc.rupture_spike[start:end], color='r', linestyle='--')
# plt.legend()


plt.figure()
plot_len = 6


plt.subplot(plot_len, 1, 1)
plt.plot(data.values[start:end, 0], color='r')
plt.title('Current', y=0.5, loc='left', color='r')

plt.subplot(plot_len, 1, 2)
plt.plot(data.values[start:end, 1], color='b')
plt.title('Voltage', y=0.5, loc='left', color='b')

plt.subplot(plot_len, 1, 3)
plt.plot(data.values[start:end, 2], color='c')
plt.title('Short-circuit', y=0.5, loc='left', color='c')

plt.subplot(plot_len, 1, 4)
plt.plot(data.values[start:end, 3], color='c')
plt.title('IAC', y=0.5, loc='left', color='c')

plt.subplot(plot_len, 1, 5)
plt.plot(data.values[start:end, 5], color='y')
plt.title('Rupture', y=0.5, loc='left', color='y')

plt.subplot(plot_len, 1, 6)
plt.plot(data.values[start:end, 4], color='y')
plt.title('ref', y=0.5, loc='left', color='y')

# plt.subplot(plot_len, 1, 3)
# plt.plot(data_cut_non_sc.values[start:end, 5], color='g')
# plt.plot(pred.values[:500, 0], color='r')
# plt.title('Rupture_5', y=0.5, loc='left', color='g')

# plt.subplot(plot_len, 1, 5)
# plt.plot(pred.values[:500, 0], color='g')
# plt.title('Rupture predicted', y=0.5, loc='left', color='g')

#plt.show()

#short_idx = get_short_circuit_idx(data_cut_non_sc.rupture_5)
short_idx = get_short_circuit_idx(data_cut_non_sc.values[start:,5]) # index of rupture 10
#short_idx = get_short_circuit_idx(data_cut_non_sc.values[start:,6]) # index of rupture 5


# count = 0
# for s,e in short_idx:
#     print(e-s)
#     if e-s <= 0:
#         print(f'zero {e-s}')
#     if e-s == 10:
#         count += 1
# print(count)
# print(len(short_idx))


def get_pass_fail_old(short_idx):

    passed_5 = 0
    failed_5 = 0
    passed_10 = 0
    failed_10 = 0

    margin = 1

    end_prev = 0
    for start, end in short_idx:
        # All samples before the rupture period in current short-circuit
        failed = False
        passed = False
        for val in pred.values[end_prev:start,0]:
            if val:
                failed = True

        if not failed:
            for val in pred.values[start:end-margin,0]:
                if val:
                    passed_5 += 1
                    passed = True
                    break
            if not passed:
                failed_5 += 1
        else:
            failed_5 += 1

        end_prev = end

    end_prev = 0
    for start, end in short_idx:
        # All samples before the rupture period in current short-circuit
        failed = False
        passed = False
        for val in pred.values[end_prev:start-5,0]:
            if val:
                failed = True

        if not failed:
            for val in pred.values[start-5:end-margin,0]:
                if val:
                    passed_10 += 1
                    passed = True
                    break
            if not passed:
                failed_10 += 1
        else:
            failed_10 += 1

        end_prev = end

    print(f"Passed_10: {passed_5}")
    print(f"Failed_10: {failed_5}")
    print(f"R10 Got {passed_5+failed_5} out of {len(short_idx)}")
    print(f"Passed_5: {passed_10}")
    print(f"Failed_5: {failed_10}")
    print(f"R5 Got {passed_10+failed_10} out of {len(short_idx)}")

def get_pass_fail(short_idx, values):

    """
    Compare generated rupture with prediction - get short_idx of rupture_10 and compare against prediction of rupture_5
    For every short-circuit region see if there are any predicted values before the rupture period begins ---> Clasify as a failure
    If not a single prediction is made inside the rupture region ---> Clasify as a failure
    Else, if there are any predicted values from rupture_start to rupture_end - margin ---Pass

    Since the end idx of a rupture perdio and short-circuit coincide, short circuits last between "end" idx of rupture periods
    """

    pass_count = 0
    fail_count = 0

    margin = 1 # equivalent to leaving 2 samples before short/rupture end

    end_prev = 0
    for start, end in short_idx:
        # All samples before the rupture period in current short-circuit
        failed = False
        passed = False
        for val in values[end_prev:start]:
            if val:
                failed = True

        if not failed:
            for val in values[start:end-margin]:
                if val:
                    pass_count += 1
                    passed = True
                    break
            if not passed:
                fail_count += 1
        else:
            fail_count += 1

        end_prev = end

    print(f"Passes: {pass_count}")
    print(f"Failures: {fail_count}")
    print(f"Got {pass_count+fail_count} out of {len(short_idx)}")
    print(" ")


#get_pass_fail(short_idx, data_cut_non_sc.values[:,3])
get_pass_fail(short_idx, pred.values[:,0])

test = data.values[:,3]

"""
At this point we have a data frame with 5 columns.
The firth one being rupture, set to a fixed size of 10 samples.
Short-circuit period with less than 10 samples are not assigned a rupture region.
All short-circuits less than 10 samples are also removed
"""
