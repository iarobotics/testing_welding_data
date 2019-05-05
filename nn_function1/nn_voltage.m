clc
clear all
%_____________________________________________________collect the data from log1.txt

log1 = importdata('log1.txt');
current = log1(0.5e5:end,1);
voltage = log1(0.5e5:end,2);
current_ref = log1(0.5e5:end,4);
load 'feature_volt.mat' % get all 3 features on horizontal

arc = log1(0.5e5:end,3);
arc_inv = arc.'; % gets one horizontal line of target (arc/no arc)

%_____________________________________________________collect the data from log2.txt

log2 = importdata('log2.txt');
current2 = log2(0.5e5:end,1);
voltage2 = log2(0.5e5:end,2);
current_ref2 = log2(0.5e5:end,4);
load 'feature2_volt.mat' % get all 3 features on horizontal

arc2 = log2(0.5e5:end,3);
arc_inv2 = arc.'; % gets one horizontal line of target (arc/no arc)


time_all = 0:0.00002:6.988999;
%table_features = table(current_inv, voltage_inv, current_ref_inv);
%table_target = table(arc_inv);

%configure the net
target = voltage.';
net = feedforwardnet;
net = configure(net, features_volt_cut, target);
net= init(net);

%trains the network
%[net, tr] = train(net, features_volt_cut, target);
%output= net(features2_volt);

%figure(10)
%plotyy(1:length(current2),current2, 1:length(output),output)
%figure(11)
%plotyy(1:length(voltage2),voltage2, 1:length(output),output)