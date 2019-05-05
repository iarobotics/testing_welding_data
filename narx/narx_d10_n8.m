function [y1,xf1,xf2] = narx_d10_n8(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 06-May-2019 00:25:12.
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
b1 = [-2.025423155983939516;-1.2883319200877556554;1.1742670276508699878;2.6891984394456458496;1.7939612388764238915;1.8014517416972868347;-1.8313154438925254297;-0.75901714083776616881];
IW1_1 = [-18.186254828662782757 -29.784124001403466053 72.51268309458390604 42.657387451693715263 -106.50404934656485523 -19.099850557350432467 84.958926065747391476 5.1968173844140039819 -39.829476903272876598 0.2262777572670730819 55.291486030424586318 1.0490643395048770969 -35.164240419013793826 -5.3047380740727803072 6.7753584462767237895 0.49508515740172959196 3.0307823527176389611 -1.7064487401897663332 -20.03933624764970034 1.5922479882404396712;39.157239416128156506 15.177333402502304338 16.603012815697212545 30.690189476265047119 -14.46200830994633435 -1.546738964115396131 34.13094007067851976 -10.780868656347003309 53.488979653289689509 -14.013608000791069941 -18.763144136218034674 -9.978144421603346359 -17.763751100221249146 -13.496732930354799151 -38.759518218011209001 -2.1940281504141037061 -3.5323912110318387292 -7.7180359707055927743 -45.113056803854370003 7.0254582551899620313;-0.09928731636172197228 -0.37824269929218190534 0.079908510924013548271 0.17999547048509431657 -0.067756359749932479342 0.014022712873182709842 0.027049010290797557976 0.24084393447987170744 -0.027410755338537665105 0.12279000843148013544 0.037256578559342612422 0.022710053679021638406 0.016589090471204576138 0.20587335730633044006 0.05351320746110053983 -0.091585810341823142844 -0.0055727773368989723737 0.2477158359062728854 -0.022359181143456599572 -0.067362600648714021645;-79.163992016555070563 -5.336645111904152472 52.715974601312964865 2.9743155498537281467 6.6606556202756070917 6.5346069451927677463 -8.9987498644367605038 -1.2783544019083401544 5.5080501776194159547 0.20125930747074463611 12.207829031089003635 4.2221370181855837345 27.718812559511768256 -2.5689338819143703319 -7.6158845786397835198 -0.87215931013811565098 -10.938998563222309457 -4.0953780362385172609 -0.17757140606207863498 2.5705815212742590958;73.750199684752885787 7.8922593554446134334 -48.852814806979765194 -10.611279941464957233 -3.7828596386225239456 -1.3632196584223925662 4.2176456684150576137 1.5132062141329731819 -2.4007579940776588856 0.95576952133160497649 -20.098427989117350734 -4.6078345059579071119 -12.97192222758061142 0.65253695597612670909 2.308225003106308737 1.5617035220650830052 8.9038634991091143434 4.0280777375051908251 1.1327353934578794359 -2.3283245805638785875;-0.25347640582841440837 -1.7428516497243145 -3.3758310350216924611 4.4062377450741081475 -4.1347206737273669575 -0.68755723038754057441 2.3456699777397136408 -0.43628478537886944411 2.310248546259124236 -0.4385227873058014092 1.4671231723478035391 -0.044718374802566768222 1.1028568966550831298 0.57912631058356023317 1.529964533489607259 -0.25632683159278507601 -2.1608665829822424342 0.38433127626994806336 0.63710706741509837148 -0.020604944126572394963;0.21168931052281125815 1.6775668692920651104 3.5956992310021154147 -4.3233413496385342256 4.1123357920326277792 0.53450908269828445452 -2.363917689462480265 0.56240270119349700106 -2.3534805612329128266 0.7816935700426396183 -1.4983729075209977211 -0.014178121600391306242 -1.1232878025030064162 -0.72735476305207225067 -1.6085927861531281735 0.51736314414428918873 2.2718113800790167289 0.25729487000362483151 -0.69195137033523823611 0.0050169823108529064751;64.404244401311899537 -12.953694054483547049 -25.970404479289143751 44.073735335543439362 -15.615615161784951681 0.77411454532736412304 1.0740257187137609574 -3.3998744186163496472 67.266508831331691454 -11.072306935619748103 -37.093227032821729949 -13.445556210584346246 3.7530658413518129812 -9.5641571315878231019 -17.817235759334881351 0.36723450257359713245 1.9314693794409392158 -4.7610342516414201341 -38.390288983512057541 4.9413581670853625738];
IW1_2 = [-29.411756708451449072 43.091605251964928414 -18.399286536136497006 5.002259544390288859 0.14271132869749317273 0.9768925763969521503 -5.1229462451890608321 0.54346697421952971929 -1.426132668414790805 1.9366949232487427057;14.549616360041760288 30.517794214374035278 -1.0738821829601783442 -10.354680062079417269 -13.985410320497509318 -10.359104943045753799 -13.411438604119597429 -1.6753710611562244726 -7.3284147939262602733 6.9160943524762066303;0.067655399562188356377 -0.012157823406334209229 -0.059304073141355460874 -0.21340571223603035933 -0.11489679345197527371 -0.024676145434178210769 -0.19870845117025598414 0.094792657258629411943 -0.26509898096541656409 0.071656089700994449188;-5.0104230482948057812 3.3739068929293987154 6.4494549391101951841 -2.0230148637430653835 0.29751078675059838829 4.202476609954043596 -3.0493526163565949361 -0.54216559244128281758 -4.1628230158511785319 3.2907258666857908125;8.1466434281179651578 -10.521371815101490554 -1.2025794961806228756 1.7534354993173191239 1.2329772463224544232 -4.4160792564003337191 0.41737491384004804518 1.4884954974045763176 4.2121459825431779578 -3.1383484776911698688;-1.2930013301409817306 3.8084764006359876909 -0.36690478187531999632 -0.44815511225335213918 -0.48808328300119246945 0.041715432600996665835 0.46106831122377694987 -0.036627293913405190029 -0.36434663190991317672 -0.15363748793157230854;1.4400786253479773702 -4.0822448831811835035 0.5276662572757095937 0.35233715085948347223 0.17016313761344245559 0.027385632673639949408 -0.36098497324997258495 -0.19666557746000554174 -0.30108563360454715374 0.18391599900056987416;-12.579635278757704597 44.022233703924975146 0.60196626050697832344 -3.1249682258525592893 -10.459946637855395579 -12.692589790399843253 -9.0846177723947594274 0.19868838331648472351 -5.2930329276233081259 4.1687278902669371305];

% Layer 2
b2 = 13.240383097629315756;
LW2_1 = [0.0075240672619814813818 -0.01257324562534804617 -16.218544360578139418 0.06215426241976985261 -0.036306362294059521534 5.7322245722626909981 5.5927971212101743603 0.012632269772870225941];

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
