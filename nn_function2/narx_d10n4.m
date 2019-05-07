function [y1,xf1,xf2] = narx_d10n4(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-May-2019 22:14:20.
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
b1 = [-3.7629277790912190049;-5.1194012714271934783;5.4792414174288808226;5.3055097732245073416];
IW1_1 = [-6.1038743300100177791 5.0581401830493089022 4.1005236903850370567 -2.2801428110993522402 3.9010171306434089367 -1.2964467147110916301 0.78642425215341460465 -2.3898590925915610406 0.30731484117314689097 0.091305749650103712467 -0.26511759808884355349 2.2726298005384388823 0.94637952705061212377 0.92659808413720678999 0.56145180940979433348 -0.63514957845750164012 -2.4394303903566614267 -0.15931607186450308378 -1.2950701900876488981 -1.1744197426980715893;18.19261148190789612 -15.556168303136438169 -5.0782464017693609293 5.3471941274713508108 -5.2353043642478747088 1.9585570045331861522 -7.6062852269486667112 4.5623012073900062191 -1.7222488101833723917 1.8942636961034762244 1.8665743609151939086 -3.2229904475958308652 -1.1476731611708528291 -1.3638679001033269245 -2.2293928624459105059 -0.57187056543667025288 2.6377729817536117451 -1.9691988617680764584 2.2156191309237174281 1.519103070864829208;-29.533781025965616607 20.514116493038290656 16.045660848191701575 -8.3920969436443098033 3.9885783707114512708 -0.78043282258899027148 11.131383067986243773 -6.6557173087652437005 -1.3048927554504885507 -1.8875789835068945699 -2.3269252645681905989 2.7109939402734783975 6.7659184540191370516 2.7542443260252915671 -2.4244038815459987291 0.10704013262179044863 -4.3317935210383380351 0.64551800921028079649 -0.14417956595892178484 -0.84727572698996600487;-16.547938637710768006 6.8869831371007226295 1.8992898160142743791 -1.1059925276320221599 5.6188482572335942677 1.1829865546175579727 0.92230942317680919551 -1.5498059101280796668 4.1426110731615031213 -2.6077447017141541785 2.4618901039825540344 0.75111036932399910526 -0.005193004003745810282 1.026990955057577537 3.1202105547391467688 1.865252087671107839 -2.0692317803182396219 2.3611594910407753822 -1.9050836303114953019 -2.156230584769585068];
IW1_2 = [1.6741674174349312487 -0.23167758551045417037 -0.11933419982976514739 0.37365648804779971748 -0.083777458679230254468 -0.23658539602117739653 -0.32613806281439500223 0.67612998292919634924 -0.11907773524844617041 -0.23879272058860817607;1.7270072111207830368 0.06800327495162421243 0.59974729708765384117 -0.22922145351121156476 0.14886202310900248369 0.12179010256733896478 -0.51297852916369113263 -0.42697776954160604479 0.2510414619033286554 -0.68050877912268536996;-1.6036325260587853681 -0.48764059036445006612 -0.7559209493084820819 0.65309148490711688151 -0.2202749989561738897 -0.096872920386105787482 0.39134227867965010184 0.41894489441320925671 -0.095203896858329126185 0.50033917281618800477;-2.4275528324418114146 0.24556699705915954746 -0.21869364185925718735 -0.59348925393097617942 0.10465451954447979599 0.11254850689921991336 0.55679997495488076087 0.17848156153015007352 -0.25405027684717129688 0.7412860213087454353];

% Layer 2
b2 = -2.3967485000768045111;
LW2_1 = [-2.4075527864133108302 -2.9838833763688730194 -2.732908039697893976 -1.2615379231762511303];

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
