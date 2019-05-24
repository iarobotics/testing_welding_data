clc
clear all

narx = [pwd,'\narx'];
nn_function1 = [pwd,'\nn_function1'];
nn_function3 = [pwd,'\nn_function3'];
addpath(narx);
addpath(nn_function1);
addpath(nn_function3);

% log4_nonsc = importdata('data4_cut_non_sc.csv');
% current_voltage4_nonsc = log4_nonsc.data(0.5e5:end,1:2);
% current_voltage_arc4_nonsc = log4_nonsc.data(0.5e5:end,1:3);
% rupture4_10nonsc = log4_nonsc.data(0.5e5:end,5);
% rupture4_5nonsc = log4_nonsc.data(0.5e5:end,6);
%start = 0.5e5;
start = 1;
log_iac = importdata('data\modified\data_iac_cut_non_sc.csv');
current_voltage_arc_nonsc = log_iac.data(start:end,1:3);

delay = 4;
x_initial = current_voltage_arc_nonsc(1:delay, 1:3);

x_input = current_voltage_arc_nonsc(delay+1:end, 1:3); 

%% Run NN
%[y1,xf1] = myNeuralNetworkFunction_io(all_voltages.',xi1.');
%[y1,xf1] = nio_d10n16_r5(x_input.', x_initial.');
[y1,xf1] = nio_d4n4_r5(x_input.', x_initial.');


% Threshold the NN y output
threshold = 0.65;
y_thresh = y1;
y_thresh(y1 < threshold) = 0;
y_thresh(y1 > threshold) = 1;

% save thresholded output
ys=y_thresh'; % thresholded prediction
save('script\iac_d4n4_r5_thr065.txt', 'ys', '-ASCII')


%plot network output against actual arc for the data used for training
%figure(1)
%plot(1:length(y1),all_arcs,1:length(y1),y1),
%plot(1:length(y_thresh),spike_nonsc,1:length(y_thresh),y_thresh),
%title('Predicted rupture against actual rupture - Training'),
%grid on