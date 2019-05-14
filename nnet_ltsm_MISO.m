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

%for i = 1:numel(short_1)
%
%    if short_1(i) == 1
%        short_1(i) = "short";
%    else
%        short_1(i) = "not";
%    end
%
%end