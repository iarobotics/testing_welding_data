function [y1,xf1] = full_d10n10_r5(x1,xi1)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 14-May-2019 23:22:25.
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
x1_step1.xoffset = [588;52;0];
x1_step1.gain = [0.000550206327372765;0.0045662100456621;2];
x1_step1.ymin = -1;

% Layer 1
b1 = [5.2637862210499610782;-8.6690589900711625404;3.864606488162000808;3.0667715822468730735;-4.348933042247417724;-10.938545838995473503;-19.255143612267723086;23.373234042226055607;-2.4044203502500982594;-7.5141385307839962948];
IW1_1 = [14.89683434997715139 -7.3209000383146580759 -3.7975886540423933191 -4.4581541507734163687 -0.26654142634715194404 -1.0983690209288512474 4.5277111235786371424 -2.5330456083853545302 -0.75409378609744848188 1.9708983167640690137 4.0428303146151289837 -0.52409665359007007179 -4.6251586859094375725 1.3209309812097846937 -1.2454958084627536508 -3.3285235836641304807 -2.993993645461741071 1.1582781948490967761 -2.317590827460246139 -1.1396300281918767539 -1.7585671967398204263 1.7002544185653623021 0.69959795768598798116 -2.2783761028069391408 -1.5543474059160300449 0.63818738748453629483 -0.12327457577498358854 -5.2013492555910909587 0.58152219228916823823 -0.63745306515412114567;18.381553991827857431 -13.463713307967854149 1.0433419761124085312 -3.6358876116461531502 4.2614014472962855606 0.051828358493822869468 0.70677526421535830092 -2.2749007972392352173 -0.20303093447774331337 1.5862772950064141231 1.0577702576985177352 0.028356243316053270087 -3.2218352648106929337 3.8325025674229213912 1.7908993634359635649 -10.059788125557696858 3.7370326342080018023 1.2407268650949676569 -8.9047034299426641724 5.7213952269312056131 1.1548062161775132228 -0.052270730541573412475 -0.24396977476790307482 0.42649204893616593504 0.39926578914084603911 -0.83662890213521456939 1.8900395545306527545 3.4083110217600789404 0.13062677211577033987 2.5950845698337468015;-11.104675419663209368 10.102362808922226378 -1.6167344511284293951 5.2647219795438680023 -8.2030236849057391879 -0.39135080221356427499 2.2957445228621389255 -0.39768779093211831244 -1.0576095417613515792 0.19471020460049473511 1.5553656207964010605 -0.42229329767080858726 -1.2431701299131021621 -1.8501675423946213339 -1.2948295851850075699 6.6051626467265682763 -3.7680827607309157479 -0.12051285411356463251 5.7286095171971318507 -5.1661543735449066972 -1.0237187819410082934 -0.35926443928719442589 0.25443071731185040729 -1.2775497765429242314 0.76478595765951351559 1.2813254624377887758 0.072775461799438390109 -5.6985461622027084871 -0.39849676604505701594 -2.4850733275070293615;1.3324278341988520236 -1.2031742347345784072 0.2818329394261400167 -1.5235531682528578035 2.433738304125207641 0.74294801023241430205 -3.2097927579816700749 2.3989872709851050026 0.49274462402474333844 -1.4364922855293937864 2.5302922752842054166 0.6497035740275408644 -0.13147744616842452214 -0.51307624921237959814 0.75975567270112887019 -0.50266684205664990959 -0.65078294514479895216 1.8577198801673548978 0.61371157708943202547 -2.4158039028908202539 -0.097633125522129132756 0.30743397793144588981 -1.818775643817855947 0.013125381281111240389 2.0630323872621847414 0.32224714673061299886 4.7289852136592704923 1.9086786539258848716 1.4851604034789551712 1.5100878844882041907;6.1661430510414012574 -0.49547247030107011145 -0.74912310003330961905 -0.06166964880572053942 -1.0538457585635447877 -0.71742323095092064289 3.395144848545908367 -2.5403806789086358364 -0.93868663365961546585 0.37340756922054246791 -3.2700342405917024458 -1.1071080465719447261 -0.57280350526312218129 0.99415489838197201866 -0.6447455599881939392 -0.81157342939214272004 0.96240873988270259076 -0.60235716108390291446 -1.6309293990505391303 3.736830752386637311 0.089822870014165681618 -1.6630055012968769645 1.7020292257510365452 -0.013657091491326569382 -1.7276232314028558967 -1.9938558670982007293 -5.2907152169174835876 -2.3953181183364398166 -2.155949293299610936 -1.4551455992951363161;-16.260190025874432962 17.215172139233757775 7.8094065296786707719 -16.419057247325763882 13.743788908587754705 3.9357686632138775273 -7.2308783735408406201 7.4505454561283590564 2.828936004879786914 -1.5225923414486746132 -7.8332664603816075655 1.3392940459923179386 13.811296519157577833 -8.7878545187245720172 0.97251503780565651258 12.603513674007070122 -8.9000045918113723786 -1.2351317647131005995 9.5871749913730539561 -5.3295213170264297275 -0.67131629155140870591 8.6270493715548841607 1.7253919149276617517 0.71172140909485881455 -2.5747346152080834436 3.6881510575969098653 3.5780005494650608533 -3.1807780747203078242 -2.2818199290475273955 -0.3148589864720826581;-31.388328432125337741 30.424511012296115098 9.4329888542661777251 -10.610221880488399648 4.3333943346326755375 2.7879427999101014102 13.445875082817678958 -6.8306639415129444259 1.0855549684945262623 11.072057283194768118 -8.1960153366473296188 1.0981745441774766192 8.7077746381548877252 -1.4440948603095062897 1.3657485914503331159 0.43773646866436016767 7.1999690325375427236 1.2049385561113064025 -3.0746971463484045195 9.0031218398797108193 -1.28974061359799963 0.66005397263097476124 -14.612838488742630361 -0.84089139660268474863 -0.16748287640969911072 -15.153598947391042628 -0.442151283431871156 10.653225967156032539 -9.7943123903641797767 -0.89216043063756189646;35.450845749258661499 -29.630571464369126033 -13.412703194092511438 25.015870246886859007 -20.225797747508064361 -5.010241889095692791 -0.17310879812619708873 -8.737073761304431585 -3.7847667216810294555 -12.257126940833364515 5.6497201449710159338 -3.0743483165396994217 -19.886010455978684774 12.747477640496599705 -0.75966301400131897026 -20.115639729008790937 20.57492811919953013 2.1698631644849961653 -29.412256100298517225 20.997638014666122785 4.3561267066304276696 -19.326641948328344256 -3.343856491656179486 3.4553071729183462146 14.890419828517023504 -6.9424481457152147357 -13.56311942227280376 28.373540520774671592 0.32276824483322164028 0.32565474650231845954;-1.1206405413603772736 -0.4171987774961142259 -1.0997419175808509362 -0.41588002502078097455 -0.65301633265938763273 -0.6961203802666672269 1.2541018952731339819 -2.8658088660554290605 -0.50846666636673432116 2.2538561897120956701 -1.2929270146352536131 -0.65551180046122836664 1.5524378368547306906 -1.0846001301747336676 -1.2268348870894345559 -0.16327270905478008522 0.4576763658163454096 -0.74650261653283134233 -0.92807607426550864371 0.49285135418805237073 0.097729364972838669856 -1.2646417960800551139 1.7970383254827577701 -0.032047060171197253031 -0.3342374454260436667 2.4815287645594987787 -4.8416176361726455113 -0.44238986428229709613 -0.2732997749796839404 -0.89852443159436323761;-21.028617946600761002 16.032349048009336911 3.7621962158151469602 11.210235306781594744 -10.146707777362479419 0.27413766904118708201 3.3386520046121099803 -2.6881732098128034991 -0.13535163670336194941 5.6408376959870301093 -0.5551445420079489379 -0.35002749844543995517 -0.62458019678171183831 0.21102473177155794959 0.52597345911718873523 2.5509503394933976672 0.50228689482018196166 -0.23094637742454515728 2.8694517889229262941 -1.5695540117080291065 0.30402271834977057097 -1.196512935331299321 -2.5012225570016313192 0.11825850352525850429 2.5212089891839664091 -0.6493416924655449618 -0.61153512504951268447 -4.4105082651079214884 -1.6976742290805875157 -0.076406796544065805343];

% Layer 2
b2 = -1.2209071343587265535;
LW2_1 = [-1.6239698354150553516 1.6578968623933534321 1.9258323209236196671 -8.8046193831284718101 -5.047017951338069075 -1.6635085551304513718 0.62298909922594347677 -1.8629220533396779746 -3.7572008524387481287 -2.3989464501639554683];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = 2;
y1_step1.xoffset = 0;

% ===== SIMULATION ========

% Dimensions
TS = size(x1,2); % timesteps

% Input 1 Delay States
xd1 = mapminmax_apply(xi1,x1_step1);
xd1 = [xd1 zeros(3,1)];

% Allocate Outputs
y1 = zeros(1,TS);

% Time loop
for ts=1:TS
    
    % Rotating delay state position
    xdts = mod(ts+9,11)+1;
    
    % Input 1
    xd1(:,xdts) = mapminmax_apply(x1(:,ts),x1_step1);
    
    % Layer 1
    tapdelay1 = reshape(xd1(:,mod(xdts-[1 2 3 4 5 6 7 8 9 10]-1,11)+1),30,1);
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