clc
clear all

log = importdata('data/modified/data_all_2use.txt');
%current =log1(0.5e5:end,1);
current_voltage_short = log(:,1:3);
current_voltage = log(:,1:2);
rupture10 = log(:,5);

log1 = importdata('data1.csv');
%current =log1.data(0.5e5:end,1);
current_voltage_short1 = log1.data(0.5e5:end,1:3);
current_voltage1 = log1.data(0.5e5:end,1:2);
rupture1_10 = log1.data(0.5e5:end,5);
rupture1_5 = log1.data(0.5e5:end,6);
short1 = log1.data(0.5e5:end,3);

log1_nonsc = importdata('data1_cut_non_sc.csv');
current_voltage1_nonsc = log1_nonsc.data(0.5e5:end,1:2);
current_voltage_arc1_nonsc = log1_nonsc.data(0.5e5:end,1:3);
rupture1_10nonsc = log1_nonsc.data(0.5e5:end,5);
rupture1_5nonsc = log1_nonsc.data(0.5e5:end,6);
spike1_nonsc = log1_nonsc.data(0.5e5:end,7);

log2 = importdata('data2.csv');
%current =log2.data(0.5e5:end,1);
current_voltage_short2 = log2.data(0.5e5:end,1:3);
current_voltage2 = log2.data(0.5e5:end,1:2);
rupture2_10 = log2.data(0.5e5:end,5);
rupture2_5 = log2.data(0.5e5:end,6);
short2 = log2.data(0.5e5:end,3);

log2_nonsc = importdata('data2_cut_non_sc.csv');
current_voltage2_nonsc = log2_nonsc.data(0.5e5:end,1:2);
current_voltage_arc2_nonsc = log2_nonsc.data(0.5e5:end,1:3);
rupture2_10nonsc = log2_nonsc.data(0.5e5:end,5);
rupture2_5nonsc = log2_nonsc.data(0.5e5:end,6);
spike2_nonsc = log2_nonsc.data(0.5e5:end,7);

log3 = importdata('data3.csv');
%current =log3.data(0.5e5:end,1);
current_voltage_short3 = log3.data(0.5e5:end,1:3);
current_voltage3 = log3.data(0.5e5:end,1:2);
rupture3_10 = log3.data(0.5e5:end,5);
rupture3_5 = log3.data(0.5e5:end,6);
short3 = log3.data(0.5e5:end,3);

log3_nonsc = importdata('data3_cut_non_sc.csv');
current_voltage3_nonsc = log3_nonsc.data(0.5e5:end,1:2);
current_voltage_arc3_nonsc = log3_nonsc.data(0.5e5:end,1:3);
rupture3_10nonsc = log3_nonsc.data(0.5e5:end,5);
rupture3_5nonsc = log3_nonsc.data(0.5e5:end,6);
spike3_nonsc = log3_nonsc.data(0.5e5:end,7);

log4 = importdata('data4.csv');
%current =log4.data(0.5e5:end,1);
current_voltage_short4 = log4.data(0.5e5:end,1:3);
current_voltage4 = log4.data(0.5e5:end,1:2);
rupture4_10 = log4.data(0.5e5:end,5);
rupture4_5 = log4.data(0.5e5:end,6);
short4 = log4.data(0.5e5:end,3);

log4_nonsc = importdata('data4_cut_non_sc.csv');
current_voltage4_nonsc = log4_nonsc.data(0.5e5:end,1:2);
current_voltage_arc4_nonsc = log4_nonsc.data(0.5e5:end,1:3);
rupture4_10nonsc = log4_nonsc.data(0.5e5:end,5);
rupture4_5nonsc = log4_nonsc.data(0.5e5:end,6);
spike4_nonsc = log4_nonsc.data(0.5e5:end,7);

all3_curr_volt_sc = [current_voltage_short1; current_voltage_short2; current_voltage_short3];
all3_curr_volt = [current_voltage1; current_voltage2; current_voltage3];
all3_short = [short1; short2; short3];
all3_curr_volt_nonsc = [current_voltage1_nonsc; current_voltage2_nonsc; current_voltage3_nonsc];
all3_curr_volt_arc_nonsc = [current_voltage_arc1_nonsc; current_voltage_arc2_nonsc; current_voltage_arc3_nonsc];
all3_rupture10 = [rupture1_10; rupture2_10; rupture3_10];
all3_rupture5 = [rupture1_5; rupture2_5; rupture3_5];
all3_rupture10_nonsc = [rupture1_10nonsc; rupture2_10nonsc; rupture3_10nonsc];
all3_rupture5_nonsc = [rupture1_5nonsc; rupture2_5nonsc; rupture3_5nonsc];
spike_nonsc = [spike1_nonsc; spike2_nonsc; spike3_nonsc];


%delay 
%xi1 = all_voltages(1:10, 1:2);
%xi1 = all3_curr_volt_sc(1:2, 1:3);
xi1 = current_voltage_short4(1:10, 1:3);%----
xi2 = all3_short(1:2, 1);
%xi1_nonsc = all3_curr_volt_nonsc(1:10, 1:2);
xi1_nonsc = current_voltage_arc4_nonsc(1:10, 1:3);

delete_delayfrom_target = all3_rupture10(2:end, 1);
delayed_all3_curr_volt_arc_nonsc = all3_curr_volt_arc_nonsc(33:end, 1:3);
delayed_all3_cur_volt = all3_curr_volt(3:end, 1:2);
delayed_all3_short = all3_short(3:end, 1);
delayed_all3_curr_volt_sc = all3_curr_volt_sc(11:end, 1:3);
delayed_all3_rupture10_nonsc = all3_rupture10_nonsc(11:end, 1);
delayed_all3_rupture5_nonsc = all3_rupture5_nonsc(33:end, 1);
delayed_current_voltage_arc4_nonsc = current_voltage_arc4_nonsc(11:end, 1:3); 
delayed_current_voltage_short4 = current_voltage_short4(11:end, 1:3);

%% Run NN
%[y1,xf1] = myNeuralNetworkFunction_io(all_voltages.',xi1.');
[y1,xf1] = nio_d10n2_r10(delayed_current_voltage_arc4_nonsc.', xi1_nonsc.');

% Threshold the NN y output
threshold = 0.3;
y_thresh = y1;
y_thresh(y1 < threshold) = 0;
y_thresh(y1 > threshold) = 1;

% save thresholded output
ys = rupture4_10nonsc(11:end,1); % actual signal of the rupture - not predicted
save('script\y.txt', 'ys', '-ASCII')
ys=y_thresh'; % thresholded prediction
save('script\d10n2_r10_thr065.txt', 'ys', '-ASCII')

%[n,m] = perfcurve(rupture4_10nonsc(11:end,1), y_thresh, '1');
%plot(n,m)


%plot network output against actual arc for the data used for training
%figure(1)
%plot(1:length(y1),all_arcs,1:length(y1),y1),
%plot(1:length(y_thresh),spike_nonsc,1:length(y_thresh),y_thresh),
%title('Predicted rupture against actual rupture - Training'),
%grid on