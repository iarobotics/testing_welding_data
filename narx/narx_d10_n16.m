function [y1,xf1,xf2] = narx_d10_n16(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-May-2019 23:36:08.
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
x2_step1.xoffset = 52;
x2_step1.gain = 0.0045662100456621;
x2_step1.ymin = -1;

% Layer 1
b1 = [-0.94812659490387041217;0.73963011077613016742;-2.3578240769223981488;-2.5736033463943583932;0.71791457868710140122;2.3404483359686238941;0.18188210168405863354;-0.63057222352971387114;0.71963391560424849747;-1.2456365363798087564;-2.8970752061685143275;-0.32717398855295842797;2.384359270569657685;0.39445450698111567123;1.9641916691592402611;1.2025919845403061359];
IW1_1 = [2.1551146726379446505 0.63405022489733431357 -2.7331542916528315246 -0.21762427023945368765 1.0296770263899299724 -0.62132686303884288037 0.54145215326727225147 0.31760241714744119612 -1.0579308042756798702 -0.35037321727674786143 0.34916377766031331253 0.10542503572126857292 -1.4898909938648485785 0.23518542060307037755 0.59112031602285974863 -0.2149816705866884059 0.2814378994252975108 0.38308810626807038302 0.3694981463804802857 -0.41189654012545257045;4.2599932157007716071 -2.9268213064858938921 0.085752172301533230447 1.9141976832620479776 -2.8785866461687947826 0.79894690896168985006 -0.3594128458777727797 0.02730738443983206365 -0.086936455554311634075 -0.30749903788864552112 0.57118671396933562434 -0.44823686747056901147 -0.38047912703602659867 -0.36091245011115868913 -0.24735338401116568896 0.42085759439730974218 0.06755111208217742802 -0.20038982817971418005 -0.73300213955127568877 0.3063610216320113433;1.4323745815984292307 -0.031880369716232904997 0.86489128627059130849 -1.3024091336424969967 0.47730493652396432935 -0.93877669951338105214 0.70613694917163749576 0.67908400447053318683 -0.55505717061222437092 0.10970237616679072434 -2.3195352798387394166 -0.23896285878747183795 -1.0691439713492565389 -0.035298297461750949289 0.60385357346601675754 -0.39504380584100529106 0.9108722229337316012 -0.32021383322189744813 -0.31947425618466424035 0.010930435019555843554;-1.5484778211972236583 0.19400625781639246892 3.535669086067631639 -1.1295618150642714461 1.0430908499241016152 -0.31268483355560466874 0.26648816888431747785 0.30743616479808777431 -0.769003026563264247 -0.03720811424272115614 -1.609389279498667058 0.28347579413769702361 -0.36274100909325257547 -0.54047185546845077919 -0.003878180016243610792 0.037778843986353650986 0.6743883939567786312 0.10524177002425005867 -0.45712019513731122489 -0.38474184532255351066;-0.59847912148588933157 -0.33552762753165121801 1.7864595575760682244 0.75641558743287240496 -2.8641899298058128842 -1.164859020620917951 1.9165367435436291288 0.37932165045462912234 -0.47723269644304444626 0.098173818526127512585 0.84682992462254047528 0.023951504971132221711 -1.0843967022929352773 -0.18324913527847663808 0.25982382658860009306 0.44493208880613011047 0.59311640158408973633 -0.13733462737272628118 -0.46469625219955384976 0.036671594089658199334;-2.1602227985453068548 0.47115147885144803563 1.3203697298271284133 0.55043683356831385467 -0.56541997028493229394 2.2352373626481667479 -0.74089342924708512239 1.8464504089333819703 -1.2936058807795618453 0.78493553908304547484 0.59057448160229353284 0.43902596490410189523 -0.6002887495673188134 0.55986034694787567556 0.075899171767494805207 -0.26498879197621982851 0.33341867310537959268 -0.14424649887770596424 -0.1538743938146668877 0.20977792183648708013;7.7774607353671134646 0.79337343155321382593 -7.3829443085969677085 0.014818927036139958181 -0.82954422477216893661 -0.65896372800975921979 0.97488051261480979104 0.03340505439404021365 0.36365437697072700018 0.013525866707044791742 -1.2569280724676430427 -0.41619054503979163728 -1.7620490324657944736 0.4111855175149866648 1.0005069514281279552 0.38810287047324815157 0.37020884446514790156 0.42854376623782469702 0.57031057483393665652 -0.70345305769670374296;-0.4542843577742856076 0.11132349889133937026 -0.92350076811713688318 -0.30090518998276072349 -0.15790930637251487934 -0.21530603384836796699 0.21567332786569723413 -0.59361570412525188623 0.28764348737724487748 0.083630066690592724798 0.061009506102230229296 0.40105006631412393192 0.24569138301567614024 0.075886918176131676339 0.38892993553030563714 0.1285078896531006154 0.85377247166102510079 -0.64502396614905732619 0.72352338431243523598 -0.88725574498119219591;2.2271420192887383394 0.15743841893578741642 0.6442229688498937179 0.47607017061678974512 1.0685305189381792967 -0.23737328316209097001 0.59568815284684173417 0.5564041928474111609 -0.49825490846057451932 -0.42175090163798750753 -0.83670008085918357033 0.02332282513121116535 -0.85903868348053069592 -0.11026349256608518334 -1.7016593727810500614 -0.18644550151317432207 -1.2714017272553510551 -0.20076959147063719313 -0.71236521812756181671 0.56516914963607312039;11.822681547814159586 -1.8574393188559314982 -6.8883074814619433823 1.826405334983753459 -1.6327045126285726351 -0.55200345313502241495 -0.055915535876801349124 -0.17721571256118648363 -0.027543058300806728955 0.1168582209336700567 -1.6650239802642050613 -1.2656884710268230254 -2.8315477757305940187 0.91956789297636287728 1.4353343794584885185 -0.024515577621275302239 0.62028634000090143719 0.67345970245379238595 -0.25475454519516077534 -0.31737405069171081839;-1.2214395644689988174 0.49579635296654933629 1.8714313526428694168 1.041222238099574815 -0.015771875629377075934 -1.4304338367206439475 -0.10014603537981167647 0.37860945196919898459 -0.48913650631464700158 -0.030573648621108548418 -0.089279756189753992079 0.46294375911494917153 -0.64075016909376969476 -0.18558634406703453101 0.6588671228970803817 -0.37267465357142515181 1.0664339630993657781 -0.31570526045248120672 0.28703466547298922551 0.077856036335954434402;-1.1678116141416485796 -0.54822548491461187137 2.2120917791488956539 0.59100256499767445106 -0.97497210080871543614 -0.69001047974983187316 0.9854886797630389994 -0.14119564919983246254 -0.82486413395221014344 0.033217213877467066663 0.93750260422274489525 -0.084427647753563511701 -0.71844421736919228394 -0.13939644907064654977 -0.19847347556099409482 0.10580743140130675906 0.27468826333130469397 -0.15871097175108553334 -0.32873979292367033755 0.20824401800701872189;-0.53990589878425920833 -0.88386418124244015004 -0.69919133696523128041 1.394717690557878198 -1.0420881062109825788 1.8256727615934549291 -1.3882658908564833311 2.1624368583387276743 -0.58739280898781753848 1.075832989767222525 -0.45462286996322931465 0.39841390722287317594 0.48859073909809069836 0.5590955030852543528 0.83676488467346077371 0.024088281248977064242 0.26578690859037562566 0.32814609217838341948 -0.13715390015569409177 -0.32382033970389556554;-0.75594576673289626267 -0.70015304409359069293 -0.78508479881181747473 0.21958358277626291444 -0.69212749522996164231 0.058406643966957466629 -1.3587521364939456614 -0.16822029354867862327 0.45215519114464897132 0.44352392235703053114 0.67908714813458859183 -0.57170613452562268897 0.50126348146267751815 -0.094835000238968944486 1.4057019937574972701 -0.10623698018428612277 0.056093457922889389256 0.52241869872582702428 -0.1462313850847901664 0.064493820160286943755;-0.52221843198193318436 -0.57674413853168637889 -0.024665144627799451271 -0.18257590168455978263 -1.1699131812878600378 0.51981234190708480725 0.52527968827502091731 -0.097194630066967185877 0.22294915327057759913 -0.20538128082768869476 0.52167571822487179833 -0.35508474456065275415 -0.26609212768428142093 0.35893531374272558132 -0.14809631266155245943 -0.01568081642277177265 -0.25916111824610099656 0.071735724465822603424 -0.47939049732037469775 0.13540946978186363392;-0.62537078022590986137 0.10796688159193419676 0.85345227378092958226 -1.0066017349225286903 0.65175798039210031121 0.15312625720854711187 -0.71615990250815286799 0.4046467467681083563 -0.59022927534223645907 0.23407602340031025134 0.070462839390695836128 0.22938939154727680525 -0.082428880174035046302 -0.45988237961583294799 0.87246231660426165622 -0.55744029593276733792 0.58212984089259744991 -0.14920585369551223054 0.092302613152225959636 0.11505281585346478768];
IW1_2 = [0.90980441737770567645 -0.4305247652020718907 -0.68046190092868652499 -0.18356665792753615318 0.33229322722614906827 -0.11101324225172493065 0.18952555410960422733 0.10553791343386773049 -0.033814907599460070076 0.056830236622050389617;-2.8570524415750191416 2.1077825381394488247 0.75899012680208655102 -0.36118988788073858043 -0.15965730408212297498 -0.41499380018989284746 0.50381867196961216404 -0.44506501242910684324 0.49614732937066818863 -0.26011927386292876818;0.30177282357989237971 -1.0674281342733473732 -0.58673308737255924772 0.3886219580787888539 0.21280146485094231235 0.50912087643769921019 -0.08090377318439732901 0.19664003269361474135 0.59331683373225796441 -0.33948898326904131117;-0.52964156113173965768 -1.3472934952553887733 -0.4006928324992137247 0.52371015223771588687 0.28496765324741041292 0.43698105477638360394 0.12498765025863894929 -0.37281858288781105637 -0.21683452353947851865 0.3944274923686162948;-0.17783813136727644189 1.3200537188577403658 -0.98179230238465564629 0.6007493156803613843 -0.34871018470307268977 0.20708430708139100029 -0.25475867793414058715 -0.098762453531135552254 0.1364293705351721786 -0.081347391982277167388;-0.20697241735029570098 0.69831600052303488546 1.6201997843794786469 1.3550315807047359495 0.51605006119591934066 0.41992899620419060769 0.30400949401880605905 -0.053680645609577776201 0.22677051972406012115 0.18827859360834375835;1.4107974812463868197 -0.1437351051432836091 -0.5749492829202774713 -0.090294921974697073264 0.10926528801339491226 -0.66472126712443091456 0.38503418425004987125 -0.21403906919265100472 0.57529365003690313696 -0.042839973605201087103;0.19299290334146024239 -0.52838009932863794216 0.084020075448095699056 -0.25564486874607861289 0.26512161497705005742 0.30714974552919538375 0.69014314684940025746 0.047872450922116623062 0.17223395523655893324 -0.40143529886200751688;0.60780412521648818913 0.48874173672436832527 0.1939913547452978837 -0.0035775334104780178238 -0.61252062296265841201 -0.67049971754281945113 -0.64352965166540410102 -0.16073580177339483188 0.2722771607380462533 1.3660782128722104289;-1.9595376274587765764 1.2183588042383517447 -0.19972420932204199007 0.50029302294219224478 -0.3677689425695970793 -0.7087778524465062624 0.33927209565372817845 0.042446623458290755337 0.51725181294574729129 -0.52825822905925612361;0.28988063243614520248 1.0783168173851693794 -0.73477086255158707839 -0.2769179865887163583 0.77794070221453381908 0.45983128016543367567 0.077372226472975855205 -0.19864363604555484999 0.25568544064389453485 -0.38563950823100179299;-0.16436204832484818672 0.74875625417052726895 -0.28899474757321946816 0.59460630794161739576 -0.4467462019748715818 0.50415873664870114457 -0.15453864214623022622 -0.067881339848921445901 -0.091406436475432922828 -0.13810929461254689565;-0.61009151863323762832 1.2079340974957832877 1.9264774006569358455 1.9687167207693374582 0.34866868504798248507 -0.19980802524184779201 0.54505032536944586496 0.014328277339918215477 -0.21593447701610801737 0.49411260579467858323;-0.31927258035189487462 -0.3546110207463926689 0.17922219793382834774 0.57953681065690043628 0.48804024419393227108 -0.034130512909113529252 0.13345587484142440449 0.17270554683859701273 0.3294339722877542842 -0.16787912732505586022;0.06463577791326452493 -0.79263764937525127419 0.14706470894762130319 -0.5586264544232623086 -0.26827373294038908691 0.23178755078540413948 -0.32215066190971680671 0.47822203072728114437 0.69077724915219240742 -0.22899566876893143186;0.61219728736277911896 -1.4529258369060917833 0.7699309045848236055 0.98931636871145001155 -0.44645670653648228399 -0.15866354095528603652 -0.19572323391668586257 -0.24834278143154450702 -0.17106831086865464941 -0.50858405671453932317];

% Layer 2
b2 = 1.4832968013654466155;
LW2_1 = [-3.2769861937981619171 -0.6236229224206302213 2.2995935260824631463 -2.3520974622926544839 -2.6722331263626135645 -0.16750887158614238825 1.2524952558528537061 0.96188728368459031071 0.70287401595025655876 -0.56637164469946787992 1.7804955765381169641 4.0566625258104593854 0.1689761202948144303 1.0667930994259808841 0.21321669731189718533 -0.12416034259377629889];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 0.0045662100456621;
y1_step1.xoffset = 52;

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
