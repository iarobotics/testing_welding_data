function [Y,Xf,Af] = nn_d10n10c(X,Xi,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2019 15:43:51.
%
% [Y,Xf,Af] = myNeuralNetworkFunction(X,Xi,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = 2xQ matrix, input #1 at timestep ts.
%
%   Xi = 1x10 cell 1, initial 10 input delay states.
%   Each Xi{1,ts} = 2xQ matrix, initial states for input #1.
%
%   Ai = 2x0 cell 2, initial 10 layer delay states.
%   Each Ai{1,ts} = 10xQ matrix, initial states for layer #1.
%   Each Ai{2,ts} = 1xQ matrix, initial states for layer #2.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
%
%   Xf = 1x10 cell 1, final 10 input delay states.
%   Each Xf{1,ts} = 2xQ matrix, final states for input #1.
%
%   Af = 2x0 cell 2, final 0 layer delay states.
%   Each Af{1ts} = 10xQ matrix, final states for layer #1.
%   Each Af{2ts} = 1xQ matrix, final states for layer #2.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [588;52];
x1_step1.gain = [0.000550206327372765;0.0045662100456621];
x1_step1.ymin = -1;

% Layer 1
b1 = [-4.8103382239472978199;6.4804560577834831037;-7.0785687625136448631;-7.4447988349325484592;-4.6759512794534279223;-5.1366434222714856261;-3.7249942757126945914;-4.7207034319208824868;7.7607704728766657709;17.59196954093474119];
IW1_1 = [9.658126969864468947 5.7803138312073132354 8.6163694803768269281 -7.7437324618457283876 0.63693086216754069007 -1.1985263984659919601 1.7785112048310540711 -4.4016892103714821971 0.20221591887896114836 1.628777181121905171 -8.9061229578668186235 1.2706075421128788516 -9.7099428409841941345 -0.43611916108929132951 -0.87524121975453483824 -2.4773175055577079107 -4.1873514916763285854 -1.4574746281821118199 3.106893447186470425 4.0550980893247956516;2.6799973798106964118 11.145532382973078356 4.1091271677359548775 -4.3552098095804483435 -3.236936550927393963 -0.65041196947934065697 1.6218775396418851908 -4.0375731021670482335 -0.77215866959184176199 -0.9197984405176974354 -2.2171287129284142914 2.9775810106531768184 -2.6552183397189956793 -0.3925285594797559563 -5.5486380672019715021 -1.5152115957849410233 -0.10652376454168942244 -0.33322279426294171278 0.84062899873723939681 4.2600891283454673797;-1.9294412235943880773 -10.562120179666614206 -3.3367178556469694328 3.5592829074214225038 3.2724404495829690909 0.9206247725961735906 -1.9030762340852200865 4.0727714159605019617 0.5635287109208634293 1.1175262163501358259 1.4137542423662798896 -2.9375425339723211238 1.8562096214630960933 0.63222359688699314439 5.5846340251468769011 0.96522119152527519059 0.033901514034532065356 -0.34206804130779067119 0.28049281870938491679 -4.2545952836751590453;11.722949656909673166 -40.563435696076588499 9.8412486647651178373 -1.011796960853356353 10.456612073624713233 -9.4093568208132669639 0.27722272531916536398 -2.649385213715979237 -3.967963867190213989 1.8340313915244426113 0.69160370430221618232 2.2306605860252286533 -5.1433713514270928968 5.8842426911299874348 -1.8594841129808250546 8.8087906302271932191 -11.384610889737679429 15.196622187385845137 -9.4630996224887020674 8.0982345294498401245;10.6030401565418817 5.1697605319303390203 7.0148831308185082278 -7.0777179258507940673 0.27091400181000152569 -1.3919627423955842627 1.8570024765981056891 -4.0431508448239474873 0.013104029172874311765 1.5395323360732100504 -8.5307296810437787116 1.1100697336825409156 -9.3682097742938452711 -0.37685424644640724834 -0.98945253856474757459 -2.2486571331170250865 -3.4265675398991470857 -1.3189338979271638674 2.9991871199250774715 3.7158647361745100746;-10.677451094967937095 1.9014778263512750467 31.008726067558640693 -12.477352581113954955 -13.548759343521521004 5.0659593664882125452 0.090133374127481874494 2.5567179438307774397 -1.1320633222187093114 -1.2740614375607213216 -0.82875081018024077117 1.4101160734993707369 -0.75678069312302942429 -2.0762131789891316025 -3.6257214485835089768 -0.15311561759041469877 3.429458865131980172 0.62087960814464204784 -2.8615069137275783717 -0.11080107175077111292;4.5359919399826882369 -2.1514737157074748097 12.857166739976442216 -2.6737085511640650282 -7.5639883079353555928 -0.82814809967118252487 0.24103815520077823131 -0.68670537100578699086 -0.36287612918019745978 0.44739428122499003138 -3.3989216999543088171 2.2602120080575640593 -6.2168065652326491843 0.2445184365971550533 -5.0754039032158200229 0.49231014983521498296 4.025671699587197061 -1.3293767310036399554 1.838545678941755801 1.3852701246655205747;12.245069408111049825 -2.8686062998927077672 2.0999103973787267563 -2.3669443113630541653 -7.5500767220615072617 0.10472834517309873026 2.1262224725452822938 0.70602724896234914098 -0.33743964296807282821 0.36541573116104913987 -3.1416135767366046849 -1.1029525141788059095 -4.4375820374071182073 -1.826748570844413333 -0.11752638157413491937 0.15677506655765008348 3.2817668991577999549 1.1356690611253823509 -2.303972384414730179 -0.22848558043775246684;-21.832053766011071616 12.412988846581372471 -4.5264936097655796843 -1.4709670289426548528 16.785163464904339747 -1.7682541455365610172 -1.7465488866670013657 -2.6808885837036742217 -0.20359861004590942835 -0.19828285926851454968 1.8653589596379589466 2.7995673421887623533 6.9520996973113637907 3.3297596465659804466 1.274398276186280432 -1.6202977343091939932 -8.0777710476997750533 -2.3391217379451552105 6.0783171547994063744 1.2964950863377298074;-86.226006845556341318 56.924182956117569177 -61.180027254473984044 35.10637157778833739 -42.700437141293058119 27.082549477449415321 -24.926528480849523106 12.356429093337823133 11.337822056480755251 8.2153675461125903468 13.062530745975545088 2.1700731810939561939 48.682638520158597828 -17.283243514553632281 53.485136990832131687 -26.669552596667582378 40.100464402293695798 -23.651869689322271739 47.438722834856378086 -55.452940440831277158];

% Layer 2
b2 = -2.2920076624970211476;
LW2_1 = [20.902116062013480047 13.339710972299895886 12.076856966595276077 0.55025560154176866856 -24.132607464655464469 -2.6857866551215234807 2.3136910339592131614 6.8467846391196101052 3.2356875988466229366 0.58534792235686905482];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end
if (nargin < 2), error('Initial input states Xi argument needed.'); end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
elseif ~isempty(Xi)
    Q = size(Xi{1},2);
else
    Q = 0;
end

% Input 1 Delay States
Xd1 = cell(1,11);
for ts=1:10
    Xd1{ts} = mapminmax_apply(Xi{1,ts},x1_step1);
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+9,11)+1;
    
    % Input 1
    Xd1{xdts} = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    tapdelay1 = cat(1,Xd1{mod(xdts-[1 2 3 4 5 6 7 8 9 10]-1,11)+1});
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*tapdelay1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
end

% Final Delay States
finalxts = TS+(1: 10);
xits = finalxts(finalxts<=10);
xts = finalxts(finalxts>10)-10;
Xf = [Xi(:,xits) X(:,xts)];
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
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
