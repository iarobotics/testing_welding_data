log1=importdata('log1.txt');
current = log1(0.5e5:end,1);
voltage = log1(0.5e5:end,2);
diff_voltage=diff(voltage)
arc=log1(0.5e5:end,3);

figure(1)
plot(current, '.')
figure(11)
plot(voltage)
figure(12)
plotyy(1:length(current),current, 1:length(voltage),voltage)
figure(13)
plotyy(1:length(voltage), voltage, 1:length(arc), arc)

%log2=importdata('log2.txt');
%measured_current_log2 = log2(:,1);
%voltage_log2 = log2(:,2);
%short_log2 = log2(:,3)
time= [0.5e5:0.00002:7]
%plot(time,measured_current_log2)
%xlabel('Time / Days');
%ylabel('measured_current')

