%% Load data
clear all
clc

% Add path (at beginning of script)
narx = [pwd,'/narx']; %change to: added_path = '/path' for your required path
functions = [pwd,'/nn_function1']; %change to: added_path = '/path' for your required path
addpath(narx);
addpath(functions);

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
%train_target = [arc_1;arc_2;arc_3];

% New data for testing the model
log_r4 = importdata('data\data_4_cut_first_90p.txt');
test_input = cvs_4;
test_target = log_r4(:,2);

clearvars -except train_input train_target test_input test_target arc_4 added_path


%% Generate prediction y_new
% [y1,xf1,xf2] = myNeuralNetworkFunction(x1,x2,xi1,xi2) takes these arguments:
%   x1 = 2xTS matrix, input #1
%   x2 = 1xTS matrix, input #2
%   xi1 = 2x10 matrix, initial 10 delay states for input #1.
%   xi2 = 1x10 matrix, initial 10 delay states for input #2.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 2x10 matrix, final 10 delay states for input #1.
%   xf2 = 1x10 matrix, final 10 delay states for input #2.
% where TS is the number of timesteps.
%delay
log_end = 300;
x1 = test_input(1:log_end, 1:2)';
x2 = test_target(1:log_end)';
arc = arc_4(1:log_end)';
xi1 = test_input(1:5, 1:2)';
xi2 = test_target(1:5)';

xi1_m = test_input(1:10, 1:2)';
xi2_m = test_target(1:10)';

threshold = 0.75;
y_thresh = arc;
y_thresh(arc > threshold) = 200;

% NARX - C,V as Input, predict Voltage
%[y_new,xf1_new] = narx_d10_n32(test_input.',xi1_10pp.');
[y_new,xf1,xf2] = narx_d5_n8(x1,x2,xi1,xi2);
[y_new_m,xf1,xf2] = narx_d10_n16(x1,x2,xi1_m,xi2_m);

% Best voltage pred for d5_n8 and d10_n16%%%%%%%%%%%%%%%%%%%%%
%plot(1:length(y_new),x2,1:length(y_new),y_new),
plot(1:length(y_new),x2,1:length(y_new),y_new, 1:length(y_new),y_thresh, 1:length(y_new),y_new_m),
title('Predicted against actual short circuit - Testing'),
grid on

%% Save variables to file
threshold = 0.75;
y_thresh = y_new;
y_thresh(y_new < threshold) = 0;
y_thresh(y_new > threshold) = 1;


plot(1:length(y_thresh),arc_4,1:length(y_thresh),y_thresh),
title('Predicted against actual short circuit - Testing'),
grid on

% save thresholded output
ys = y_thresh';
save('script\y_pred.txt', 'ys', '-ASCII')
save('script\y.txt', 'arc_4', '-ASCII')

% Remove path (at end of script/script clean-up)
rmpath(narx);
rmpath(functions);