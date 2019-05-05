function [y1,xf1] = nn_d10_n14(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-May-2019 23:36:59.
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
b1 = [-4.7813679041660632763;-6.3707996560931325902;46.796073175899458363;-5.4770333362180929626;5.8684773165010843954;10.815639886443136675;-3.8082946127705707973;-4.1180245112515274641;-4.0504988153734249323;10.001046871930617144;-4.4064484815660325268;6.3431879320613031581;21.534188861059231357;6.5138621538408898459];
IW1_1 = [-0.43722979869228417726 -6.6661994649102815913 19.171540720591046636 -7.2834966752416958613 -17.543679979848107564 7.3435191018278622721 3.2092914734284239131 -0.51612915110829749032 -3.4971286171154587485 1.6232829415813438967 1.3402203402690808787 2.122847378514135297 -1.8853528760813573761 -2.5613149971159439033 -0.37969604878712515106 -3.2345675567553335839 4.6845057710630442216 3.8388886818696983383 -3.1542738919204276193 -0.83333920469280398091;13.656185528488080649 -14.983521432098381609 12.922988428444268649 -10.017949053581222785 12.27109160661510856 -6.7032705982259956912 6.8694934236689144669 -3.2421637143757848776 -4.4950149674291157709 0.061053370507843519877 -2.8330238037295703002 -1.0433729310640758037 -6.5179193690232626324 1.6236829281968871985 -7.0514917298711932148 5.466097370394945365 -10.006281229242413033 7.6605314535299369183 -15.356238749307419056 14.231009849369110398;-13.073199655306716238 -5.2713353291192452943 -5.2737343885204239768 -5.1324137536008924698 -6.90435106357202244 -4.1187676267061359425 -3.01416005275202048 -2.4755139349801851267 -6.9561568779999323198 0.12036726758595452103 -4.2695389241177510442 1.2559573625836562005 -6.1778099804517880855 1.4797402379175177423 -3.0694172450183909717 0.51248893870183831467 -7.1951941299602308888 2.8080838573344730769 -7.0926259023141833282 -1.7013469137229793038;29.514777262987962558 -5.3686890090820451604 -4.8874269379381116707 1.4464510771288581203 -8.8171642446343501121 -1.7313432385103650901 5.6477221220097337806 0.73946831331795748188 -1.4193680311569361052 -0.46986625480870741756 -2.727145233580801964 -3.2652664702578269029 -16.374453992205619812 -0.85142054795280597279 3.1510631335796452923 -2.1286962815134375937 -0.52339231149496134865 3.8348725415417366236 -1.4577550868689015395 1.5086902899788554588;-24.906102976527506598 16.679991104836304316 16.538144787930068702 -6.6056736742791226646 -0.33540416580227472299 0.0047026678567085936078 4.6161708482861065761 -2.8995430880382939698 1.663954643904584918 -0.3234015033997940658 0.25869826713451365974 3.8365431565182310791 3.5074573167673039897 -1.4966532398362157874 -7.1727882831725473523 0.049035049477583164679 2.6561497608060973263 -0.48102164132941166441 -0.1482700877170718412 0.95350451010857906198;-16.82201012730763523 8.819880799975303276 14.34403145803914903 1.5950415068661047968 0.22266845000232937668 2.2459366203848145638 -1.071561844572116895 -2.4218362108010094147 6.8271088657504792607 -2.6004424896098758957 4.9250415078614189213 4.8181108585714502723 1.3228253637196190073 -2.4460630638326810171 -10.953470873727447099 0.72411990436399731319 1.2787061750456665266 -0.12420601266628407411 -6.004874210653072808 2.3808761888740717083;5.8809304171289369378 -13.672905843847546592 4.3328510466795737699 -7.1819216922795714453 4.8870647852413346968 -7.8528998463817076825 2.5741262083590270571 -1.6255361774918994922 -0.16534282307892958497 4.4332761501503359369 -2.9059790621882877204 0.18970170881239867278 1.503083438416228379 6.2910442282183165474 -7.5615938891021423629 4.2971630357149441792 -3.2009687702832532175 6.1521142368462768957 -2.1341609373739434119 5.1579239167489863149;5.3175682703433935217 6.4431447093713449803 -7.7570385385784401677 -5.1489128186554298239 -0.18110472534618746177 0.86915085818908432991 1.5275812217998143705 1.0748930702595314024 4.6048666526544792532 2.0188019419785265818 -2.2294102812263285607 1.6084692901799675369 2.787093731095933169 -4.1666711182692326432 2.3976181197922210586 -0.37027569325201309391 -0.11346066492976379647 -0.0051809278629709690916 -1.5488271246161275929 1.5591415232917853473;4.7705869141332888361 -15.635499498473127034 2.6988096285433340604 -7.2457153152011262165 5.5599282770307789647 -8.1304265891551512624 2.22181199549807884 -1.4284622033752449877 -0.34584773118982059525 5.2841344560427474519 -2.9011800403875236398 0.62051330501332835343 3.1560715442626698923 6.612394416424665522 -6.6343295867828482315 4.5422302667313054769 -2.6035663204531402926 6.3776794089791160047 -2.5227735955284300573 4.7323284676047405739;-17.333136077669319519 9.268319838797287602 15.447914133011478199 -0.064133379752730132473 0.53123157902017337229 1.7610439108255515617 -0.37980768287195509902 -2.3043209681881799966 5.4853700937064866494 -2.2169360304984984111 4.0480228277016738758 4.84509083770939597 1.1415572379396823344 -1.9929310160080442316 -10.447279698760183919 0.51815040034719794804 1.0681872537516048371 -0.50867444179003662441 -4.9070424538917034596 2.6373476028815914241;-2.2223710396618656659 -9.5219756064180884891 14.248803533586688275 -3.8990987776803591736 -11.844180602340069086 7.8627758582563176404 -2.3000899296111141368 0.057473990750177762765 -2.2570875542534296621 1.3362617819212163628 2.0956428653116701 1.0872097220185577005 3.6811380075119992661 -1.6797427748556292837 -0.93537305579975704717 -1.8355476152464940132 3.3207319819140352912 2.2660163541422395639 -2.3491855192967414645 -1.4755999041346661294;-13.236285588767945143 14.981497698349024006 -12.219406876615897417 9.9241505198454831316 -11.938201907658232415 6.5722296364878047825 -6.108973059905233427 3.0436780565126504428 4.5299331004509664211 -0.22024795978702166321 2.8601694841559766047 1.0323215005851893444 6.1420460827368748014 -1.664481000791763643 6.4705950791247861531 -5.4792029744910228928 9.6038611111788352304 -7.5188770506150284234 14.214972942752199359 -13.467097322212712385;10.451315410876315326 7.6050080265984645322 3.2827368753911141397 6.6425624397889055928 8.0576187166212758228 1.0368100254637193647 3.6093732297537433062 0.0560438797662696081 0.11185821788393973675 -4.2711680235019757745 -0.54274414660934489074 -2.8823972732198459568 -2.977349043973755105 -3.9875507935661156367 -6.7991705268558302322 1.4898086889012858158 -10.149363344416469701 6.9212416029288679198 -16.299308669925789417 8.1761953775400417754;-12.865351656136109426 15.708432209883799402 -11.479780070326453867 9.9957897832200774957 -12.061459336384036334 6.6193924953830602931 -5.4754662327340746231 2.7265762553393599887 4.5952355056596863037 -0.52531944975908562157 2.774302983110291887 0.96577670690638817153 5.7991042861857335922 -1.5711818070583953855 5.6063493645107138619 -5.5561921512319143446 9.3172031043341068113 -7.6159570164056118458 13.971342365535855734 -13.053311964708491644];

% Layer 2
b2 = -1.8630506913972892935;
LW2_1 = [2.3600499189965282731 20.666777752926030587 -1.1407882894132375107 -1.8328456975535587503 -1.1375323051008592312 6.9123661713457789091 6.0552136501337168184 -1.2242945354634100497 -5.6922220432777272947 -8.2851715435621517969 -2.2445093097282278194 42.165863600542934364 1.5700966182355462486 -21.130759474167721379];

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
