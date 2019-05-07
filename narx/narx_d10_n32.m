function [y1,xf1,xf2] = narx_d10_n32(x1,x2,xi1,xi2)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 07-May-2019 07:53:01.
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
b1 = [1.2084374534748314467;-2.9666722308274331432;1.7444264343430060382;-0.78265953165236845646;-1.1060768564058862662;1.5490329876078492433;-0.80217462276886841721;1.2328845998301631859;-1.1963086444004289444;-0.1479291044609403194;0.57645607063086989896;0.61807830285291487371;-0.74908225076406920184;0.30316389052771403056;-0.5728570938717743033;-0.61520869882601736389;0.523571768211832822;0.66709865737809070918;-0.5318813022086856801;0.66493006913245999989;0.68409666204998120786;0.48263219770403686937;-0.032308632785975260893;-0.62096724001163150497;0.82871065256829667955;-0.88505232033287306592;-0.89487246765163552809;1.1823445502467531121;-0.49098783739984569463;1.0132901633783717443;1.073407412506582892;-0.78720536519802142283];
IW1_1 = [1.9629776118714190591 -0.33548178408131074102 -1.4169501350431783493 -0.86042811090817072905 0.046644175736400693422 0.71952299043636247511 -0.26107427761233292784 0.45697415850546524441 -0.15042389718438312074 0.22299139587087829506 -0.5116094367390505715 0.17168443641650438236 0.017006732307660848286 -0.27628793882933239123 0.57754289256738233771 -0.54386385588332286645 -0.1580166720190212537 -0.4319135115221613419 -0.21188701043049670836 -0.14060880817331591897;1.5137282390765960383 -1.6726630094474506105 -0.69074014192693122816 0.2741921409851418856 -1.3708316269112679198 -0.16402982055302101072 -0.29095694764970836399 0.60924136530956052304 -0.051160435944890648996 0.33335935959117501959 -0.5710397916620595371 -0.55836560287008796255 0.14165330101641110394 0.30019258519792135775 0.75077023298668388307 -0.53941921985593799249 0.9340456873541287397 -0.11631538650771056087 0.026699943308056681146 0.30800693123238603865;-1.4773448545263798692 0.28691312461336665462 -0.14831677275363788771 -0.97185991446573261054 -0.56506964870338494134 -0.65425724117224814957 0.34319061003444745195 -0.023431170357435578827 0.57861955400162123908 0.51091274782990570014 0.39355686586426352758 0.16246436867669175608 -0.019712598863066206623 -0.099722029057574101962 -0.40788900479937251209 -0.081061045204150569687 -0.024948719148700899961 -0.16524916971415828937 0.5259260256150534163 0.16914533276817392271;0.23976508942211530173 -0.094770164142653490202 -1.464561316924422707 0.26690569326451624166 0.88184924951806009652 -0.61103594412728612362 0.96582664341195423319 -0.39606801083764758831 0.43997954597988192527 -0.16426030345280756562 -0.91022584100794690087 -0.43231018444827407077 -0.3147890970731929694 -0.25124596809370181028 -0.56638176390410566174 0.28555908408983315949 0.68055964478305708276 0.39236458094337028912 0.054243994547786493488 -0.58481412691642220558;0.088777887318024231722 -0.024980035143054392377 -0.38331785120551015167 0.23929490496117258869 0.3776699598138866798 0.16865804546189885893 0.19232105685957778807 -0.19350473690958810979 0.12492723172226408157 0.59121992372882237188 0.059244342887120403363 0.53277426961448803855 0.26076623798964476686 0.72637136234053589767 0.17587208574840332287 -0.24261637339995220652 -0.10715999140061928385 -0.33154723537216646001 -0.42495829250842559466 -0.35937258054178333744;-0.33475587438166032328 -0.71899958400452801399 1.2517933651738486489 -0.47482428112336583226 0.086120783282302521 0.79579799769479564464 -0.43351709409013983176 0.088307814421577035535 -0.57180940564045401597 0.097994927593602537685 -0.26438463196289158086 0.18754380644753071428 0.25523941999119542645 -0.0039370422120353163603 -0.34178393829940689752 0.077955025356658783076 0.005628427623390358514 0.37990440468806074836 -0.06318594168438355918 0.013262920403763586025;-1.819388958845699511 0.47976218696226868854 -1.4295154684853674798 -0.26972710975947800094 0.54052980115273085993 0.19790607255829054112 0.57901014185883004082 -0.17697954341111565846 0.74401513951602604724 -0.065852686200007351514 0.34686599792580713464 0.017765993801572298877 0.55539769590293119883 0.1072497116420671609 0.36597189162611021285 -0.048522551210555868451 0.34391287380547913566 -0.2860451285454622683 -0.20793409981063418202 -0.27200644258197559378;-0.054662384218453076434 0.53189354384521037034 -0.87377905298749958263 0.41204620106362938037 0.65585514951732715172 -0.25782286221679229232 0.7564710674044115013 -0.76517967372509798629 0.38516224931855247426 -0.74225149866916040331 -0.53652921153394383946 0.82769988871430311139 -0.13529354460422329809 0.48616418913867298635 -0.0027289707959259122509 -0.27650050435815481942 -0.30838594546442787969 0.013879479212119977954 0.24551046518665092799 0.020450561952055731907;-2.2378060028742923215 -0.39228229249989771121 2.6252760102232230999 -1.2351785614676793479 1.3183499561876941275 0.24503036235191910652 -0.098881644876203045325 0.76396334859921899429 -0.19457599920132404026 0.45182908998422949276 -1.3057674474470160053 0.19973605930473450898 0.28263707583536773482 -0.15667270797469293186 0.042145492954642926886 -0.00053653488698229096984 0.12242364406072712979 -0.11085775127743983937 -0.18078005439805219789 0.070240745850801422634;-5.569864289093809262 -0.71582908285891722056 4.3533175348697907836 -0.21879192643195946588 0.073535285935601504836 0.83150492446925272638 -0.81754937253497905747 0.26266079379485679501 -0.56948617859639216743 -0.039652621017505086665 1.3365427362898045782 0.31400457608105264429 1.3664739310856002241 0.13273023871728215073 -0.27749660127550390687 -0.22117832060278672102 -0.020164790826772343441 -0.49337138461352031404 0.15514362747725696234 0.4789130297386747781;1.7030051593605610716 0.063240606942564989157 0.55934283056920020005 -0.25789822596116668274 0.52715259214012633038 0.29134365596089334405 -0.19195176136227576347 0.71733357018460097709 -0.030967250488380997087 0.32116145394014450343 -0.73699927292244526988 -0.19401542237886706954 -0.80232875635079337062 -0.30975259423490197896 -1.0476403017744253532 -0.15631052545891904737 -0.3750660261441925436 0.12011629554992719893 -0.65879322215747049274 0.25892676545342718786;0.12817097749655637084 -0.34485129875812964295 1.0471954699057919314 -0.36251831500941522624 0.18117518969308507581 0.84026136337305845636 -0.93928891449855000939 0.67463773756168332607 -0.18320999316470501506 0.43328986227082150195 -0.25785044700675663343 -0.14290412870248325738 0.40996106255386061124 -0.20788605775290394662 -0.50765292949904472497 -0.37009346194863457224 -0.3179977805212954034 -0.13042310102957405116 -0.6380969759697907584 0.54435390349744749994;2.1790686976751953985 -0.31419442519125351243 -1.9745834572817815289 0.90642194049937896416 -0.53176501171842083249 0.13891154778563330474 -0.53257719595331731721 0.088059870760363992415 0.41457663328423188798 0.11095680101783429727 -0.63138453201898314671 0.16469846656632000648 -0.16243225998389806963 0.58112430726653641067 0.80980615382788789791 -0.055015703156318075673 -0.066955435301528976044 0.17768273709115295356 -0.15386155670233525594 -0.69550594984003755172;-0.51172731455819497892 -0.57245561843608960828 -0.38121629308285825966 -0.30588379878120203204 -0.037366086289162298018 0.39003154060004230352 0.03489192761196953374 0.47846729395081993852 -0.060581756311231096945 0.23093996116424764242 -0.10214961675941348906 0.16133477303595050723 0.36961437348905396005 0.36399464982308255001 -0.14037467329554162432 0.17950599770833744473 0.4300724586275850303 -0.23360820278988606025 0.28358311608574410245 -0.062883903833545598538;1.6757321132173770284 -0.95660918166666020213 -1.0209743190096780552 0.16291290270123442996 -0.11887879307286550179 -0.31225809820884292689 -0.1545617327011408193 -0.28895315113350877878 0.21902278491753224277 -0.421621701301843399 0.10716112119196570529 0.13673023449907234506 -0.38862020591668544611 -0.22694322082340673274 0.28276218284611626119 -0.14380675147915736312 0.44635343539392224876 0.18072849718465480717 0.39568648068023559716 0.17672363823626852097;0.85836633128575234863 0.47589964134207152213 -0.28488665808287294556 -0.62225828287319084886 1.302997811061155975 -0.49264345622504329691 -0.082156977850666071395 0.27579156457593445584 -0.10993114653071503484 -0.54423969288520712695 -0.45883925495698341113 -0.52767065783675026758 -0.60921423252658801761 -0.071218909989411049999 -0.055134421967967688072 -0.39516741970631291681 0.23129755862361200958 -0.13441491527972251885 0.12302237705326557471 -0.10099688744766846527;0.5659195582973505223 0.26581829930823813735 -1.1733729069151201951 0.15640135246149280968 -0.31776074594705977505 0.32395936563925409324 -0.11053189068822928676 0.45337831684197699156 -0.047857641749236179418 -0.025597802727770745806 -0.39787388318807576093 0.12778884809556961821 0.050163097149123481167 0.24777965655665867839 0.49852717854488065585 -0.42679057737017828122 -0.22608909004563745859 0.052360349506193129554 -0.1900569091338420169 -0.18189997519249542779;1.1695612738069256498 -0.32854490475951075856 -1.5674430763132423117 1.3204343390894064392 -0.31557509197749677998 -0.21229637493149544625 -0.34665632061376483453 0.022898377725719613884 0.085762112310653434988 0.25878163361444944668 -0.17591960616728177791 0.33208037724032174465 0.56547335835099021839 0.22667530037059424597 -0.19976477231252398603 0.42730546468548674666 -0.036029244215063462031 0.38554157013236439733 -0.081120082580191280042 -0.041140951402631631417;0.026628784050252138349 0.031773871032004318005 0.16207914323259237088 -0.60449353058652044446 0.3379642582712280019 0.40578378989185820425 -0.48502772368815660897 -0.023575642200409814564 -0.50486536180805474672 -0.4580189816442017392 -0.18591876052144842846 -0.6487763388256555519 0.48137932566171870441 -0.32151599141968240092 0.21861335263604816936 0.0097371793944740527016 -0.2472620976208542154 0.15668531075598771118 0.56759776161369068781 -0.67664483856746648893;-0.80144388165729396611 0.64500737236235705652 -0.5116985814338382843 0.10288471892259495877 0.80820044124508161332 0.18175079201264540685 -0.21135037300376319225 0.044092706371341938709 0.11777852334359455166 0.47960439270988197702 -0.13446591883274880419 0.22925952387354567308 0.20007961268332424831 0.16117840753996684477 -0.1978362655769003442 0.32237624281568344475 -0.3903729114532668576 0.18798254065052358297 0.13432253625650036888 -0.53444049369702806285;-0.20553052415496619876 -0.52238442741716206719 0.021551543861727480433 -0.08951946080887317192 -0.67173182537262143832 -0.094693068412765257769 -0.45256406420655809208 -0.32405428347258857791 0.19633729980718736541 -0.57456428489726096842 0.42105480426453373299 0.039703869384576970236 0.59327323730921099898 -0.19898922296484550243 0.38912850590871284062 -0.43885699251458643033 -0.28823598916871817632 0.14545934880728497718 0.11512210817157754461 0.19989834395056316207;-0.45848593538652321344 -0.83463397993126475782 0.58213122448520071561 0.027401492806025710969 -0.28208804977705309591 0.90486662555454488999 -0.10178217006669208755 0.22018281619497129253 0.22498899153940293827 0.26702235841984012232 -0.64236608529798122635 -0.45382845063017518417 0.53565895454590062297 0.18654067662818782369 -0.048743292062136907294 -0.016001657947110038693 0.1092695980891974783 0.41841747033101273079 0.2350279036495159235 0.014378050103797224146;2.3420676900616230753 0.16316878771139320392 -1.152083136455496426 1.4178068721875414226 -0.73254689922658300372 0.5281869718409140102 -0.48101890612804137914 -0.78578981426104288488 -0.15192033064204568671 -0.40084594555928143578 0.14217664510848951331 -1.104129874321422955 0.8568031509105384913 -0.39813624464158642313 0.31755740089438089235 -0.021056740593995072752 -0.268773251101856403 0.51785579452215013685 -0.75063932716959602676 -0.099614053504346516954;3.1327578811279095383 -0.35532290726708526396 -1.7547715665012644237 0.65792031593454902705 0.40679398104394903779 -0.54272166364240970182 0.12702771646217977941 0.050924403595143913348 -0.022292799006094519282 -0.37949575112461769733 -0.64353281216503810391 -0.066076017043162099673 -0.78037650147202275441 0.24686189650609924318 0.25862717918060912359 -0.21875219289318650895 0.27584826482496921374 0.11760262082052196086 -0.051777688128512397436 -0.25711568120180833263;0.50586443765545019424 -0.087668911205016131216 -0.36578604385598700866 -0.20249336910543144774 -0.1673601303732914769 0.32049512231712368182 0.45568479302541003984 -0.06128866925364824525 0.40298483914849497767 -0.40929983741541170472 0.049278906124270459299 0.13169337373635014998 0.40434505483609956 0.17858144100709336111 -0.33372467831611035693 0.056963664811869513249 -0.27516674290029247141 0.3743561624257030207 0.18600664226335172913 0.029544278873255329365;3.6897354998137732451 -2.2153296294823308088 -0.34264143111401312858 1.2069741176470354382 -0.73033724950552103561 0.65208915263206501667 -0.58143264624933665985 0.30034657791028879226 -0.57095793239504410987 -0.20859686647548547622 0.40743979567226068506 0.082680762145396893836 -0.24447830158811453827 -0.20355585032877115959 -0.50029274284346392232 0.11957010058529161933 -0.32902909594805945792 0.1438432871257758483 -0.44108796518447612733 0.39029177839781009629;0.39534068435643771044 0.57932525697753112226 -0.82853802531190101632 0.44363643806508867851 -0.25067548498599290241 -0.26228895534446189375 -0.097230456167892664876 -0.61147283439949529082 0.44292709913614947137 -0.88259326085231670778 0.025722510318927045009 -0.75209085100352113251 -0.015098970912763310867 0.51038337484801177268 0.0078075540844122805206 0.11646405644093790754 -0.20221425483890259622 0.067490610900538358652 0.35735374650266943375 -0.027124210086455262381;-0.086359530228092715176 -0.029885554263360491339 -0.20657517977316094959 -0.14105132392390506979 0.19634499078319225807 -0.0084225225858977244286 -0.078938891504082009387 0.17454139177320163179 -0.27185218917380449266 0.073809931044891044505 -0.26633626066842536195 0.39031203953737225731 0.16615386814090521428 -0.38148142058138956312 -0.26100698107759789934 -0.56522169319242410168 0.45032855981407149404 -0.0094978081818768399225 -0.27365559909861919552 0.16990096517973715673;0.11631322046643730039 -0.21040003045531260883 -0.40822515223528377248 0.7785560384853538185 -0.37728087368456675321 0.11306885718574426203 0.19796318747059654664 -0.1975035602251013489 -0.76838207058499019553 0.27104703035450489201 -0.27934834067890040865 0.0082712024201744942242 -0.72313183425107607771 -0.32953051254076148879 -0.18999074960398815159 0.035895389598974536405 -0.50583532283073651126 0.48488100268682837735 0.17362317793597414894 0.47601555984220422779;-8.5770431182513053869 2.1169184821494733129 3.6702632458313351194 -1.3840507823377758978 0.6060435589252770594 -0.36343018679915534142 0.6335651311694481258 -0.54211780263796305324 0.64083521430537171426 0.18444307436977372405 0.5820592333342498037 0.38005154761383447282 1.2310274632628501745 -0.034106244450666914347 0.039458160242339002099 0.0025294567516178636732 0.3494064074314948698 -0.18311386429419504451 0.34825638740569836438 0.16739472442172184663;-0.14708110234741889055 1.2493811025513130719 -1.1096241137255635767 0.22239608993628909306 -0.17723146190316854676 -0.14569873716244438611 -0.1762114081092229223 -0.38817427715786040343 0.041418116458228210197 0.22843446090468588761 0.87677973831618349898 0.38605715510636584575 0.048760231560386710359 0.096890338819559732042 0.23229461757758126939 -0.07872135502832919296 -0.037270466097116580761 -0.11602255973315350746 0.17960095745429041636 -0.12074839530297071244;-1.2972278528201159897 -0.32542194253634393331 1.1862707834664520945 0.4813007862110148527 -0.38157903283536692696 0.23380856729166793473 -0.32272713601954633456 -0.092252336006373752975 0.067124250487438155699 0.27234293275518839383 0.079384146860418960956 0.27384186546033306708 0.18495800978805274073 0.33407022751395437643 -0.02175511045985772246 0.12325559840673358525 -0.0060841782493627613246 0.15116008305913988807 0.03210819598340174108 -0.23753219849515688766];
IW1_2 = [-0.094189499790985745098 -1.1647247929086226303 0.93913436447836451393 0.28133071072032656001 0.24669136533503169262 -0.1004834194933493241 0.64054953030108130463 0.19527969530629260553 0.058258963731866258984 0.43535762113583303945;-2.140374184891590037 0.22635240655293939471 0.30913183903510332851 1.0040410148645835253 0.17016334126630680568 -0.13482845470481891192 -0.093236270221445080586 -0.086607428519352339102 0.47099398070903375491 -0.51012421190910184343;0.019269101758668236157 -0.80948421146901994305 0.25449142841904726087 -0.36392253056969570135 -0.20337539432311466103 0.24130728901596065761 0.04929734670317317824 0.50125484533240238783 0.47102662899264419183 -0.30762539570563202096;0.5104619623084982738 0.69369833533893865418 0.061783931688872480159 0.00037745930754779465077 0.2303989350841109951 -0.58902927912471747529 -0.32544272146243452548 0.7163862337352160381 0.18123340786288283377 0.040469331310560741066;-0.073724876681220324892 -0.052600894099284117855 -0.22065297469040318079 0.0010540624854982394085 0.58608136502824814684 0.15007375335957706675 0.1750906908950126406 -0.1195054474269030137 0.2021248112910711825 0.28848762311174092066;-0.66419097274663352337 -0.27324761223730598125 0.77912160931123164431 0.7278832828544337108 0.58518810231496687368 -0.074053638291721235465 -0.21920994604863644484 0.052004385477942054183 -0.33413023376076578241 0.21319464749787697677;0.97994078380448790266 -0.63523163806900895256 -0.25379389743333841123 -0.11275245747662307472 -0.173849115864760706 0.2508225395132426816 0.027169317884765745164 -0.09892758739162817172 -0.28936057533027687017 0.54356518626384675574;0.39815032564242103241 0.3889075650001383444 -0.55142791388529999175 -0.34334048388844684574 -0.18666732467154067976 -0.030613065508174348156 0.26398936908545123092 -0.52467531601329653324 0.047122080500643800938 0.15972461109871868845;-0.7672330052948519441 -1.4418528694375423171 -0.19209125309382574232 0.95453795218573445069 0.51205254730145111086 -0.31178538909191089168 -0.25254207229514330502 -0.5249696553859823922 0.1713314657404743091 0.084966039487611555447;-0.78179464360275374712 -0.32733614430085228308 0.31466555706229465406 0.099917532241096257417 0.12782300725843517841 0.41875899606794575458 -0.21353618335674706685 -0.36095612239089552853 -0.28782284264620872083 0.18682407210388396468;-0.38714868958550835432 0.29613621030448222804 0.44043092094938529613 0.30109009973872563615 -0.34323159195239755226 -0.37570187392358772582 0.0052706768934292196754 -0.1665190138762358274 -0.35055703688728073741 0.77046578767901974238;-1.0877314165567457671 0.081452955899929915806 0.61645303138586438063 0.8146580446242422946 -0.037897171933749404515 -0.6443925628950213369 -0.14030630274049610273 0.27545416603096828378 -0.0085890173959775727858 0.20635205311086449176;-0.27204759487708518595 0.77808283094867325413 -0.13371521354976101392 0.036907198051596083743 0.275697072179211633 -0.098782506852460053026 0.055764693370822904228 0.39936027931181616868 0.15556163363121155996 -0.0066430319962239893494;-0.75163015875835792468 -0.23800212537129469825 -0.29584696646013963761 -0.10289697885965458368 0.4237517154814417486 0.35132298281856849664 0.26744465300076308845 0.43279758697797837685 0.27366125833114268717 -0.10348890254493213481;-1.1380242883023046208 -0.20323158556116449613 -0.27091398751901590858 -0.91746035929752223215 -0.2173603879608486944 -0.40524856551651444736 0.27999314787170392904 0.23574914635539034879 0.38164041260102593567 -0.057627441453131977855;0.32118072028572897114 -0.45643165565720955623 -0.63196236275061079546 -0.011795035145829657966 0.059732645944716770969 -0.093346781898636016495 0.10527371368822481534 -0.13453691915797344469 0.12711831643337409559 0.43591928206687785563;0.99698697468263408616 0.47674603599124854014 0.17662830529655212941 0.6978162879477860514 0.71406152413438894744 -0.070986281505508910805 -0.032107895818960272005 0.23583400524811956589 -0.45378177935659280706 -0.00092347787054565056222;-1.0288193964100256217 0.8898069059025378591 -0.23168311069235997257 0.36560938231473860682 0.40476083584643279822 0.26831716077629746975 0.21879527562067724311 0.22780516782024015643 -0.072613390859876836281 -0.52360819597343477572;0.43282015149474301063 0.0052508773914033239627 0.46573580519270230127 0.049492229888967287366 0.0040142195429304430854 -0.2100532246213815124 0.36375753991851705882 0.63030873425678612954 0.12577287088032190754 0.19054643287181588507;0.83885586124068567404 -0.71850752533983375248 -0.54519222255085175721 -0.11823825086395312045 0.53349511270844496291 -0.0065598928437150616846 0.20238644924650822654 0.58067150318023386113 -0.22113536833849953278 0.22398421121415845736;-0.70999441122315520847 0.46969208503957454726 0.14419068541745003187 -0.77239388049779478251 -0.025639303431288611168 -0.68439562146188004377 -0.37281334553756972916 0.49154397626774115615 -0.052562939520265396232 0.23168862556998001678;-0.72004749543487656105 0.016096458708496096113 0.13198182056713197996 0.34400997591742404902 0.2606860581924332898 -0.3548375504848163553 -0.084939381909202055221 0.052935550392578460677 -0.20062183299132152481 -0.29765735564206552421;0.23072799870504934194 1.9066852052893126235 -0.10844868660892290069 -0.12541336789655108119 -0.33229307362631788081 -0.4085140072024593394 -0.74071159626724092373 -0.03036393477513593675 0.28915831402214497992 -0.32037585916641203587;-0.069582208925844712955 -0.26759844789735554027 -0.43593066234599586739 0.17341502617737819536 -0.46054865215320145433 -0.46286153103809968279 -0.17448247973820446566 -0.50917271612451109331 0.03279634527774375613 0.50313677265155010154;-0.49878668820012994622 0.051579548534210872823 -0.52184981144291775479 -0.29036396198776642796 0.31045614827821926829 -0.23497690855016378775 -0.014422513974953206362 -0.12310435190223667501 -0.3241472719281082715 -0.2300130052212029097;-2.1678039687098924482 1.8439838995762889429 -0.0018871717921447571115 0.063143555281714239258 -0.43648152697912195874 -0.57027621106822257158 0.11809064415437364737 -0.26699232866299404954 -0.042235735249318707984 -0.21857051674604879854;0.61594543129940948489 0.84992202197882504855 0.33547516840062513443 0.008481633240149822478 -0.40233566222474015373 -0.17378809051220958648 0.13498653023067161416 -0.15166861456524882712 0.064899636061129306608 0.084942958934235576751;0.041959713428578841732 -0.54170709391298688118 -0.37550342853058954473 0.38780163347005058849 0.41758399298068110683 -0.21537804146028224905 0.29738902714661979987 -0.29659631245838580238 -0.46681228286948595052 0.54325269235176931737;-0.10203869727039542592 0.049185064664690442138 0.34547225260587732798 -0.44734924755714816635 -0.050447539273621284928 0.057598969238334157827 0.54428160576100070855 -0.26496569831949962071 0.16260515839439393382 0.8160155799134354293;1.9662573126825249048 -1.7797734646214187215 0.15012937989190680566 0.092658770471086018827 0.60977108423602877085 0.68597182711183335435 -0.34848716628019493768 0.11976365751271043913 -0.13315277095924568651 -0.20458230168503002688;0.92683882974860853921 -0.19016262532022720766 0.10395854374546925625 -0.61275456288068674837 -0.46390561256553247693 -0.012786105507610381546 0.044376667562088148444 0.39474843285596022957 -0.35869371582753906136 0.26524839439626973769;-0.12097503308237428366 0.637401771459838562 0.0001692341639182790014 0.63227769865020500006 0.36953841858020936018 0.351888947718080769 0.070113461544784552726 0.31601731173011321507 -0.14258828315851643231 -0.42130710203016474846];

% Layer 2
b2 = 0.30664743310387226893;
LW2_1 = [-2.0787287086310395345 1.6428628175533055433 -0.37495472670008322957 -1.8094495126656995332 0.36451569171616382548 1.0681792929464495323 1.4724518156909789379 1.0627847070607989721 0.87526514726470938665 -1.6880260196546708062 0.85068905659083504656 -0.71830919403818849212 -1.718724606226843088 0.21816138666196371876 0.52480305659939430196 1.4434911625100352861 0.59650867307051658184 0.54928473431479796218 0.7631685591745560604 -1.0893384633823233187 0.62002172036853753223 1.2374677168366436941 0.087358621971492175784 -2.0437445395205995347 -0.90021156072196972797 1.9318306674943233059 -0.4306406374754555566 0.71267560706008958871 -0.011477933829881624417 1.3156452453542448744 1.8132245484737605778 1.5937218874237819577];

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
