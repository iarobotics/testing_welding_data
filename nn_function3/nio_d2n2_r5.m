function [y1,xf1] = nio_d2n2_r5(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
% 3 inp
% Auto-generated by MATLAB, 12-May-2019 22:49:33.
%
% [y1,xf1] = myNeuralNetworkFunction(x1,xi1) takes these arguments:
%   x1 = 3xTS matrix, input #1
%   xi1 = 3x2 matrix, initial 2 delay states for input #1.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 3x2 matrix, final 2 delay states for input #1.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.keep = [1 2];
x1_step2.xoffset = [1361;56];
x1_step2.gain = [0.00110741971207087;0.0176991150442478];
x1_step2.ymin = -1;

% Layer 1
b1 = [1.0828351588974640674;1.2867523127539679528];
IW1_1 = [-24.20624878468539265 16.176181871900677578 22.771505375087169654 -11.163332625100830242;13.167554213961917497 -6.3067454842864414388 -11.201203440593980432 3.1942627418464408784];

% Layer 2
b2 = -1.0038766520753488187;
LW2_1 = [0.93654251386997766637 0.93143724757268409054];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = removeconstantrows_apply(xi1,x1_step1);
xd1 = mapminmax_apply(xd1,x1_step2);
xd1 = [xd1 zeros(2,1)];

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+1,3)+1;
    
    % Input 1
    temp = removeconstantrows_apply(x1(:,ts),x1_step1);
    xd1(:,xdts) = mapminmax_apply(temp,x1_step2);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2]-1,3)+1),4,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1);
    
    % Layer 2
    a2 = b2 + LW2_1*a1;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(a2,y1_step1);
end

% Final delay states
finalxts = TS+(1: 2);
xits = finalxts(finalxts<=2);
xts = finalxts(finalxts>2)-2;
xf1 = [xi1(:,xits) x1(:,xts)];
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Remove Constants Input Processing Function
function y = removeconstantrows_apply(x,settings)
y = x(settings.keep,:);
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
