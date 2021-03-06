function [y1,xf1] = nn_d10_n2(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2019 22:22:39.
%
% [y1,xf1] = myNeuralNetworkFunction(x1,xi1) takes these arguments:
%   x1 = 2xTS matrix, input #1
%   xi1 = 2x10 matrix, initial 10 delay states for input #1.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 2x10 matrix, final 10 delay states for input #1.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [588;52];
x1_step1.gain = [0.000550206327372765;0.0045662100456621];
x1_step1.ymin = -1;

% Layer 1
b1 = [-1.5922722673243057123;-7.2141638242147330118];
IW1_1 = [-20.40128701692649571 18.88433226863184089 -1.3980631607868512223 3.4965531681087886895 -5.0231055697694451112 6.4009532913447060309 5.8040294122026843127 1.5723029165663919837 8.7505106836557491334 -0.010896179071506556513 -0.45583055747739398278 -4.8646601163040230631 9.8918930985099944309 -7.2330322488898124433 7.0931063249588603981 0.82965079735726654508 9.6726989809541112919 -0.14790517546212500477 -14.356518601228307475 -16.754763646888481077;-74.155161297807225651 55.101230706020203343 -39.864020989198635903 31.112810559954141354 -24.239800228604032384 24.184107300396259888 -0.36379594604393816759 9.8884342821891948461 25.921557743400967411 -3.2226877676584719801 18.664902875842706464 -7.6957748688258940106 39.71708428469682417 -23.714065754264993302 34.287317837898932282 -18.528901655026992046 16.985612598464211231 -23.152952830250999483 8.0836852336447666545 -52.20778809445245372];

% Layer 2
b2 = -0.98011219334052224195;
LW2_1 = [-0.92202230793176720436 0.90200155416052196777];

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

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+9,11)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5 6 7 8 9 10]-1,11)+1),20,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1);
    
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
