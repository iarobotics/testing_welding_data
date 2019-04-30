%% Load data
clear all
clc

log1 = importdata('log1.txt');
%current =log1(0.5e5:end,1);
current_voltage = log1(0.5e5:end,1:2);
arc = log1(0.5e5:end,3);

log2=importdata('log2.txt');
%current2 =log2(0.5e5:end,1);
current_voltage2 = log2(0.5e5:end,1:2);
arc2 = log2(0.5e5:end,3);

log3=importdata('log3.txt');
current_voltage3 = log3(0.5e5:end,1:2);
arc3 = log3(0.5e5:end,3);

log4 = importdata('log4.txt');
current_voltage4 = log4(0.5e5:end,1:2);
arc4 = log4(0.5e5:end,3);

all_voltages = [current_voltage; current_voltage2; current_voltage3];
all_arcs = [arc; arc2; arc3];

%delay 
%xi1 = all_voltages(1:10, 1:2);
xi1 = all_voltages(1:20, 1:2);

%% Run NN
%[y1,xf1] = myNeuralNetworkFunction_io(all_voltages.',xi1.');
[y1,xf1] = myNeuralNetworkFunction_10n_20d(all_voltages.',xi1.');

% Threshold the NN y output
%threshold = 0.8;
%y_thresh = y1;
%y_thresh(y1 < threshold) = 0;
%y_thresh(y1 > threshold) = 1;

%plot network output against actual arc for the data used for training
figure(1)
%plot(1:length(y1),all_arcs,1:length(y1),y1),
plot(1:length(y1),all_arcs,1:length(y1),y1),
title('Predicted against actual short circuit - Training'),
grid on


%testing the network on new data
%delays for new data
xi1_test = current_voltage4(1:10, 1:2);

%[y_new,xf1_new] = myNeuralNetworkFunction_io(current_voltage4.',xi1_test.');
[y_new,xf1_new] = myNeuralNetworkFunction_10n_20d(current_voltage4.',xi1_test.');

% Threshold the NN y output
%y_thresh_new = y_new;
%y_thresh_new(y_new < threshold) = 0;
%y_thresh_new(y_new > threshold) = 1;

%plot network output against actual arc
figure(2)
%plot(1:length(y_new),arc4,1:length(y_new),y_new),
plot(1:length(y_new),arc4,1:length(y_new),y_new),
title('Predicted against actual short circuit - Testing'),
grid on


%% Save variables to file
threshold = 0.65;
y_thresh = y1;
y_thresh(y1 < threshold) = 0;
y_thresh(y1 > threshold) = 1;

y_thresh_new = y_new;
y_thresh_new(y_new < threshold) = 0;
y_thresh_new(y_new > threshold) = 1;

ys = y1';
save('C:\Users\Ion Sircu\Desktop\temp\y1.txt', 'ys', '-ASCII')
ys = y_thresh';
save('C:\Users\Ion Sircu\Desktop\temp\y_t.txt', 'ys', '-ASCII')
ys = y_new';
save('C:\Users\Ion Sircu\Desktop\temp\y_new.txt', 'ys', '-ASCII')
ys = y_thresh_new';
save('C:\Users\Ion Sircu\Desktop\temp\y_new_t.txt', 'ys', '-ASCII')
save('C:\Users\Ion Sircu\Desktop\temp\all_arcs.txt', 'all_arcs', '-ASCII')
save('C:\Users\Ion Sircu\Desktop\temp\arc4.txt', 'arc4', '-ASCII')
