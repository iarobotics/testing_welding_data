function [y1,xf1,xf2] = narx_d10n2(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-May-2019 22:07:26.
%
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

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [588;52];
x1_step1.gain = [0.000550206327372765;0.0045662100456621];
x1_step1.ymin = -1;

% Input 2
x2_step1.xoffset = 0;
x2_step1.gain = 2;
x2_step1.ymin = -1;

% Layer 1
b1 = [3.4472067120150979846;-7.16228275231798861];
IW1_1 = [-13.230546831870782398 -13.488789615271192801 10.161062433554228335 -9.7396420308708684388 -1.8141490665488768652 13.907298009046108689 -3.3888665716531169991 2.9832506267398439803 2.6589144459464932879 10.785993986309126313 4.7884802403202542109 -6.2362274286227625808 8.8116831640317467844 -9.8149839076313725172 -8.0575531088719678507 0.87532526333200522117 0.65672550361399717467 2.6436030030523181011 -0.21658901731548402259 -0.88535053612014646962;54.30192236576552034 -30.16208929996061272 -42.12835779195990682 8.5198180875236406706 -0.67808969433676757887 5.1005553931843659043 -19.000909287764002897 9.1220057812176413847 1.0885367310806939312 0.080818806412116028781 8.8745785501004874618 -2.8362985472132273834 -19.400761077936554244 -0.66276287234772124357 13.439502658819915126 -1.4115152967169888321 7.3127125679537350322 2.5846665186237149925 -1.1114787405830814926 -1.1229016214979659072];
IW1_2 = [-2.1261310570434668321 -1.089359093116961219 -0.61442803304794457731 -0.71635150618567966507 -0.72592500834961382061 0.42512094317210025185 -0.15774694217800311336 -2.0873542643173568223 -0.7179163633243050846 -0.039829956919784678671;2.0236204099445394 1.0066355594902476334 1.0949622613604781396 -1.1115877022910201077 0.097674844237065600039 0.064047319202469532584 -0.04109093841591819618 -0.63445928070170043434 -0.13768209131800404621 -0.23220420095326516075];

% Layer 2
b2 = 0.43457729283559803912;
LW2_1 = [-0.43549789895648038929 0.99893607719209087659];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = mapminmax_apply(xi1,x1_step1);
xd1 = [xd1 zeros(2,1)];

% Input 2 Delay States
xd2 = mapminmax_apply(xi2,x2_step1);
xd2 = [xd2 zeros(1,1)];

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+9,11)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Input 2
    xd2(:,xdts) = mapminmax_apply(x2(:,ts),x2_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5 6 7 8 9 10]-1,11)+1),20,1);
    tapdelay2 = reshape(xd2(:,mod(xdts-[1 2 3 4 5 6 7 8 9 10]-1,11)+1),10,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1 + IW1_2*tapdelay2);
    
    % Layer 2
    a2 = b2 + LW2_1*a1;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(a2,y1_step1);
end

% Final delay states
finalxts = TS+(1: 10);
xits = finalxts(finalxts<=10);
xts = finalxts(finalxts>10)-10;
xf1 = [xi1(:,xits) x1(:,xts)];
xf2 = [xi2(:,xits) x2(:,xts)];
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end