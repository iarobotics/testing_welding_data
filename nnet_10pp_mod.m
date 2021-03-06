%% Load data
clear all
clc

% Add path (at beginning of script)
narx = [pwd,'\narx'];
nn_function1 = [pwd,'\nn_function1'];
nn_function2 = [pwd,'\nn_function1'];
addpath(narx);
addpath(nn_function1);
addpath(nn_function2);

%this script is predicting the rupture period
log_start = 0.5e5-2;

% Load Original Migatronic log files
log1 = importdata('data\modified\data1.csv');
log1= log1.data;
cv_1 = log1(log_start:end,1:2);
cvs_1 = log1(log_start:end,1:3);
short_1 = log1(log_start:end,3);
%rupture10_1 = log1(log_start:end,5);
%rupture5_1 = log1(log_start:end,6);
%rupture_spike_1 = log1(log_start:end,7);

log2 = importdata('data\modified\data2.csv');
log2= log2.data;
cv_2 = log2(log_start:end,1:2);
cvs_2 = log2(log_start:end,1:3);
short_2 = log2(log_start:end,3);
%rupture10_2 = log2(log_start:end,5);
%rupture5_2 = log2(log_start:end,6);
%rupture_spike_2 = log2(log_start:end,7);

log3 = importdata('data\modified\data3.csv');
log3= log3.data;
cv_3 = log3(log_start:end,1:2);
cvs_3 = log3(log_start:end,1:3);
short_3 = log3(log_start:end,3);
%rupture10_3 = log3(log_start:end,5);
%rupture5_3 = log3(log_start:end,6);
%rupture_spike_3 = log3(log_start:end,7);

log4 = importdata('data\modified\data4.csv');
log4= log4.data;
cv_4 = log4(log_start:end,1:2);
cvs_4 = log4(log_start:end,1:3);
short_4 = log4(log_start:end,3);
%rupture10_4 = log4(log_start:end,5);
%rupture5_4 = log4(log_start:end,6);
%rupture_spike_4 = log4(log_start:end,7);


train_input = [cv_1; cv_2; cv_3];
%train_input = [cvs_1; cvs_2; cvs_3];

%train_target = [rupture_r1; rupture_r2; rupture_r3];
train_target = [short_1; short_2; short_3];

% New data for testing the model
%test_input = cv_4;
test_input = cvs_4;

test_target = short_4;

clearvars -except train_input train_target test_input test_target


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

%log_end = 1000;
log_end = length(test_input);

d = 20;
n = 10;
x1 = test_input(1:log_end, 1:2)';
%x2 = test_target(1:log_end)';
arc = arc_4(1:log_end)';
xi1 = test_input(1:d, 1:2)';
%xi2 = test_target(1:d)';

%xi1_m = test_input(1:10, 1:2)';
%xi2_m = test_target(1:10)';

% Threshold the actual arc for better plot visibility
%threshold = 0.5;
%y_thresh = arc;
%y_thresh(arc > threshold) = 200;

% NARX - C,V as Input, predict Voltage
%[y_new,xf1_new] = narx_d10_n32(test_input.',xi1_10pp.');
%[y_new,xf1,xf2] = narx_d5_n8(x1,x2,xi1,xi2);
%[y_new_m,xf1,xf2] = narx_d10_n16(x1,x2,xi1_m,xi2_m);

[y_new,xf1] = nn_d20n10(x1, xi1);

% Best voltage pred for d5_n8 and d10_n16%%%%%%%%%%%%%%%%%%%%%
%plot(1:length(y_new),x2,1:length(y_new),y_new),
%plot(1:length(y_new),x2,1:length(y_new),y_new, 1:length(y_new),y_thresh, 1:length(y_new),y_new_m),

%plot(1:len,y_new, 1:len,arc),
%title('Predicted against actual short circuit - Testing'),
%grid on

%% Predict short-circuit
%log_end = length(train_input);
%x1 = train_input(1:log_end, 1:2)';
%xi1 = train_input(1:10, 1:2)';
%[y_new,xf1] = myNeuralNetworkFunction_io(x1, xi1);


%% Save variables to file
threshold = 0.5;
y_thresh = y_new;
y_thresh(y_new < threshold) = 0;
y_thresh(y_new > threshold) = 1;
len = length(y_new);

plot(1:len,arc, 1:len,y_thresh,  1:len,y_new),
title('Predicted rupture region against actual short circuit'),
grid on

% save thresholded output
ys = y_thresh';
save('script\predictions\y_d20_n10.txt', 'ys', '-ASCII')
%save('script\predictions\short_4.txt', 'arc_4', '-ASCII')
%save('script\predictions\rupture_4.txt', 'test_target', '-ASCII')

% Remove path (at end of script/script clean-up)
%rmpath(narx);
%rmpath(nn_function1);
%rmpath(nn_function2);