function [y1,xf1] = nio_d8n8_r5(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 12-May-2019 23:42:43.
%
% [y1,xf1] = myNeuralNetworkFunction(x1,xi1) takes these arguments:
%   x1 = 3xTS matrix, input #1
%   xi1 = 3x8 matrix, initial 8 delay states for input #1.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 3x8 matrix, final 8 delay states for input #1.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.keep = [1 2];
x1_step2.xoffset = [1361;56];
x1_step2.gain = [0.00110741971207087;0.0176991150442478];
x1_step2.ymin = -1;

% Layer 1
b1 = [0.13006879389303130368;-0.1213954377880780422;-1.737642887990897167;1.3672554529635754239;-0.48802287229221369413;0.43926132605439927037;-2.4174800389281392299;-0.30039138595189290859];
IW1_1 = [-28.9072413273642006 15.038257871840693625 -4.3877769966988990902 7.2064850131265698607 -2.555482656475028147 0.64349220906075843551 7.1699408599207270498 -6.0272076583440110653 11.074032715664669624 -4.2300853413655365998 9.9384556593633242016 -1.7085837633022562532 18.292231869396900379 -7.4638145940616249518 -12.489236466006541804 -0.90439285912443656557;-7.8470853645666558407 4.6883210714634744321 -2.5540279504361369511 0.69123527255027095162 -0.01104654717606566583 0.68236098439531278625 1.822414949245136695 -1.4457766762108841263 4.5803870851761319116 -2.2136040487479853311 2.3985114012495030167 -1.4964473066191958939 0.77872746558709671216 1.2805396625553635559 0.62996119971882069688 -2.1454835137496184316;5.8314435852272916705 4.605334388318511607 0.48182469934744509565 -2.6326274541867751289 -1.6687104886726082942 0.27938693711260892405 5.5348631775719594472 0.76480080202060762851 1.6595784097369776777 0.81220704212846106529 -7.3776545528981145594 -0.08238233759945283452 -4.9538284586367700157 -2.9181094398887461594 0.3325548409311810949 2.5311725114973375739;-6.1465393094514846339 -4.1006513604925043381 0.064766897458732458626 2.3275405852569708287 1.2259290287978232836 -0.15349466541475284553 -3.7122495505429204954 -0.74473854584609222584 -1.6449701960798284173 -0.35509986784209623956 6.0666098947019415633 -0.73707336246855570394 5.4032831762817519206 2.8913240991362458843 -1.0868930048718119519 -2.360377909247899364;-9.0017837995534613071 3.6128855918290869731 2.2633528050824947009 -0.064735797285841958915 -0.53194955021028178521 1.0342470394435474557 0.79651892517288358508 -0.76047064859588686669 3.0402805427677948025 -1.2348124735878389657 1.8675817404493475493 -1.8097536240645002437 1.5671722798673408672 1.3499965676244456425 -0.72228817721786831019 -0.90612223221460386213;15.66681849717509678 -4.6674950464215418933 -8.5848309977770487222 0.89549307445757098112 0.70662778747827326153 -1.6531047695936762487 -0.49572169925617226571 0.69965405208261743919 -3.5185148448943124322 1.0556887582273335457 -2.5470528256667801514 3.1901610128051545168 -2.675149286053966069 -2.7151622497434733106 2.7521812225626267612 0.80013031970810299942;19.745580775064311752 -4.2319862695019372367 -3.2172871628967216751 0.81180092284075466846 -8.171289326545350562 1.600006424068521893 -4.1238235165519832037 -0.21701895851712257879 6.0281195329638448399 -1.2279788501306370119 -3.1579788494350511385 -0.14146096604857116841 -5.6672994407856602805 -1.0657444512377001189 2.191778949815356814 -1.1136034464671658029;-6.5481434728024332514 3.5644225204818842379 -1.2189107179965947836 0.42163064643491826589 -0.17483281791030355623 0.64712282523661690536 1.2159877718863032481 -1.0291734924681172902 3.5035387757557505672 -1.6323633286990799629 1.8395390041176782336 -1.3032889860829917072 0.7464493493786257261 1.1020114415701776078 0.37829601353644359829 -1.5278795572183989648];

% Layer 2
b2 = -1.3418841149451250505;
LW2_1 = [0.77029422870432495696 -6.8219919723336674977 -5.0020465931903883572 -5.0053357652467180827 -12.574970094661249931 -4.4994896212361998877 -0.33539346660651586651 14.120383537966700871];

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
    xdts = mod(ts+7,9)+1;
    
    % Input 1
    temp = removeconstantrows_apply(x1(:,ts),x1_step1);
    xd1(:,xdts) = mapminmax_apply(temp,x1_step2);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5 6 7 8]-1,9)+1),16,1);
    a1 = tansig_apply(b1 + IW1_1*tapdelay1);
    
    % Layer 2
    a2 = b2 + LW2_1*a1;
    
    % Output 1
    y1(:,ts) = mapminmax_reverse(a2,y1_step1);
end

% Final delay states
finalxts = TS+(1: 8);
xits = finalxts(finalxts<=8);
xts = finalxts(finalxts>8)-8;
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