clear all
clc

%this script is predicting the rupture period

log1 = importdata('data_1_cut_first_90p.txt');
%current =log1(0.5e5:end,1);
current_voltage = log1(:,1:2);
arc = log1(:,3);

log2=importdata('data_2_cut_first_90p.txt');
%current2 =log2(0.5e5:end,1);
current_voltage2 = log2(:,1:2);
arc2 = log2(:,3);

log3 = importdata('data_3_cut_first_90p.txt');
current_voltage3 = log3(:,1:2);
arc3 = log3(:,3);

log4 = importdata('data_4_cut_first_90p.txt');
current_voltage4 = log4(:,1:2);
arc4 = log4(:,3);

arc_full = importdata('log4.txt');
arc_full = arc_full(0.5e5:end,3);

all_voltages_10pp = [current_voltage; current_voltage2; current_voltage3];
all_arcs_10pp = [arc; arc2; arc3];

%delay 
xi1_10pp = current_voltage4(1:20, 1:2);
%xi1_10pp = all_voltages(1:20, 1:2);

[y_new,xf1_new] = nn_d20n10(current_voltage4.',xi1_10pp.');

%% Save variables to file
threshold = 0.65;
y_thresh = y_new;
y_thresh(y_new < threshold) = 0;
y_thresh(y_new > threshold) = 0.9;

plot(1:length(y_thresh)+2,arc_full,1:length(y_thresh),y_thresh),
title('Predicted against actual short circuit - Training'),
grid on

% save thresholded output
ys = y_thresh';
save('C:\Users\User\Downloads\temp\y_t.txt', 'ys', '-ASCII')
save('C:\Users\User\Downloads\temp\arc4.txt', 'arc4', '-ASCII')