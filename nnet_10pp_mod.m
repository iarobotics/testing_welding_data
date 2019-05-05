%% Load data
clear all
clc

% Add path (at beginning of script)
added_path = [pwd,'/functions']; %change to: added_path = '/path' for your required path
addpath(added_path);

%this script is predicting the rupture period
log_start = 0.5e5-2;

% Load Original Migatronic log files
log1 = importdata('data\log1.txt');
current_voltage_1 = log1(log_start:end,1:2);
voltage_1 = log1(log_start:end,2);
cvs_1 = log1(log_start:end,1:3);
arc_1 = log1(log_start:end,3);

log2 = importdata('data\log2.txt');
current_voltage_2 = log2(log_start:end,1:2);
voltage_2 = log2(log_start:end,2);
cvs_2 = log2(log_start:end,1:3);
arc_2 = log2(log_start:end,3);

log3 = importdata('data\log3.txt');
cvs_3 = log3(log_start:end-4,1:3);
current_voltage_3 = log3(log_start:end-4,1:2);
voltage_3 = log3(log_start:end-4,2);
arc_3 = log3(log_start:end-4,3);

log4 = importdata('data\log4.txt');
cvs_4 = log4(log_start:end-4,1:3);
voltage_4 = log4(log_start:end-4,2);
current_voltage_4 = log4(log_start:end-4,1:2);
arc_4 = log4(log_start:end-4,3);


% Load modifie log files
log_r1 = importdata('data\data_1_cut_first_90p.txt');
rupture_r1 = log_r1(:,3);

log_r2 = importdata('data\data_2_cut_first_90p.txt');
rupture_r2 = log_r2(1:end-5,3);

log_r3 = importdata('data\data_3_cut_first_90p.txt');
rupture_r3 = log_r3(:,3);

train_input = [current_voltage_1; current_voltage_2; current_voltage_3];
%train_input = [cvs_1; cvs_2; cvs_3];
%train_target = [rupture_r1; rupture_r2; rupture_r3];
train_target = [voltage_1;voltage_2;voltage_3];

% New data for testing the model
log_r4 = importdata('data\data_4_cut_first_90p.txt');
test_input = cvs_4;
test_target = log_r4(:,3);

clearvars -except train_input train_target test_input test_target arc_4 added_path


%% Generate prediction y_new
%delay 
xi1_10pp = test_input(1:10, 1:3);

<<<<<<< HEAD
[y_new,xf1_new] = nn_d10n10(current_voltage4.',xi1_10pp.');
=======
[y_new,xf1_new] = nn_d10_n8_csv(test_input.',xi1_10pp.');

% NARX - C,V as Input, predict Voltage
[y_new,xf1_new] = narx_d10_n8(test_input.',xi1_10pp.');
>>>>>>> Cleanup

%% Save variables to file
threshold = 0.75;
y_thresh = y_new;
y_thresh(y_new < threshold) = 0;
y_thresh(y_new > threshold) = 1;

%figure(1)
%plot(1:length(y1),all_arcs,1:length(y1),y1),
<<<<<<< HEAD
%plot(1:length(y_thresh)+2,arc_full,1:length(y_thresh),y_thresh),
%title('Predicted against actual short circuit - Training'),
%grid on
=======
plot(1:length(y_thresh),arc_4,1:length(y_thresh),y_thresh),
title('Predicted against actual short circuit - Testing'),
grid on
>>>>>>> Cleanup

% save thresholded output
ys = y_thresh';
save('script\y_pred.txt', 'ys', '-ASCII')
save('script\y.txt', 'arc_4', '-ASCII')

% Remove path (at end of script/script clean-up)
rmpath(added_path);