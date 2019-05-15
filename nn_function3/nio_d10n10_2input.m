function [y1,xf1] = nio_d10n10_2input(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
% this is without 50000 samples out on rupture 10
% Auto-generated by MATLAB, 10-May-2019 20:11:42.
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
x1_step1.xoffset = [0;18];
x1_step1.gain = [0.000431965442764579;0.0019782393669634];
x1_step1.ymin = -1;

% Layer 1
b1 = [7.8829274882528466151;4.2783855562984545173;-29.061157515471816026;-18.045457345736409138;-8.3361784287503812862;5.0349278207920136197;23.676423427982179248;7.6325596038346672501;-14.043698288977262578;-7.1206775206527117561];
IW1_1 = [-2.9497077696117388612 0.44565636821128945533 -1.730349004724498041 0.88126988699552089024 -1.4710032272019553101 0.65800040541676230177 -2.1939654301749742515 0.94110112815884483517 -2.2587313005806262112 1.2170357504831954554 -2.2667851525769333598 1.1822892591701270604 -2.5402588848115179587 0.79341832442923343471 -2.1815173373258072154 0.25529806436109359069 -1.8379997708536381928 -0.3982274592441526484 -1.6994009314735845084 -1.5569162358517933953;-4.0284094634025464643 5.6926427215574992857 -3.5904126300464902499 4.0935305045129224411 -1.7737587017161109415 2.5144192065730877061 -0.50220323974786484911 -0.42417526349448780865 1.3209805789246340524 -0.9483237139037588026 2.0209050256403728874 -1.4207153484112167163 3.8072475242569141507 -0.29770437936496202402 3.1208134270645948583 -1.1533726961497525743 1.0503684629767500169 -1.0384608861951643011 -1.102495410029745937 -3.7647485308476165144;22.32712021546818093 -26.997665131688552975 4.7472653164204263732 -9.0977131026256792268 1.2266759796328023935 0.48830704710769712307 -3.1427926507962449243 5.4412141938346110237 -6.7820694486772223897 1.1330515842974759888 -5.3327278698711211291 -1.712775608183950915 -6.1787632438436315141 -0.66638069642514552449 -0.81741190390624185458 -2.0864456733469367578 2.302457820534001609 -1.8421983044120597839 -3.9674186899550005769 1.0184172306047440948;8.8937524326406958153 -14.910293236031460395 5.525296532790489934 -4.3321235208331518862 1.5657989128530980238 3.5629719983938561434 -1.7389147032210137134 3.1322709943196258564 -3.6096649127045568051 -0.21931081117345718745 -2.7441420285268853796 -2.915325826951749022 -0.31937125664598692287 -4.17672185156400122 1.464359498027470563 -0.97322220173157802936 0.34673771158185107133 -0.86938835978390682779 -6.4982302077235774007 -0.1121618439091915248;9.5380030602710164089 -10.622331466927793286 3.4519370396363555642 -4.6439850147228582955 0.41380304418909408248 -1.9967136114841399497 -1.9031392587761677415 1.82149007358510584 -2.7432172790134488061 1.3140186691512116823 -3.015341786066377594 0.68132105131223419381 -4.0052307964444207045 1.7286828112348664455 -1.6820179626684994556 0.45666059382589724303 0.46740980991668912292 0.90334860210730072438 0.42929124715333849549 1.1240362367698832902;-6.0048057530829099804 7.1090604806651542802 -3.9835080445217960765 5.6176557764385792737 -1.4270070014173552586 1.2342726620139496951 -0.018227264900709111428 -0.9994781602282617472 1.4205597471586477454 -0.75075031435288330783 2.2113671314098595211 -0.6322555114405949972 4.2187909637897273996 -0.43316018585036075716 4.2099471475671705889 -0.14742739099030988115 1.2551325487245672541 -1.2653856780763832468 -1.6842848925547582173 -5.180206996747235948;-19.85788320797791684 23.814465212226405555 -2.7511543623238559064 5.3028495731700839855 -0.086306953855788473562 -0.11546220684605257301 2.5654271171614349001 -4.4752276649068862824 4.8759585330057806374 -1.4294253439939108574 4.3767355068157485221 2.5613277497240822811 5.6351694607943807469 0.09209041663930542243 0.21768754662901645958 1.1988702212434036998 -1.534060060309675011 0.92454162326326072563 2.9183283144745839621 -0.071656937231305839475;2.0845563420260559973 3.7561562627505518108 -4.3892764399749299997 3.0943147436247770976 -2.4734826035968930924 1.7020241903910560133 -1.4682112304400247726 0.32841282986705078173 0.64326287243418667217 -1.0948623970078374956 1.8823144119607611024 -0.86549451050946868413 0.78424616935106628013 0.60308202590758663852 0.51508862734849891751 1.8503729040045975296 0.42956671174981353456 0.73831770272835206548 0.091297615153478423045 -2.0351153405418966891;10.578034384238371501 -13.060278220098233248 1.0826091427654904731 -2.0574731643312991203 0.48423418089399333786 0.27730995071768022031 -0.72522755080915557446 2.5928077202121366795 -2.4657335091105596625 0.68471876685591770428 -2.6267043669076199919 -2.3287262325977318156 -2.2344223832889591463 -1.3067566028739554529 0.87514336399827885593 -0.77597982466793324896 0.45327876794137206273 -0.20789678666952218777 -3.1757015030987854054 -0.43497423889958131138;7.0304355600530277215 -8.9550606717587566408 4.7225878317565239684 -4.8666822414735726454 0.20962744670488092646 -1.8327592138648680642 -2.0627395432591066893 1.1551370055215055554 -2.3249897738339093678 1.2069984992933824319 -2.4785748574675352529 1.3887754141144439402 -3.8063304650079472502 2.0467860214213220438 -2.0562539231045531274 0.54088805442523857359 0.4673124554131387054 0.59836361887754552225 1.0731488005455278589 1.4528963756740287394];

% Layer 2
b2 = 0.7142637795402313472;
LW2_1 = [-0.078228695700613193331 3.084707436501863409 9.0889241599341517031 -5.6396342544382855877 -6.8319669380871914655 -2.4825537489745492792 16.718232122348119617 1.4158323135827983741 16.373265861541007382 7.3787460046392991941];

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