clear all
clc

%this script is predicting the rupture period

%log1 = importdata('data_1_cut_first_90p.txt');
log1 = importdata('log1.txt');
%current =log1(0.5e5:end,1);
all_data = log1(0.5e5:end,1:4);
current_voltage = log1(0.5e5:end,1:2);
current_voltage_arc = log1(0.5e5:end,1:3);
arc = log1(0.5e5:end,3);

%log2=importdata('data_2_cut_first_90p.txt');
log2 = importdata('log2.txt');
all_data2 = log2(0.5e5:end,1:4);
%current2 =log2(0.5e5:end,1);
current_voltage2 = log2(0.5e5:end,1:2);
current_voltage_arc2 = log2(0.5e5:end,1:3);
arc2 = log2(0.5e5:end,3);

%log3 = importdata('data_3_cut_first_90p.txt');
log3 = importdata('log3.txt');
all_data3 = log3(0.5e5:end,1:4);
current_voltage3 = log3(0.5e5:end,1:2);
current_voltage_arc3 = log3(0.5e5:end,1:3);
arc3 = log3(0.5e5:end,3);

%log4 = importdata('data_4_cut_first_90p.txt');
log4 = importdata('log4.txt');
current_voltage4 = log4(0.5e5:end,1:2);
current_voltage_arc4 = log4(0.5e5:end,1:3);
voltage4 = log4(0.5e5:end,2);
arc4 = log4(0.5e5:end,3);

%arc_full = importdata('log4.txt');
%arc_full = arc_full(0.5e5:end,3);

all_data_concatenated = [all_data; all_data2; all_data3];
%all_voltages_10pp = [current_voltage; current_voltage2; current_voltage3];
all_voltages = [current_voltage; current_voltage2; current_voltage3];
all_voltages_arc = [current_voltage_arc; current_voltage_arc2; current_voltage_arc3];
%all_arcs_10pp = [arc; arc2; arc3];
all_arcs = [arc; arc2; arc3];

%%%%%new rupture region predicted
new_cut_region = importdata('short_1_2_3_rupture.txt');


%delay 
%xi1_10pp = current_voltage4(1:20, 1:2);
xi1 = current_voltage4(1:10, 1:2);
%xi2 = voltage4(1:10, 1);
delay_3inputs = current_voltage_arc4(1:10, 1:3);
delay_arc4 = arc4(1:10,1);
%xi1 = all_voltages(1:10, 1:2);

%try this later
%[y_new,xf1_new] = narx_d10n10_3inputs(current_voltage_arc4.', delay_3inputs.', arc4.', delay_arc4.');
[y_new,xf1_new] = nn_d10n10newrupture(current_voltage4.', xi1.');

%% Save variables to file
threshold = 0.5;
y_thresh = y_new;
y_thresh(y_new < threshold) = 0;
y_thresh(y_new > threshold) = 1;
%y_needed_for_alldatafiles = y_thresh.'

plot(1:length(y_thresh),arc4,1:length(y_thresh),y_thresh),
title('Predicted rupture region against actual short circuit - Testing on doc4'),
grid on

% save thresholded output
ys = y_thresh';
save('script\y_pred.txt', 'ys', '-ASCII')
save('script\y.txt', 'arc4', '-ASCII')