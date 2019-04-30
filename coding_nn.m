clc
clear all
%% 

%load 'log1_features.mat';
%load 'log1_target.mat';
%features = log1_features.';
%current = log1_features(0.5e5:end,1);
%voltage = log1_features(0.5e5:end,2);
%current_ref = log1_features(0.5e5:end,3);
%arc = log1_target(0.5e5:end);
%diff_voltage = diff(voltage);

%_____________________________________________________collect the data from log1.txt

log1 = importdata('log1.txt');
log1_inv=log1.';
current = log1(0.5e5:end,1);
voltage = log1(0.5e5:end,2);
current_ref = log1(0.5e5:end,4);
load 'features_cut.mat' % get all 3 features on horizontal

%current_inv = current.';
%voltage_inv = voltage.';
%current_ref_inv = current_ref.';

arc = log1(0.5e5:end,3);
arc_inv = arc.'; % gets one horizontal line of target (arc/no arc)

% ____________________________________________________collect the data from log2.txt
log2=importdata('log2.txt');
current2 = log2(0.5e5:end,1);
voltage2 = log2(0.5e5:end,2);
current_ref2 = log2(0.5e5:end,4);
arc2 = log2(0.5e5:end,3);
arc_inv2 = arc2.'; % gets one horizontal line of target (arc/no arc)

%current_inv2 = current2.';
%voltage_inv2 = voltage2.';
%current_ref_inv2 = current_ref2.';
load 'features2_cut.mat' % get all 3 features on horizontal

%_____________________________________________________collect the data from log3.txt

log3 = importdata('data_3.txt');
current3 = log3(0.5e5:end,1);
voltage3 = log3(0.5e5:end,2);
current_ref3 = log3(0.5e5:end,4);
arc3 = log3(0.5e5:end,3);
arc_inv3 = arc3.'; % gets one horizontal line of target (arc/no arc)

%current_inv3 = current3.';
%voltage_inv3 = voltage3.';
%current_ref_inv3 = current_ref3.';
load 'features3_cut.mat' % get all 3 features on horizontal

%_____________________________________________________collect the data from log110.txt

log110 = importdata('data_110.txt');
current110 = log110(0.5e5:end,1);
voltage110 = log110(0.5e5:end,2);
current_ref110 = log110(0.5e5:end,4);
arc110 = log110(0.5e5:end,3);
arc_inv110 = arc110.'; % gets one horizontal line of target (arc/no arc)

%current_inv110 = current110.';
%voltage_inv110 = voltage110.';
%current_ref_inv110 = current_ref110.';
load 'features110_cut.mat' % get all 3 features on horizontal

%time_all = 0:0.00002:6.99;
load 'time.mat'
time=time_all.';
%table_features = table(current_inv, voltage_inv, current_ref_inv);
%table_target = table(arc_inv);

target = arc_inv;

%creates a two-layer network with 10 neurons in the hidden layer. 
%(During the configuration step, the number of neurons in the output layer is set to one, 
%which is the number of elements in each vector of targets.
net = feedforwardnet;
net = configure(net, features_cut, target);
net= init(net);

%trains the network
%[net, tr] = train(net, features_cut, target);
output= net(features_cut);

figure(10)
plotyy(1:length(current),current, 1:length(output),output)
figure(11)
plotyy(1:length(arc),arc, 1:length(output),output)