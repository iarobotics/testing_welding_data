function [y1,xf1] = nio_d10n16_r5(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 13-May-2019 15:18:55.
%
% [y1,xf1] = myNeuralNetworkFunction(x1,xi1) takes these arguments:
%   x1 = 3xTS matrix, input #1
%   xi1 = 3x10 matrix, initial 10 delay states for input #1.
% and returns:
%   y1 = 1xTS matrix, output #1
%   xf1 = 3x10 matrix, final 10 delay states for input #1.
% where TS is the number of timesteps.

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.keep = [1 2];
x1_step2.xoffset = [1361;56];
x1_step2.gain = [0.00110741971207087;0.0176991150442478];
x1_step2.ymin = -1;

% Layer 1
b1 = [-0.52256518739543378338;2.6014208750781477875;-0.29700772128094016233;-1.2684179547881220262;2.0796985232884717121;-0.019492219057414907762;-1.6346268203792957419;0.085224531813868881214;0.57492866151516264228;0.50578655020844631718;6.8762669504355091732;2.9627286494989841792;2.7330904794185530982;-0.1419822489823441003;-1.0214709590861896782;-2.2500387907398025078];
IW1_1 = [12.996283170237278526 -3.7474859490524718986 -4.5232041559288846955 1.9660567633671226506 2.8829553971026071757 -2.7160768613462908938 -2.2689968058331393408 1.5266168827019954701 -5.196931705357604514 2.3058331348291871699 -0.74697895180854911867 3.4395216726141324415 -6.8428942698012003021 1.0592629428639266376 -4.3861332133294013147 -3.6057541070065295408 7.480432586999920197 1.1596869709230639423 0.5444566362900258305 0.45448801240066183382;-15.207994804278456513 6.455964049567747054 10.664285029740813826 -3.5035662464944699046 -12.435198371349615698 6.8215076728641950154 -5.7025502701408301576 -0.74080234579833081909 16.469002470616409539 -5.0772649276485735115 0.094560980080630949174 -5.3674379529768723174 6.7153052320191832791 -1.2804424959762585878 6.274873732111026392 4.1283001008266344556 -6.8205725154544492028 -1.0188811233478982654 -0.89380094811558252754 -0.57093185933464962734;-20.677252843364005486 7.2282991309149426939 -12.296326622473452872 7.3488232906268891043 -1.7684950614874523911 3.4600141088845091097 12.698148660983820335 -1.2306502130556922214 9.4170766595496466778 -2.9759258763283402693 7.6705610387158902341 -6.3801101236740773714 12.606881221136665872 -6.5569881590875294108 11.498390525851293731 -0.74462993696244150765 1.2784490614903336603 0.85436547255231165554 -21.545265381795768889 0.8666125814474783251;5.0169815422321804022 -3.758776080018339627 8.3661517140412264837 -2.006005308731336978 -0.85455592560909543476 -0.32336110031145592902 -5.426851362107782073 0.027378621003907373244 -3.9393042686414441178 2.6677140372527348156 0.20471665373720859815 0.33825263235482067037 -1.5320579423830129606 0.30358804847537412819 -0.45333730095168622842 -0.011380770703641624256 -0.50653288718526423562 -0.46118294133587500738 0.37177625962035681928 0.11109917097728198854;1.2314511794843521209 3.3089468274370554823 -4.3527877462081105975 0.15857099463074728063 -0.041952551293030757029 -2.595057234602135221 8.6369811669121858699 0.039936399947246778441 -2.9779875423816317692 0.93962638829260647366 -2.9031859223664620018 3.9461723792607905636 -6.8010774364985842055 -0.75931724137915324047 -4.3758461608430945233 -2.7386292178647209106 14.177971888915607224 0.7322906927804642141 -2.8184455799189249703 0.28296810912203246291;13.927746407501601311 -2.8678633009748679683 6.2901975271586030303 -2.1839308013622047433 -11.480324362537428939 -3.3356246351824738738 3.9093475847079646179 1.6496711084281687754 -6.9003156011839230644 3.1329669021736377132 -1.2596486539540241445 -0.56515282776353137351 -8.244416841985872324 1.9778510353313543124 4.3297091550755846256 -2.838613809807758237 0.085321498278012330996 1.9567152207483626825 1.2550947393561973087 -0.26294744703788408557;6.8028504253203605501 -3.8524818823792048583 -5.2822533525192119086 4.7284821977376330082 -3.9295796864264138648 3.6860237362607963796 -5.299784179094796599 0.14974606971420592605 6.5050817382418131274 -1.7377856537737084164 -0.91111402832295085297 -1.255545880577725093 -1.4857218533328941934 -4.6461136983612947304 3.623557259909842454 1.3495543254086024287 7.7861128044825562711 -1.174185173232417112 -6.729339724029472336 0.51772717428531389583;17.793088513162420128 -6.4240392905289454006 10.404523074506858649 -6.3006431272393772502 1.7321289168970481764 -3.0866597787615690507 -11.013660391821915141 1.1266201606927996881 -7.9505637797974531011 2.8250494458899435557 -6.0305351913098146355 5.447589035231802157 -9.7164202419938305866 5.3229413830380485351 -8.920054494160581271 0.3574778000268419853 -2.3575890226237770086 -0.64117032320045763694 17.161218491201790215 -0.58236711125856588378;-5.9469330314186246156 3.0765596369548813271 -15.083224350323726881 3.8003600616773960397 8.218410503486826002 0.6245257112907522945 2.9948961837212739745 -0.0077571812342324573605 5.543584788316237244 -2.8557894797357361583 -0.052377741887536161114 0.51143871534001983381 1.8793129577887868198 -0.26627172796864412296 0.54705510495348308453 0.81165556983449671513 1.1259698299552372003 0.39112183244327786147 -1.2107830962841956701 -1.2378127828761056328;8.2391927315467601289 -2.3283403794943140497 2.9685751684502297287 -4.3739068943214016727 -2.3099280846279102164 2.8055184258759284788 -11.196164203895948575 -0.61199659389029847922 0.030079977819086622243 1.0965601209386666159 -4.2411865058101518855 -1.6852141788243166776 4.6675048650443571319 -0.61836901387835108146 2.7556670163552725583 1.1770787120237089507 -1.1311990346739715374 -0.33855645048292876131 1.7185726811716686147 1.1269494150777534802;23.158696644289857858 -22.327344333296100132 23.601673858181147381 -2.3645114322618172586 2.1804041920896746198 2.7498997271854257463 -5.8606993765140300567 -2.5764647529538282633 -17.247894726448972591 8.8237906432076549379 -8.3057176219630193259 0.29214550976678554939 -2.427240303769008456 1.9864035631636474122 3.2664378109466296607 0.32199648830112659326 -0.51092272330543941905 9.6850367486717843235 -20.290773363514961858 10.678534560095039652;20.16010750198537238 -9.2677174164977049742 -17.025255015503450551 5.377973413522477486 -0.2963107625937358991 0.58765555788492840339 -11.573155999492531265 3.1005320281777337676 -2.1976979395630413805 3.0269442888335529318 -1.057869806020456549 -2.2259894854044461887 -0.078516852552056010106 -0.12244732257098762951 12.304018595076906095 0.015108536086643259075 -0.26034503062117164696 0.27120641668822337289 -0.17095062903222124628 0.065590015487729164123;19.99894240983586613 -7.260809242958575993 -17.583708129229147943 6.0108820307265240501 0.46112076263915519059 0.380408677110012583 -6.3115932570509416522 2.7335528302198053296 -5.3378546623184117692 2.745022150093404889 -5.5515567802764467231 3.1215729409831269869 -1.5878733248485401575 1.7405567792594625054 3.5314155781770408815 -5.2170614259935819135 8.8871988964211539042 1.0936166174526511519 1.1707911556908952022 1.0771914985967228073;-6.9144036359244882561 2.2362532463177178244 -4.0313859795490465388 4.2062598702118796368 2.8017084846663227182 -2.843782600415041717 10.480279397662643603 0.77542373282918697353 1.5328644482320363807 -1.2920667310525231208 2.1525208353252205384 1.6104187891441599234 -4.0222184213002085684 0.86424676571743386244 -1.7511601166382730899 -1.4866983668559052845 -0.022347419288153792805 1.2509855113080097233 -1.5681992865316132235 -1.4361498120122093702;7.0512254538670706694 -3.4026113715909858115 -7.5079838960846858598 3.8225393867476515908 -0.89060976982428918802 2.4165052073475088434 -6.2282832317392076149 0.68150342439131383898 5.4276633582660664956 -2.4034671579742634684 -0.19626258929424642008 -1.1466426518929939693 0.71731444670181854217 -1.2610833377723045245 1.7209262235038345068 1.3951787463852862725 -0.10351481288327051 -0.94717709983973619181 0.035268541674169019695 0.39637742748837784257;3.9204135538291020602 -6.1328698035545610168 10.475673723741826038 -2.9013425806256849526 -5.8194118743845777431 3.893714214305341148 -11.274310201566370537 -1.6265916607615138467 -8.2125076816263113955 4.0949413489711865566 0.050445551687630235671 -3.4353810294982141116 6.3879003622805186069 -0.33038534099194161175 6.1678818839476168279 3.202922433350377851 -0.48350510179888783746 -3.5271646673451044762 0.10212449153225588994 0.89314193871410607617];

% Layer 2
b2 = -1.4531239397216471065;
LW2_1 = [1.4289033635242658349 0.70331644766327339191 7.0250185156254634222 -1.9946301176650329534 -0.29735338558786078567 -1.8133922272997984315 0.41137933469238918693 7.4357784545131275777 -2.5203423667030904198 3.7520414534661643557 -0.33050001839487480604 1.1464047055410460096 -0.40378634407962349373 4.4416512766015499025 -1.1700390371896340902 0.43195442357079671947];

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
    xdts = mod(ts+9,11)+1;
    
    % Input 1
    temp = removeconstantrows_apply(x1(:,ts),x1_step1);
    xd1(:,xdts) = mapminmax_apply(temp,x1_step2);
    
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