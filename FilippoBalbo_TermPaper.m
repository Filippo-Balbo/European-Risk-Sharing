clc
clear

%Take countries and dates:
[data1_1,text1] = xlsread('AFdata.xlsx','population'); % database for replicating analysis and new data OECD
[data2_1,text2] = xlsread('Eu.xlsx','Sheet1'); % database for new EU and EMU data
[data3_1,text3] = xlsread('Eu.xlsx','Sheet3'); % database for new aggregate data for new EU and EMU data

% Variable with all the countries data for replicating analysis:
COUNTRIES = text1(2:24,1);
OECD_COUNTRIES = COUNTRIES;

% Variables for new EU and EMU data:
neu_gdp = text2(:,5);
neu_gdp = str2double(neu_gdp);
neu_cons = text2(:,7);
neu_cons = str2double(neu_cons);
neu_pop = text2(:,9);
neu_pop = str2double(neu_pop);
neu_inc = text2(:,13);
neu_inc = str2double(neu_inc);
neu_deflator = text2(:,11);
neu_deflator = str2double(neu_deflator);

% Variables for new EU and EMU aggregates:
neu_row_gdp = text3(26:38,4);
neu_row_gdp = str2double(neu_row_gdp);
neu_row_cons = text3(26:38,6);
neu_row_cons = str2double(neu_row_cons);
neu_row_income = text3(26:38,12);
neu_row_income = str2double(neu_row_income);
new_row_pop = text3(26:38,8);
new_row_pop = str2double(new_row_pop);
neu_row_deflator = text3(26:38,11);
neu_row_deflator = str2double(neu_row_deflator);

neu_gdp = neu_gdp./neu_pop;
neu_gdp = neu_gdp./neu_deflator;
neu_cons = neu_cons./neu_pop;
neu_cons = neu_cons./neu_deflator;
neu_inc = neu_inc./neu_pop;
neu_inc = neu_inc./neu_deflator;

neu_row_gdp = neu_row_gdp./new_row_pop;
neu_row_gdp = neu_row_gdp./neu_row_deflator;
neu_row_cons = neu_row_cons./new_row_pop;
neu_row_cons = neu_row_cons./neu_row_deflator;
neu_row_income = neu_row_income./new_row_pop;
neu_row_income = neu_row_income./neu_row_deflator;

% Variables for new indicators EU and EMU data:
NEW_EU_GDP = [neu_gdp(27:39,:),neu_gdp(69:81,:),neu_gdp(111:123,:),neu_gdp(153:165,:),neu_gdp(195:207,:),neu_gdp(237:249,:),neu_gdp(279:291,:),neu_gdp(321:333,:),neu_gdp(363:375,:),neu_gdp(405:417,:),neu_gdp(447:459,:),neu_gdp(489:501,:),neu_gdp(531:543,:),neu_gdp(573:585,:),neu_gdp(615:627,:)];
NEW_EMU_GDP = [neu_gdp(27:39,:),neu_gdp(69:81,:),neu_gdp(153:165,:),neu_gdp(195:207,:),neu_gdp(237:249,:),neu_gdp(279:291,:),neu_gdp(321:333,:),neu_gdp(363:375,:),neu_gdp(405:417,:),neu_gdp(447:459,:),neu_gdp(489:501,:),neu_gdp(531:543,:)];
NEW_EU_INCOME = [neu_inc(27:39,:),neu_inc(69:81,:),neu_inc(111:123,:),neu_inc(153:165,:),neu_inc(195:207,:),neu_inc(237:249,:),neu_inc(279:291,:),neu_inc(321:333,:),neu_inc(363:375,:),neu_inc(405:417,:),neu_inc(447:459,:),neu_inc(489:501,:),neu_inc(531:543,:),neu_inc(573:585,:),neu_inc(615:627,:)];
NEW_EMU_INCOME = [neu_inc(27:39,:),neu_inc(69:81,:),neu_inc(153:165,:),neu_inc(195:207,:),neu_inc(237:249,:),neu_inc(279:291,:),neu_inc(321:333,:),neu_inc(363:375,:),neu_inc(405:417,:),neu_inc(447:459,:),neu_inc(489:501,:),neu_inc(531:543,:)];
NEW_EU_CONS = [neu_cons(27:39,:),neu_cons(69:81,:),neu_cons(111:123,:),neu_cons(153:165,:),neu_cons(195:207,:),neu_cons(237:249,:),neu_cons(279:291,:),neu_cons(321:333,:),neu_cons(363:375,:),neu_cons(405:417,:),neu_cons(447:459,:),neu_cons(489:501,:),neu_cons(531:543,:),neu_cons(573:585,:),neu_cons(615:627,:)];
NEW_EMU_CONS = [neu_cons(27:39,:),neu_cons(69:81,:),neu_cons(153:165,:),neu_cons(195:207,:),neu_cons(237:249,:),neu_cons(279:291,:),neu_cons(321:333,:),neu_cons(363:375,:),neu_cons(405:417,:),neu_cons(447:459,:),neu_cons(489:501,:),neu_cons(531:543,:)];


EU_COUNTRIES = [COUNTRIES(2,1:end);COUNTRIES(3,1:end);COUNTRIES(5,1:end);COUNTRIES(6,1:end);...
    COUNTRIES(7,1:end);COUNTRIES(8,1:end);COUNTRIES(9,1:end);COUNTRIES(11,1:end);...
    COUNTRIES(12,1:end);COUNTRIES(14,1:end);COUNTRIES(15,1:end);...
    COUNTRIES(18,1:end);COUNTRIES(19,1:end);COUNTRIES(20,1:end);COUNTRIES(22,1:end)];


EMU_COUNTRIES = [COUNTRIES(2,1:end);COUNTRIES(3,1:end);COUNTRIES(6,1:end);...
    COUNTRIES(7,1:end);COUNTRIES(8,1:end);COUNTRIES(9,1:end);COUNTRIES(11,1:end);...
    COUNTRIES(12,1:end);COUNTRIES(14,1:end);COUNTRIES(15,1:end);...
    COUNTRIES(18,1:end);COUNTRIES(19,1:end)];

dates1 = data1_1(1,1:60);
dates2 = str2double(text2(27:41,10));


data1_1(isnan(data1_1)) = 0; % Remove NaN

OECD_POP = data1_1(2:end,1:end);

EU_POP = [data1_1(2,1:end);data1_1(3,1:end);data1_1(5,1:end);data1_1(6,1:end);...
    data1_1(7,1:end);data1_1(8,1:end);data1_1(9,1:end);data1_1(11,1:end);...
    data1_1(12,1:end);data1_1(14,1:end);data1_1(15,1:end);...
    data1_1(18,1:end);data1_1(19,1:end);data1_1(20,1:end);data1_1(22,1:end)];

EMU_POP = [data1_1(2,1:end);data1_1(3,1:end);data1_1(6,1:end);...
    data1_1(7,1:end);data1_1(8,1:end);data1_1(9,1:end);data1_1(11,1:end);...
    data1_1(12,1:end);data1_1(14,1:end);data1_1(15,1:end);...
    data1_1(18,1:end);data1_1(19,1:end)];

[data1_2] = xlsread('AFdata.xlsx','GDP');
data1_2(isnan(data1_2)) = 0; % Remove NaN

OECD_GDP = data1_2(2:end,1:end);

EU_GDP = [data1_2(2,1:end);data1_2(3,1:end);data1_2(5,1:end);data1_2(6,1:end);...
    data1_2(7,1:end);data1_2(8,1:end);data1_2(9,1:end);data1_2(11,1:end);...
    data1_2(12,1:end);data1_2(14,1:end);data1_2(15,1:end);...
    data1_2(18,1:end);data1_2(19,1:end);data1_2(20,1:end);data1_2(22,1:end)];

EMU_GDP = [data1_2(2,1:end);data1_2(3,1:end);data1_2(6,1:end);...
    data1_2(7,1:end);data1_2(8,1:end);data1_2(9,1:end);data1_2(11,1:end);...
    data1_2(12,1:end);data1_2(14,1:end);data1_2(15,1:end);...
    data1_2(18,1:end);data1_2(19,1:end)];

[data1_3] = xlsread('AFdata.xlsx','income');
data1_3(isnan(data1_3)) = 0; % Remove NaN
OECD_INCOME = data1_3(2:end,1:end);

EU_INCOME = [data1_3(2,1:end);data1_3(3,1:end);data1_3(5,1:end);data1_3(6,1:end);...
    data1_3(7,1:end);data1_3(8,1:end);data1_3(9,1:end);data1_3(11,1:end);...
    data1_3(12,1:end);data1_3(14,1:end);data1_3(15,1:end);...
    data1_3(18,1:end);data1_3(19,1:end);data1_3(20,1:end);data1_3(22,1:end)];

EMU_INCOME = [data1_3(2,1:end);data1_3(3,1:end);data1_3(6,1:end);...
    data1_3(7,1:end);data1_3(8,1:end);data1_3(9,1:end);data1_3(11,1:end);...
    data1_3(12,1:end);data1_3(14,1:end);data1_3(15,1:end);...
    data1_3(18,1:end);data1_3(19,1:end)];

[data1_4] = xlsread('AFdata.xlsx','price level');
data1_4(isnan(data1_4)) = 0; % Remove NaN
OECD_PRICE = data1_4(2:end,1:end);

EU_PRICE = [data1_4(2,1:end);data1_4(3,1:end);data1_4(5,1:end);data1_4(6,1:end);...
    data1_4(7,1:end);data1_4(8,1:end);data1_4(9,1:end);data1_4(11,1:end);...
    data1_4(12,1:end);data1_4(14,1:end);data1_4(15,1:end);...
    data1_4(18,1:end);data1_4(19,1:end);data1_4(20,1:end);data1_4(22,1:end)];

EMU_PRICE = [data1_4(2,1:end);data1_4(3,1:end);data1_4(6,1:end);...
    data1_4(7,1:end);data1_4(8,1:end);data1_4(9,1:end);data1_4(11,1:end);...
    data1_4(12,1:end);data1_4(14,1:end);data1_4(15,1:end);...
    data1_4(18,1:end);data1_4(19,1:end)];

[data1_5] = xlsread('AFdata.xlsx','consumption share');
data1_5(isnan(data1_5)) = 0; % Remove NaN
OECD_CONSUMPTION = data1_5(2:end,1:end);
OECD_CONSUMPTION = OECD_CONSUMPTION.*OECD_GDP;

EU_CONSUMPTION = [data1_5(2,1:end);data1_5(3,1:end);data1_5(5,1:end);data1_5(6,1:end);...
    data1_5(7,1:end);data1_5(8,1:end);data1_5(9,1:end);data1_5(11,1:end);...
    data1_5(12,1:end);data1_5(14,1:end);data1_5(15,1:end);...
    data1_5(18,1:end);data1_5(19,1:end);data1_5(20,1:end);data1_5(22,1:end)];
EU_CONSUMPTION = EU_CONSUMPTION.*EU_GDP;

EMU_CONSUMPTION = [data1_5(2,1:end);data1_5(3,1:end);data1_5(6,1:end);...
    data1_5(7,1:end);data1_5(8,1:end);data1_5(9,1:end);data1_5(11,1:end);...
    data1_5(12,1:end);data1_5(14,1:end);data1_5(15,1:end);...
    data1_5(18,1:end);data1_5(19,1:end)];
EMU_CONSUMPTION = EMU_CONSUMPTION.*EMU_GDP;

% Aggregates data for replicating analysis:
RoW_GDP = mean(OECD_GDP);
RoW_INCOME = mean(OECD_INCOME);
RoW_CONS = mean(OECD_CONSUMPTION);

% Dividing new aggregates in the two period: first one for the tables and
% second one for the figures:

% Aggregates data for period 2004-2012:
NEW_RoW_GDP1 = neu_row_gdp(6:end,:);
NEW_RoW_INCOME1 = neu_row_income(6:end,:);
NEW_RoW_CONS1 = neu_row_cons(6:end,:);

% Aggregates data for period 2000-2012:
NEW_RoW_GDP = neu_row_gdp;
NEW_RoW_INCOME = neu_row_income;
NEW_RoW_CONS = neu_row_cons;

% Since the other data are already per capita and in real terms it's not
% necessary to manage them more.

% TAKING LOGS AND DIFFERENCIES OF AGGREGATES AND COUNTRIES:
% Aggregates:
dRoW_GDP = diff(log(RoW_GDP'));
dRoW_INCOME = diff(log(RoW_INCOME'));
dRoW_CONS = diff(log(RoW_CONS'));

% Countries (for first period):
dOECD_GDP = diff(log(OECD_GDP'));
dOECD_CONSUMPTION = diff(log(OECD_CONSUMPTION'));
dOECD_INCOME = diff(log(OECD_INCOME'));

dEU_GDP = diff(log(EU_GDP'));
dEU_CONSUMPTION = diff(log(EU_CONSUMPTION'));
dEU_INCOME = diff(log(EU_INCOME'));

dEMU_GDP = diff(log(EMU_GDP'));
dEMU_CONSUMPTION = diff(log(EMU_CONSUMPTION'));
dEMU_INCOME = diff(log(EMU_INCOME'));

% New period EU:
dNEW_EMU_GDP = diff(log(NEW_EMU_GDP));
dNEW_EMU_CONSUMPTION = diff(log(NEW_EMU_CONS));
dNEW_EMU_INCOME = diff(log(NEW_EMU_INCOME));

dNEW_EU_GDP = diff(log(NEW_EU_GDP));
dNEW_EU_CONSUMPTION = diff(log(NEW_EU_CONS));
dNEW_EU_INCOME = diff(log(NEW_EU_INCOME));

dNEW_RoW_GDP = diff(log(NEW_RoW_GDP));
dNEW_RoW_INCOME = diff(log(NEW_RoW_INCOME));
dNEW_RoW_CONS = diff(log(NEW_RoW_CONS));

% IDIOSYNCRATIC COMPONENTS:
% Create a matrix for the computation:
dAGG_OECDGDP = dRoW_GDP*ones(1,23);
dAGG_OECDCONS = dRoW_CONS*ones(1,23);
dAGG_OECDINCOME = dRoW_INCOME*ones(1,23);

dAGG_EMUGDP = dRoW_GDP*ones(1,12);
dAGG_EMUCONS = dRoW_CONS*ones(1,12);
dAGG_EMUINCOME = dRoW_INCOME*ones(1,12);

dAGG_EUGDP = dRoW_GDP*ones(1,15);
dAGG_EUCONS = dRoW_CONS*ones(1,15);
dAGG_EUINCOME = dRoW_INCOME*ones(1,15);

% New period 2004-2012:
dAGG_NEW_EMUGDP = dNEW_RoW_GDP*ones(1,12);
dAGG_NEW_EMUCONS = dNEW_RoW_CONS*ones(1,12);
dAGG_NEW_EMUINCOME = dNEW_RoW_INCOME*ones(1,12);

dAGG_NEW_EUGDP = dNEW_RoW_GDP*ones(1,15);
dAGG_NEW_EUCONS = dNEW_RoW_CONS*ones(1,15);
dAGG_NEW_EUINCOME = dNEW_RoW_INCOME*ones(1,15);

% Compute idiosyncratic components:
% Old period
iOECD_GDP = dOECD_GDP - dAGG_OECDGDP;
iOECD_CONS = dOECD_CONSUMPTION - dAGG_OECDCONS;
iOECD_INCOME = dOECD_INCOME - dAGG_OECDINCOME;

iEMU_GDP = dEMU_GDP - dAGG_EMUGDP;
iEMU_CONS = dEMU_CONSUMPTION - dAGG_EMUCONS;
iEMU_INCOME = dEMU_INCOME - dAGG_EMUINCOME;
 
iEU_GDP = dEU_GDP - dAGG_EUGDP;
iEU_CONS = dEU_CONSUMPTION - dAGG_EUCONS;
iEU_INCOME = dEU_INCOME - dAGG_EUINCOME;

% New period EU:
iNEW_EMU_GDP = dNEW_EMU_GDP - dAGG_NEW_EMUGDP;
iNEW_EMU_CONS = dNEW_EMU_CONSUMPTION - dAGG_NEW_EMUCONS;
iNEW_EMU_INCOME = dNEW_EMU_INCOME - dAGG_NEW_EMUINCOME;
 
iNEW_EU_GDP = dNEW_EU_GDP - dAGG_NEW_EUGDP;
iNEW_EU_CONS = dNEW_EU_CONSUMPTION - dAGG_NEW_EUCONS;
iNEW_EU_INCOME = dNEW_EU_INCOME - dAGG_NEW_EUINCOME;


% Taking the right time isolating two subperiod:
% 1980-1990:
iOECD_GDP1 = iOECD_GDP(31:41,:);
iOECD_CONS1 =  iOECD_CONS(31:41,:);
iOECD_INCOME1 = iOECD_INCOME(31:41,:);

iEMU_GDP1 = iEMU_GDP(31:41,:);
iEMU_CONS1 = iEMU_CONS(31:41,:);
iEMU_INCOME1 = iEMU_INCOME(31:41,:);
 
iEU_GDP1 = iEU_GDP(31:41,:);
iEU_CONS1 = iEU_CONS(31:41,:);
iEU_INCOME1 = iEU_INCOME(31:41,:);

% 1990-2004:                              
iOECD_GDP2 = iOECD_GDP(41:55,:);
iOECD_CONS2 =  iOECD_CONS(41:55,:);
iOECD_INCOME2 = iOECD_INCOME(41:55,:);

iEMU_GDP2 = iEMU_GDP(41:55,:);
iEMU_CONS2 = iEMU_CONS(41:55,:);
iEMU_INCOME2 = iEMU_INCOME(41:55,:);
 
iEU_GDP2 = iEU_GDP(41:55,:);
iEU_CONS2 = iEU_CONS(41:55,:);
iEU_INCOME2 = iEU_INCOME(41:55,:);

% New OECD period 2004-2009:  
iNEW_OECD_GDP1 = iOECD_GDP(55:end,:);
iNEW_OECD_CONS1 =  iOECD_CONS(55:end,:);
iNEW_OECD_INCOME1 = iOECD_INCOME(55:end,:);

% New EU period (2004-2012):
iNEW_EMU_GDP1 = iNEW_EMU_GDP(5:end,:);
iNEW_EMU_CONS1 = iNEW_EMU_CONS(5:end,:);
iNEW_EMU_INCOME1 = iNEW_EMU_INCOME(5:end,:);
 
iNEW_EU_GDP1 = iNEW_EU_GDP(5:end,:);
iNEW_EU_CONS1 = iNEW_EU_CONS(5:end,:);
iNEW_EU_INCOME1 = iNEW_EU_INCOME(5:end,:);

% Controlling only for time fixed effect:
iOECD_GDP1 = FE_function(iOECD_GDP1,1,0);
iOECD_GDP2 = FE_function(iOECD_GDP2,1,0);
iOECD_CONS1 = FE_function(iOECD_CONS1,1,0);
iOECD_CONS2 = FE_function(iOECD_CONS2,1,0);
iOECD_INCOME1 = FE_function(iOECD_INCOME1,1,0);
iOECD_INCOME2 = FE_function(iOECD_INCOME2,1,0);

iEMU_GDP1 = FE_function(iEMU_GDP1,1,0);
iEMU_GDP2 = FE_function(iEMU_GDP2,1,0);
iEMU_CONS1 = FE_function(iEMU_CONS1,1,0);
iEMU_CONS2 = FE_function(iEMU_CONS2,1,0);
iEMU_INCOME1 = FE_function(iEMU_INCOME1,1,0);
iEMU_INCOME2 = FE_function(iEMU_INCOME2,1,0);

iEU_GDP1 = FE_function(iEU_GDP1,1,0);
iEU_GDP2 = FE_function(iEU_GDP2,1,0);
iEU_CONS1 = FE_function(iEU_CONS1,1,0);
iEU_CONS2 = FE_function(iEU_CONS2,1,0);
iEU_INCOME1 = FE_function(iEU_INCOME1,1,0);
iEU_INCOME2 = FE_function(iEU_INCOME2,1,0);

% TABLE 1 RIGHT:
% OECD
%1980-1990:
OLS_OECD1 = OLSReg(iOECD_CONS1(:),[ones(size(iOECD_CONS1(:))),iOECD_GDP1(:)]);
b_OECD1 = OLS_OECD1.b;
t_OECD1 = OLS_OECD1.tstat;
%1990-2004:
OLS_OECD2 = OLSReg(iOECD_CONS2(:),[ones(size(iOECD_CONS2(:))),iOECD_GDP2(:)]);
b_OECD2 = OLS_OECD2.b;
t_OECD2 = OLS_OECD2.tstat;

% EU
%1980-1990:
OLS_EU1 = OLSReg(iEU_CONS1(:),[ones(size(iEU_CONS1(:))),iEU_GDP1(:)]);
b_EU1 = OLS_EU1.b;
t_EU1 = OLS_EU1.tstat;
%1990-2004:
OLS_EU2 = OLSReg(iEU_CONS2(:),[ones(size(iEU_CONS2(:))),iEU_GDP2(:)]);
b_EU2 = OLS_EU2.b;
t_EU2 = OLS_EU2.tstat;

% EMU 
%1980-1990:
OLS_EMU1 = OLSReg(iEMU_CONS1(:),[ones(size(iEMU_CONS1(:))),iEMU_GDP1(:)]);
b_EMU1 = OLS_EMU1.b;
t_EMU1 = OLS_EMU1.tstat;
%1990-2004:
OLS_EMU2 = OLSReg(iEMU_CONS2(:),[ones(size(iEMU_CONS2(:))),iEMU_GDP2(:)]);
b_EMU2 = OLS_EMU2.b;
t_EMU2 = OLS_EMU2.tstat;

% New periodS 2004-2009/12:
% New OECD 2004-2009:
OLS_NEW_OECD1 = OLSReg(iNEW_OECD_CONS1(:),[ones(size(iNEW_OECD_CONS1(:))),iNEW_OECD_GDP1(:)]);
b_NEW_OECD1 = OLS_NEW_OECD1.b;
t_NEW_OECD1 = OLS_NEW_OECD1.tstat;

% New EU/EMU 2004-2012:
%EU
OLS_NEW_EU1 = OLSReg(iNEW_EU_CONS1(:),[ones(size(iNEW_EU_CONS1(:))),iNEW_EU_GDP1(:)]);
b_NEW_EU1 = OLS_NEW_EU1.b;
t_NEW_EU1 = OLS_NEW_EU1.tstat;
%EMU
OLS_NEW_EMU1 = OLSReg(iNEW_EMU_CONS1(:),[ones(size(iNEW_EMU_CONS1(:))),iNEW_EMU_GDP1(:)]);
b_NEW_EMU1 = OLS_NEW_EMU1.b;
t_NEW_EMU1 = OLS_NEW_EMU1.tstat;

% FIGURE 1:
% I need to perform a cross-sectional risk sharing regression for Figure 1
% and in addition, following the original paper, I need to compute
% different time windows:

% Period 1980-2000 (for Figure 1):
iOECD_GDP3 = iOECD_GDP(31:51,:);
iOECD_CONS3 =  iOECD_CONS(31:51,:);
iOECD_INCOME3 = iOECD_INCOME(31:51,:);

iEMU_GDP3 = iEMU_GDP(31:51,:);
iEMU_CONS3 = iEMU_CONS(31:51,:);
iEMU_INCOME3 = iEMU_INCOME(31:51,:);
 
iEU_GDP3 = iEU_GDP(31:51,:);
iEU_CONS3 = iEU_CONS(31:51,:);
iEU_INCOME3 = iEU_INCOME(31:51,:);

%Control for time fixed effects:
% iOECD_GDP3 = FE_function(iOECD_GDP3,1,0);
% iOECD_CONS3 = FE_function(iOECD_CONS3,1,0);
% iOECD_INCOME3 = FE_function(iOECD_INCOME3,1,0);
% 
% iEMU_GDP3 = FE_function(iEMU_GDP3,1,0);
% iEMU_CONS3 = FE_function(iEMU_CONS3,1,0);
% iEMU_INCOME3 = FE_function(iEMU_INCOME3,1,0);
% 
% iEU_GDP3 = FE_function(iEU_GDP3,1,0);
% iEU_CONS3 = FE_function(iEU_CONS3,1,0);
% iEU_INCOME3 = FE_function(iEU_INCOME3,1,0);

%FIGURE 1:
% Basic Sharing Regression for the period 1980-2000:
iOECD_CONS3 = iOECD_CONS3';
iOECD_GDP3 = iOECD_GDP3';

iEMU_GDP3 = iEMU_GDP3';
iEMU_CONS3 = iEMU_CONS3';

iEU_CONS3 = iEU_CONS3';
iEU_GDP3 = iEU_GDP3';

for i = 1:21

OLS_OECD3 = OLSReg(iOECD_CONS3(:,i),[ones(size(iOECD_CONS3,1),1),iOECD_GDP3(:,i)]);
b_OECD3(:,i) = OLS_OECD3.b;
t_OECD3(:,i)= OLS_OECD3.tstat;
    
OLS_EU3 = OLSReg(iEU_CONS3(:,i),[ones(size(iEU_CONS3,1),1),iEU_GDP3(:,i)]);
b_EU3(:,i) = OLS_EU3.b;
t_EU3(:,i)= OLS_EU3.tstat;

OLS_EMU3 = OLSReg(iEMU_CONS3(:,i),[ones(size(iEMU_CONS3,1),1),iEMU_GDP3(:,i)]);
b_EMU3(:,i) = OLS_EMU3.b;
t_EMU3(:,i)= OLS_EMU3.tstat;

end

beta_OECD3 = mean(b_OECD3(2,:));
ts_OECD3 = mean(t_OECD3(2,:));

beta_EU3 = mean(b_EU3(2,:));
ts_EU3 = mean(t_EU3(2,:));

beta_EMU3 = mean(b_EMU3(2,:));
ts_EMU3 = mean(t_EMU3(2,:));

% Basic risk sharing for the period 2000-2009 (OECD): 
iNEW_OECD_CONS2 = iOECD_CONS(51:end,:)';
iNEW_OECD_GDP2 = iOECD_GDP(51:end,:)';

for i = 1:9
OLS_NEW_OECD2 = OLSReg(iNEW_OECD_CONS2(:,i),[ones(size(iNEW_OECD_CONS2,1),1),iNEW_OECD_GDP2(:,i)]);
b_NEW_OECD2(:,i) = OLS_NEW_OECD2.b;
t_NEW_OECD2(:,i)= OLS_NEW_OECD2.tstat;
end

% Basic risk sharing for the period 2000-2012:
iNEW_EMU_CONS2 = iNEW_EMU_CONS';
iNEW_EMU_GDP2 = iNEW_EMU_GDP';
iNEW_EU_CONS2 = iNEW_EU_CONS';
iNEW_EU_GDP2 = iNEW_EU_GDP';

for i = 1:12
OLS_NEW_EU2 = OLSReg(iNEW_EU_CONS2(:,i),[ones(size(iNEW_EU_CONS2,1),1),iNEW_EU_GDP2(:,i)]);
b_NEW_EU2(:,i) = OLS_NEW_EU2.b;
t_NEW_EU2(:,i)= OLS_NEW_EU2.tstat;

OLS_NEW_EMU2 = OLSReg(iNEW_EMU_CONS2(:,i),[ones(size(iNEW_EMU_CONS2,1),1),iNEW_EMU_GDP2(:,i)]);
b_NEW_EMU2(:,i) = OLS_NEW_EMU2.b;
t_NEW_EMU2(:,i)= OLS_NEW_EMU2.tstat; 

end

% BASIC RISK SHARING REGRESSION WITH LEVELS (for Figure 1):

% Idiosyncratic components without difference 1980-2000:
iOECD_GDP_L = log(OECD_GDP') - log(RoW_GDP');
iOECD_CONS_L = log(OECD_CONSUMPTION') - log(RoW_CONS');
iOECD_INCOME_L = log(OECD_INCOME') - log(RoW_INCOME');

iEMU_GDP_L = log(EMU_GDP') - log(RoW_GDP');
iEMU_CONS_L = log(EMU_CONSUMPTION') - log(RoW_CONS');
iEMU_INCOME_L = log(EMU_INCOME') - log(RoW_INCOME');
 
iEU_GDP_L = log(EU_GDP') - log(RoW_GDP');
iEU_CONS_L = log(EU_CONSUMPTION') - log(RoW_CONS');
iEU_INCOME_L = log(EU_INCOME') - log(RoW_INCOME');

% Idiosyncratic components without difference 2000-2012:
i_NEW_EMU_GDP_L = log(NEW_EMU_GDP) - log(NEW_RoW_GDP);
i_NEW_EMU_CONS_L = log(NEW_EMU_CONS) - log(NEW_RoW_CONS);
i_NEW_EMU_INCOME_L = log(NEW_EMU_INCOME) - log(NEW_RoW_INCOME);
 
i_NEW_EU_GDP_L = log(NEW_EU_GDP) - log(NEW_RoW_GDP);
i_NEW_EU_CONS_L = log(NEW_EU_CONS) - log(NEW_RoW_CONS);
i_NEW_EU_INCOME_L = log(NEW_EU_INCOME) - log(NEW_RoW_INCOME);

% Take the period 1980-2000:
iOECD_GDP_L1 = iOECD_GDP_L(31:51,:);
iOECD_CONS_L1 =  iOECD_CONS_L(31:51,:);
iOECD_INCOME_L1 = iOECD_INCOME_L(31:51,:);

iEMU_GDP_L1 = iEMU_GDP_L(31:51,:);
iEMU_CONS_L1 = iEMU_CONS_L(31:51,:);
iEMU_INCOME_L1 = iEMU_INCOME_L(31:51,:);
 
iEU_GDP_L1 = iEU_GDP_L(31:51,:);
iEU_CONS_L1 = iEU_CONS_L(31:51,:);
iEU_INCOME_L1 = iEU_INCOME_L(31:51,:);

% Take the period 2000-2009 (OECD):
i_NEW_OECD_GDP_L = iOECD_GDP_L(51:end,:);
i_NEW_OECD_CONS_L =  iOECD_CONS_L(51:end,:);
i_NEW_OECD_INCOME_L = iOECD_INCOME_L(51:end,:);

% Basic Sharing Regression with levels for the period 1980-2000:
iOECD_CONS_L1 = iOECD_CONS_L1';
iOECD_GDP_L1 = iOECD_GDP_L1';

iEMU_GDP_L1 = iEMU_GDP_L1';
iEMU_CONS_L1 = iEMU_CONS_L1';

iEU_CONS_L1 = iEU_CONS_L1';
iEU_GDP_L1 = iEU_GDP_L1';

for i = 1:21

OLS_OECD_L1 = OLSReg(iOECD_CONS_L1(:,i),[ones(size(iOECD_CONS_L1,1),1),iOECD_GDP_L1(:,i)]);
b_OECD_L1(:,i) = OLS_OECD_L1.b;
t_OECD_L1(:,i)= OLS_OECD_L1.tstat;
    
OLS_EU_L1 = OLSReg(iEU_CONS_L1(:,i),[ones(size(iEU_CONS_L1,1),1),iEU_GDP_L1(:,i)]);
b_EU_L1(:,i) = OLS_EU_L1.b;
t_EU_L1(:,i)= OLS_EU_L1.tstat;

OLS_EMU_L1 = OLSReg(iEMU_CONS_L1(:,i),[ones(size(iEMU_CONS_L1,1),1),iEMU_GDP_L1(:,i)]);
b_EMU_L1(:,i) = OLS_EMU_L1.b;
t_EMU_L1(:,i)= OLS_EMU_L1.tstat;

end

beta_OECD_L1 = mean(b_OECD_L1(2,:));
ts_OECD_L1 = mean(t_OECD_L1(2,:));

beta_EU_L1 = mean(b_EU_L1(2,:));
ts_EU_L1 = mean(t_EU_L1(2,:));

beta_EMU_L1 = mean(b_EMU_L1(2,:));
ts_EMU_L1 = mean(t_EMU_L1(2,:));

% Period 2000-2009:
i_NEW_OECD_GDP_L = i_NEW_OECD_GDP_L';
i_NEW_OECD_CONS_L =  i_NEW_OECD_CONS_L';
i_NEW_OECD_INCOME_L = i_NEW_OECD_INCOME_L';

for i = 1:10

OLS_NEW_OECD_L = OLSReg(i_NEW_OECD_CONS_L(:,i),[ones(size(i_NEW_OECD_CONS_L,1),1),i_NEW_OECD_GDP_L(:,i)]);
b_NEW_OECD_L(:,i) = OLS_NEW_OECD_L.b;
t_NEW_OECD_L(:,i)= OLS_NEW_OECD_L.tstat;
    
end

beta_NEW_OECD_L = mean(b_NEW_OECD_L(2,:));
ts_NEW_OECD_L = mean(t_NEW_OECD_L(2,:));

% Period 2000-2012 ( EU and EMU):
i_NEW_EU_GDP_L = i_NEW_EU_GDP_L';
i_NEW_EU_CONS_L = i_NEW_EU_CONS_L';

i_NEW_EMU_CONS_L = i_NEW_EMU_CONS_L';
i_NEW_EMU_GDP_L = i_NEW_EMU_GDP_L';

for i = 1:13
    
OLS_NEW_EU_L = OLSReg(i_NEW_EU_CONS_L(:,i),[ones(size(i_NEW_EU_CONS_L,1),1),i_NEW_EU_GDP_L(:,i)]);
b_NEW_EU_L(:,i) = OLS_NEW_EU_L.b;
t_NEW_EU_L(:,i)= OLS_NEW_EU_L.tstat;

OLS_NEW_EMU_L = OLSReg(i_NEW_EMU_CONS_L(:,i),[ones(size(i_NEW_EMU_CONS_L,1),1),i_NEW_EMU_GDP_L(:,i)]);
b_NEW_EMU_L(:,i) = OLS_NEW_EMU_L.b;
t_NEW_EMU_L(:,i)= OLS_NEW_EMU_L.tstat;

end

% FIGURE 1: 1980-2000:
%Picture 1.1
[g] = hpfilter(b_OECD3(2,1:end),100); 
figure(1)
plot(dates1(:,31:51),b_OECD3(2,1:end),'.-b')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with differences: OECD 1980-2000')

%Picture 1.2
[g] = hpfilter(b_EMU3(2,1:end),100); 
figure(2)
plot(dates1(:,31:51),b_EMU3(2,1:end),'.-b')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with differences: EMU 1980-2000')

%Picture 1.3
[g] = hpfilter(b_EU3(2,1:end),100); 
figure(3)
plot(dates1(:,31:51),b_EU3(2,1:end),'.-b')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with differences: EU 1980-2000')

%Picture 2.1
[g] = hpfilter(b_OECD_L1(2,1:end),100);
figure(4)
plot(dates1(:,31:51),b_OECD_L1(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with levels: OECD 1980-2000')

%Picture 2.2
[g] = hpfilter(b_EU_L1(2,1:end),100);
figure(5)
plot(dates1(:,31:51),b_EU_L1(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with levels: EU 1980-2000')

%Picture 2.3
[g] = hpfilter(b_EMU_L1(2,1:end),100);
figure(6)
plot(dates1(:,31:51),b_EMU_L1(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('Cross - sectional with levels: EMU 1980-2000')

% FIGURE 1: 2000-2009 and 2000-2012:

% Basic risk sharing with differences:
% Picture 3.1 - OECD
[g] = hpfilter(b_NEW_OECD2(2,1:end),100); 

figure(7)
plot(dates1(:,51:end-1),b_NEW_OECD2(2,1:end),'.-b')
hold on 
plot(dates1(:,51:end-1),g,'.--r')
title('Cross-sectional with differences: OECD 2000-2009')

%Picture 3.2 - EU
[g] = hpfilter(b_NEW_EU2(2,1:end),100); 

figure(8)
plot(dates2(1:end-3,:),b_NEW_EU2(2,1:end),'.-b')
hold on 
plot(dates2(1:end-3,:),g,'.--r')
title('Cross - sectional with differences: EU 2000-2012')

%Picture 3.3 - EMU
[g] = hpfilter(b_NEW_EMU2(2,1:end),100); 

figure(9)
plot(dates2(1:end-3,:),b_NEW_EMU2(2,1:end),'.-b')
hold on 
plot(dates2(1:end-3,:),g,'.--r')
title('Cross - sectional with differences: EMU 2000-2012')

% Basic risk sharing with levels:
% Picture 4.1 - OECD 2000-2009
[g] = hpfilter(b_NEW_OECD_L(2,1:end),100); 
figure(10)
plot(dates1(:,51:end),b_NEW_OECD_L(2,1:end),'.-k')
hold on 
plot(dates1(:,51:end),g,'.--r')
title('Cross - sectional with levels: OECD 2000-2009')

% Picture 4.2
[g] = hpfilter(b_NEW_EU_L(2,1:end),100); 
figure(11)
plot(dates2(1:end-2,:),b_NEW_EU_L(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('Cross - sectional with levels: EU 2000-2012')

% Picture 4.3
[g] = hpfilter(b_NEW_EMU_L(2,1:end),100); 
figure(12)
plot(dates2(1:end-2,:),b_NEW_EMU_L(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('Cross - sectional with levels: EMU 2000-2012')
 
% % close all

% TABLE AND FIGURE 2:

% Take the period 1980-1990 from 1980-2000:
iOECD_GDP_Pan1 = iOECD_GDP_L(31:41,:);
iOECD_CONS_Pan1 =  iOECD_CONS_L(31:41,:);
iOECD_INCOME_Pan1 = iOECD_INCOME_L(31:41,:);

iEMU_GDP_Pan1 = iEMU_GDP_L(31:41,:);
iEMU_CONS_Pan1 = iEMU_CONS_L(31:41,:);
iEMU_INCOME_Pan1 = iEMU_INCOME_L(31:41,:);
 
iEU_GDP_Pan1 = iEU_GDP_L(31:41,:);
iEU_CONS_Pan1 = iEU_CONS_L(31:41,:);
iEU_INCOME_Pan1 = iEU_INCOME_L(31:41,:);

% Take the period 1990-2004 from 1980-2000:
iOECD_GDP_Pan2 = iOECD_GDP_L(41:55,:);
iOECD_CONS_Pan2 =  iOECD_CONS_L(41:55,:);
iOECD_INCOME_Pan2 = iOECD_INCOME_L(41:55,:);

iEMU_GDP_Pan2 = iEMU_GDP_L(41:55,:);
iEMU_CONS_Pan2 = iEMU_CONS_L(41:55,:);
iEMU_INCOME_Pan2 = iEMU_INCOME_L(41:55,:);
 
iEU_GDP_Pan2 = iEU_GDP_L(41:55,:);
iEU_CONS_Pan2 = iEU_CONS_L(41:55,:);
iEU_INCOME_Pan2 = iEU_INCOME_L(41:55,:);

% Control for time fixed effects:
iOECD_GDP_Pan1 = FE_function(iOECD_GDP_Pan1,1,0);
iOECD_CONS_Pan1 = FE_function(iOECD_CONS_Pan1,1,0);
iOECD_INCOME_Pan1 = FE_function(iOECD_INCOME_Pan1,1,0);
iOECD_GDP_Pan2 = FE_function(iOECD_GDP_Pan2,1,0);
iOECD_CONS_Pan2 = FE_function(iOECD_CONS_Pan2,1,0);
iOECD_INCOME_Pan2 = FE_function(iOECD_INCOME_Pan2,1,0);

iEU_GDP_Pan1 = FE_function(iEU_GDP_Pan1,1,0);
iEU_CONS_Pan1 = FE_function(iEU_CONS_Pan1,1,0);
iEU_INCOME_Pan1 = FE_function(iEU_INCOME_Pan1,1,0);
iEU_GDP_Pan2 = FE_function(iEU_GDP_Pan2,1,0);
iEU_CONS_Pan2 = FE_function(iEU_CONS_Pan2,1,0);
iEU_INCOME_Pan2 = FE_function(iEU_INCOME_Pan2,1,0);

iEMU_GDP_Pan1 = FE_function(iEMU_GDP_Pan1,1,0);
iEMU_CONS_Pan1 = FE_function(iEMU_CONS_Pan1,1,0);
iEMU_INCOME_Pan1 = FE_function(iEMU_INCOME_Pan1,1,0);
iEMU_GDP_Pan2 = FE_function(iEMU_GDP_Pan2,1,0);
iEMU_CONS_Pan2 = FE_function(iEMU_CONS_Pan2,1,0);
iEMU_INCOME_Pan2 = FE_function(iEMU_INCOME_Pan2,1,0);

% Take the new period 2004-2009 (OECD):
i_NEW_OECD_GDP_Pan = iOECD_GDP_L(55:end,:);
i_NEW_OECD_CONS_Pan =  iOECD_CONS_L(55:end,:);
i_NEW_OECD_INCOME_Pan = iOECD_INCOME_L(55:end,:);

% Control for fixed effects:
i_NEW_OECD_GDP_Pan = FE_function(i_NEW_OECD_GDP_Pan,1,0);
i_NEW_OECD_CONS_Pan = FE_function(i_NEW_OECD_CONS_Pan,1,0);
i_NEW_OECD_INCOME_Pan = FE_function(i_NEW_OECD_INCOME_Pan,1,0);

% Take the new period 2004-2012 for EU and EMU 
i_NEW_EU_GDP_Pan = i_NEW_EU_GDP_L(:,5:end);
i_NEW_EU_CONS_Pan =  i_NEW_EU_CONS_L(:,5:end);
i_NEW_EU_INCOME_Pan = i_NEW_EU_INCOME_L(5:end,:);

i_NEW_EMU_GDP_Pan = i_NEW_EMU_GDP_L(:,5:end);
i_NEW_EMU_CONS_Pan =  i_NEW_EMU_CONS_L(:,5:end);
i_NEW_EMU_INCOME_Pan = i_NEW_EMU_INCOME_L(5:end,:);

% Control for fixed effects:
i_NEW_EU_GDP_Pan = FE_function(i_NEW_EU_GDP_Pan,1,0);
i_NEW_EU_GDP_Pan = FE_function(i_NEW_EU_GDP_Pan,1,0);
i_NEW_EU_INCOME_Pan = FE_function(i_NEW_EU_INCOME_Pan,1,0);
i_NEW_EMU_GDP_Pan = FE_function(i_NEW_EMU_GDP_Pan,1,0);
i_NEW_EMU_CONS_Pan = FE_function(i_NEW_EMU_CONS_Pan,1,0);
i_NEW_EMU_INCOME_Pan = FE_function(i_NEW_EMU_INCOME_Pan,1,0);

% Channels of long-run risk sharing:

% Period 1980-1990:
YK_OECD1 = iOECD_GDP_Pan1 - iOECD_INCOME_Pan1;
YC_OECD1 = iOECD_INCOME_Pan1 - iOECD_CONS_Pan1;
YU_OECD1 = iOECD_CONS_Pan1;

YK_EMU1 = iEMU_GDP_Pan1 - iEMU_INCOME_Pan1;
YC_EMU1 = iEMU_INCOME_Pan1 - iEMU_CONS_Pan1;
YU_EMU1 = iEMU_CONS_Pan1;
 
YK_EU1 = iEU_GDP_Pan1 - iEU_INCOME_Pan1;
YC_EU1 = iEU_INCOME_Pan1 - iEU_CONS_Pan1;
YU_EU1 = iEU_CONS_Pan1;

% Period 1990-2004:
YK_OECD2 = iOECD_GDP_Pan2 - iOECD_INCOME_Pan2;
YC_OECD2 = iOECD_INCOME_Pan2 - iOECD_CONS_Pan2;
YU_OECD2 = iOECD_CONS_Pan2;

YK_EMU2 = iEMU_GDP_Pan2 - iEMU_INCOME_Pan2;
YC_EMU2 = iEMU_INCOME_Pan2 - iEMU_CONS_Pan2;
YU_EMU2 = iEMU_CONS_Pan2;
 
YK_EU2 = iEU_GDP_Pan2 - iEU_INCOME_Pan2;
YC_EU2 = iEU_INCOME_Pan2 - iEU_CONS_Pan2;
YU_EU2 = iEU_CONS_Pan2;

% New period 2004-2009:
YK_OECD3 = i_NEW_OECD_GDP_Pan - i_NEW_OECD_INCOME_Pan;
YC_OECD3 = i_NEW_OECD_INCOME_Pan - i_NEW_OECD_CONS_Pan;
YU_OECD3 = i_NEW_OECD_CONS_Pan;

% New period 2004-2012:
i_NEW_EU_GDP_Pan = i_NEW_EU_GDP_Pan';
i_NEW_EU_CONS_Pan =  i_NEW_EU_CONS_Pan';

YK_EU3 = i_NEW_EU_GDP_Pan - i_NEW_EU_INCOME_Pan;
YC_EU3 = i_NEW_EU_INCOME_Pan - i_NEW_EU_CONS_Pan;
YU_EU3 = i_NEW_EU_CONS_Pan;


i_NEW_EMU_GDP_Pan = i_NEW_EMU_GDP_Pan';
i_NEW_EMU_CONS_Pan =  i_NEW_EMU_CONS_Pan';

YK_EMU3 = i_NEW_EMU_GDP_Pan - i_NEW_EMU_INCOME_Pan;
YC_EMU3 = i_NEW_EMU_INCOME_Pan - i_NEW_EMU_CONS_Pan;
YU_EMU3 = i_NEW_EMU_CONS_Pan;

% OLS PANEL REGRESSIONS:
% Period 1980-1990:
PANEL_OECD_K1 = OLSReg(YK_OECD1(:),[ones(size(YK_OECD1(:))),iOECD_GDP_Pan1(:)]);
PAN_b_OECD_K1 = PANEL_OECD_K1.b(2,:);
PAN_t_OECD_K1 = PANEL_OECD_K1.tstat(2,:);
PANEL_OECD_C1 = OLSReg(YC_OECD1(:),[ones(size(YC_OECD1(:))),iOECD_GDP_Pan1(:)]);
PAN_b_OECD_C1 = PANEL_OECD_C1.b(2,:);
PAN_t_OECD_C1 = PANEL_OECD_C1.tstat(2,:);
PANEL_OECD_U1 = OLSReg(YU_OECD1(:),[ones(size(YU_OECD1(:))),iOECD_GDP_Pan1(:)]);
PAN_b_OECD_U1 = PANEL_OECD_U1.b(2,:);
PAN_t_OECD_U1 = PANEL_OECD_U1.tstat(2,:);

PANEL_EU_K1 = OLSReg(YK_EU1(:),[ones(size(YK_EU1(:))),iEU_GDP_Pan1(:)]);
PAN_b_EU_K1 = PANEL_EU_K1.b(2,:);
PAN_t_EU_K1 = PANEL_EU_K1.tstat(2,:);
PANEL_EU_C1 = OLSReg(YC_EU1(:),[ones(size(YC_EU1(:))),iEU_GDP_Pan1(:)]);
PAN_b_EU_C1 = PANEL_EU_C1.b(2,:);
PAN_t_EU_C1 = PANEL_EU_C1.tstat(2,:);
PANEL_EU_U1 = OLSReg(YU_EU1(:),[ones(size(YU_EU1(:))),iEU_GDP_Pan1(:)]);
PAN_b_EU_U1 = PANEL_EU_U1.b(2,:);
PAN_t_EU_U1 = PANEL_EU_U1.tstat(2,:);

PANEL_EMU_K1 = OLSReg(YK_EMU1(:),[ones(size(YK_EMU1(:))),iEMU_GDP_Pan1(:)]);
PAN_b_EMU_K1 = PANEL_EMU_K1.b(2,:);
PAN_t_EMU_K1 = PANEL_EMU_K1.tstat(2,:);
PANEL_EMU_C1 = OLSReg(YC_EMU1(:),[ones(size(YC_EMU1(:))),iEMU_GDP_Pan1(:)]);
PAN_b_EMU_C1 = PANEL_EMU_C1.b(2,:);
PAN_t_EMU_C1 = PANEL_EMU_C1.tstat(2,:);
PANEL_EMU_U1 = OLSReg(YU_EMU1(:),[ones(size(YU_EMU1(:))),iEMU_GDP_Pan1(:)]);
PAN_b_EMU_U1 = PANEL_EMU_U1.b(2,:);
PAN_t_EMU_U1 = PANEL_EMU_U1.tstat(2,:);

% Period 1990-2004:
PANEL_OECD_K2 = OLSReg(YK_OECD2(:),[ones(size(YK_OECD2(:))),iOECD_GDP_Pan2(:)]);
PAN_b_OECD_K2 = PANEL_OECD_K2.b(2,:);
PAN_t_OECD_K2 = PANEL_OECD_K2.tstat(2,:);
PANEL_OECD_C2 = OLSReg(YC_OECD2(:),[ones(size(YC_OECD2(:))),iOECD_GDP_Pan2(:)]);
PAN_b_OECD_C2 = PANEL_OECD_C2.b(2,:);
PAN_t_OECD_C2 = PANEL_OECD_C2.tstat(2,:);
PANEL_OECD_U2 = OLSReg(YU_OECD2(:),[ones(size(YU_OECD2(:))),iOECD_GDP_Pan2(:)]);
PAN_b_OECD_U2 = PANEL_OECD_U2.b(2,:);
PAN_t_OECD_U2 = PANEL_OECD_U2.tstat(2,:);

PANEL_EU_K2 = OLSReg(YK_EU2(:),[ones(size(YK_EU2(:))),iEU_GDP_Pan2(:)]);
PAN_b_EU_K2 = PANEL_EU_K2.b(2,:);
PAN_t_EU_K2 = PANEL_EU_K2.tstat(2,:);
PANEL_EU_C2 = OLSReg(YC_EU2(:),[ones(size(YC_EU2(:))),iEU_GDP_Pan2(:)]);
PAN_b_EU_C2 = PANEL_EU_C2.b(2,:);
PAN_t_EU_C2 = PANEL_EU_C2.tstat(2,:);
PANEL_EU_U2 = OLSReg(YU_EU2(:),[ones(size(YU_EU2(:))),iEU_GDP_Pan2(:)]);
PAN_b_EU_U2 = PANEL_EU_U2.b(2,:);
PAN_t_EU_U2 = PANEL_EU_U2.tstat(2,:);

PANEL_EMU_K2 = OLSReg(YK_EMU2(:),[ones(size(YK_EMU2(:))),iEMU_GDP_Pan2(:)]);
PAN_b_EMU_K2 = PANEL_EMU_K2.b(2,:);
PAN_t_EMU_K2 = PANEL_EMU_K2.tstat(2,:);
PANEL_EMU_C2 = OLSReg(YC_EMU2(:),[ones(size(YC_EMU2(:))),iEMU_GDP_Pan2(:)]);
PAN_b_EMU_C2 = PANEL_EMU_C2.b(2,:);
PAN_t_EMU_C2 = PANEL_EMU_C2.tstat(2,:);
PANEL_EMU_U2 = OLSReg(YU_EMU2(:),[ones(size(YU_EMU2(:))),iEMU_GDP_Pan2(:)]);
PAN_b_EMU_U2 = PANEL_EMU_U2.b(2,:);
PAN_t_EMU_U2 = PANEL_EMU_U2.tstat(2,:);

% New Period 2004-2009 (OECD):
PANEL_OECD_K3 = OLSReg(YK_OECD3(:),[ones(size(YK_OECD3(:))),i_NEW_OECD_GDP_Pan(:)]);
PAN_b_OECD_K3 = PANEL_OECD_K3.b(2,:);
PAN_t_OECD_K3 = PANEL_OECD_K3.tstat(2,:);
PANEL_OECD_C3 = OLSReg(YC_OECD3(:),[ones(size(YC_OECD3(:))),i_NEW_OECD_GDP_Pan(:)]);
PAN_b_OECD_C3 = PANEL_OECD_C3.b(2,:);
PAN_t_OECD_C3 = PANEL_OECD_C3.tstat(2,:);
PANEL_OECD_U3 = OLSReg(YU_OECD3(:),[ones(size(YU_OECD3(:))),i_NEW_OECD_GDP_Pan(:)]);
PAN_b_OECD_U3 = PANEL_OECD_U3.b(2,:);
PAN_t_OECD_U3 = PANEL_OECD_U3.tstat(2,:);

% New Period 2004-2012 (EU and EMU):
PANEL_EU_K3 = OLSReg(YK_EU3(:),[ones(size(YK_EU3(:))),i_NEW_EU_GDP_Pan(:)]);
PAN_b_EU_K3 = PANEL_EU_K3.b(2,:);
PAN_t_EU_K3 = PANEL_EU_K3.tstat(2,:);
PANEL_EU_C3 = OLSReg(YC_EU3(:),[ones(size(YC_EU3(:))),i_NEW_EU_GDP_Pan(:)]);
PAN_b_EU_C3 = PANEL_EU_C3.b(2,:);
PAN_t_EU_C3 = PANEL_EU_C3.tstat(2,:);
PANEL_EU_U3 = OLSReg(YU_EU3(:),[ones(size(YU_EU3(:))),i_NEW_EU_GDP_Pan(:)]);
PAN_b_EU_U3 = PANEL_EU_U3.b(2,:);
PAN_t_EU_U3 = PANEL_EU_U3.tstat(2,:);

PANEL_EMU_K3 = OLSReg(YK_EMU3(:),[ones(size(YK_EMU3(:))),i_NEW_EMU_GDP_Pan(:)]);
PAN_b_EMU_K3 = PANEL_EMU_K3.b(2,:);
PAN_t_EMU_K3 = PANEL_EMU_K3.tstat(2,:);
PANEL_EMU_C3 = OLSReg(YC_EMU3(:),[ones(size(YC_EMU3(:))),i_NEW_EMU_GDP_Pan(:)]);
PAN_b_EMU_C3 = PANEL_EMU_C3.b(2,:);
PAN_t_EMU_C3 = PANEL_EMU_C3.tstat(2,:);
PANEL_EMU_U3 = OLSReg(YU_EMU3(:),[ones(size(YU_EMU3(:))),i_NEW_EMU_GDP_Pan(:)]);
PAN_b_EMU_U3 = PANEL_EMU_U3.b(2,:);
PAN_t_EMU_U3 = PANEL_EMU_U3.tstat(2,:);

% FIGURE 2: same procedure explained in the FIGURE 1
% Take period 1980-2000: 
LR_iOECD_CONS = iOECD_CONS_L1;
LR_iOECD_GDP = iOECD_GDP_L1;
LR_iOECD_INCOME = iOECD_INCOME_L1';
Yk_oecd1 = LR_iOECD_GDP - LR_iOECD_INCOME;
Yc_oecd1 = LR_iOECD_INCOME - LR_iOECD_CONS;
Yu_oecd1 = LR_iOECD_CONS;

LR_iEU_CONS = iEU_CONS_L1;
LR_iEU_GDP = iEU_GDP_L1;
LR_iEU_INCOME = iEU_INCOME_L1';
Yk_eu1 = LR_iEU_GDP - LR_iEU_INCOME;
Yc_eu1 = LR_iEU_INCOME - LR_iEU_CONS;
Yu_eu1 = LR_iEU_CONS;

LR_iEMU_GDP = iEMU_GDP_L1;
LR_iEMU_CONS = iEMU_CONS_L1;
LR_iEMU_INCOME = iEMU_INCOME_L1';
Yk_emu1 = LR_iEMU_GDP - LR_iEMU_INCOME;
Yc_emu1 = LR_iEMU_INCOME - LR_iEMU_CONS;
Yu_emu1 = LR_iEMU_CONS;

for i = 1:21

OLS_LR_OECD_K = OLSReg(Yk_oecd1(:,i),[ones(size(Yk_oecd1,1),1),LR_iOECD_GDP(:,i)]);
b_LR_OECD_K(:,i) = OLS_LR_OECD_K.b;
t_LR_OECD_K(:,i) = OLS_LR_OECD_K.tstat;
OLS_LR_OECD_C = OLSReg(Yc_oecd1(:,i),[ones(size(Yc_oecd1,1),1),LR_iOECD_GDP(:,i)]);
b_LR_OECD_C(:,i) = OLS_LR_OECD_C.b;
t_LR_OECD_C(:,i) = OLS_LR_OECD_C.tstat;

OLS_LR_EU_K = OLSReg(Yk_eu1(:,i),[ones(size(Yk_eu1,1),1),LR_iEU_GDP(:,i)]);
b_LR_EU_K(:,i) = OLS_LR_EU_K.b;
t_LR_EU_K(:,i) = OLS_LR_EU_K.tstat;
OLS_LR_EU_C = OLSReg(Yc_eu1(:,i),[ones(size(Yc_eu1,1),1),LR_iEU_GDP(:,i)]);
b_LR_EU_C(:,i) = OLS_LR_EU_C.b;
t_LR_EU_C(:,i) = OLS_LR_EU_C.tstat;

OLS_LR_EMU_K = OLSReg(Yk_emu1(:,i),[ones(size(Yk_emu1,1),1),LR_iEMU_GDP(:,i)]);
b_LR_EMU_K(:,i) = OLS_LR_EMU_K.b;
t_LR_EMU_K(:,i) = OLS_LR_EMU_K.tstat;
OLS_LR_EMU_C = OLSReg(Yc_emu1(:,i),[ones(size(Yc_emu1,1),1),LR_iEMU_GDP(:,i)]);
b_LR_EMU_C(:,i) = OLS_LR_EMU_C.b;
t_LR_EMU_C(:,i) = OLS_LR_EMU_C.tstat;

end

% Take period 2000-2009: 
LR_i_NEW_OECD_GDP = i_NEW_OECD_GDP_L;
LR_i_NEW_OECD_CONS =  i_NEW_OECD_CONS_L;
LR_i_NEW_OECD_INCOME = i_NEW_OECD_INCOME_L;
Yk_oecd2 = LR_i_NEW_OECD_GDP - LR_i_NEW_OECD_INCOME;
Yc_oecd2 = LR_i_NEW_OECD_INCOME - LR_i_NEW_OECD_CONS;
Yu_oecd2 = LR_i_NEW_OECD_CONS;

for i = 1:10

OLS_LR_NEW_OECD_K = OLSReg(Yk_oecd2(:,i),[ones(size(Yk_oecd2,1),1),LR_i_NEW_OECD_GDP(:,i)]);
b_LR_NEW_OECD_K(:,i) = OLS_LR_NEW_OECD_K.b;
t_LR_NEW_OECD_K(:,i)= OLS_LR_NEW_OECD_K.tstat;

OLS_LR_NEW_OECD_C = OLSReg(Yc_oecd2(:,i),[ones(size(Yc_oecd2,1),1),LR_i_NEW_OECD_GDP(:,i)]);
b_LR_NEW_OECD_C(:,i) = OLS_LR_NEW_OECD_C.b;
t_LR_NEW_OECD_C(:,i)= OLS_LR_NEW_OECD_C.tstat;
    
end

% Take the period 2000-2012:
LR_i_NEW_EU_GDP = i_NEW_EU_GDP_L;
LR_i_NEW_EMU_GDP = i_NEW_EMU_GDP_L;
LR_i_NEW_EU_INCOME = i_NEW_EU_INCOME_L';
LR_i_NEW_EMU_INCOME = i_NEW_EMU_INCOME_L';
LR_i_NEW_EU_CONS = i_NEW_EU_CONS_L;
LR_i_NEW_EMU_CONS = i_NEW_EMU_CONS_L;

% Channels
% EU
Yk_eu2 = LR_i_NEW_EU_GDP - LR_i_NEW_EU_INCOME;
Yc_eu2 = LR_i_NEW_EU_INCOME - LR_i_NEW_EU_CONS;
Yu_eu2 = LR_i_NEW_EU_CONS;

% EMU
Yk_emu2 = LR_i_NEW_EMU_GDP - LR_i_NEW_EMU_INCOME;
Yc_emu2 = LR_i_NEW_EMU_INCOME - LR_i_NEW_EMU_CONS;
Yu_emu2 = LR_i_NEW_EMU_CONS;

for i = 1:13
    
OLS_NEW_EU_K = OLSReg(Yk_eu2(:,i),[ones(size(Yk_eu2,1),1),LR_i_NEW_EU_GDP(:,i)]);
b_NEW_EU_K(:,i) = OLS_NEW_EU_K.b;
t_NEW_EU_K(:,i)= OLS_NEW_EU_K.tstat;

OLS_NEW_EMU_K = OLSReg(Yk_emu2(:,i),[ones(size(Yk_emu2,1),1),LR_i_NEW_EMU_GDP(:,i)]);
b_NEW_EMU_K(:,i) = OLS_NEW_EMU_K.b;
t_NEW_EMU_K(:,i)= OLS_NEW_EMU_K.tstat;

OLS_NEW_EU_C = OLSReg(Yc_eu2(:,i),[ones(size(Yc_eu2,1),1),LR_i_NEW_EU_GDP(:,i)]);
b_NEW_EU_C(:,i) = OLS_NEW_EU_C.b;
t_NEW_EU_C(:,i)= OLS_NEW_EU_C.tstat;

OLS_NEW_EMU_C = OLSReg(Yc_emu2(:,i),[ones(size(Yc_emu2,1),1),LR_i_NEW_EMU_GDP(:,i)]);
b_NEW_EMU_C(:,i) = OLS_NEW_EMU_C.b;
t_NEW_EMU_C(:,i)= OLS_NEW_EMU_C.tstat;

end

% FIGURE 2:
% Picture 1.1
[g] = hpfilter(b_LR_OECD_K(2,1:end),80); 
figure(13)
plot(dates1(:,31:51),b_LR_OECD_K(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('OECD CAPITAL INCOME FLOWS - 1980-2000')

% Picture 1.2
[g] = hpfilter(b_LR_EU_K(2,1:end),80); 
figure(14)
plot(dates1(:,31:51),b_LR_EU_K(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('EU CAPITAL INCOME FLOWS - 1980-2000')

% Picture 1.3
[g] = hpfilter(b_LR_EMU_K(2,1:end),80); 
figure(15)
plot(dates1(:,31:51),b_LR_EMU_K(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('EMU CAPITAL INCOME FLOWS - 1980-2000')

% Picture 2.1
[g] = hpfilter(b_LR_OECD_C(2,1:end),80); 
figure(16)
plot(dates1(:,31:51),b_LR_OECD_C(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('OECD ASSET CUMULATION/DECUMULATION - 1980-2000')

% Picture 2.2
[g] = hpfilter(b_LR_EU_C(2,1:end),80); 
figure(17)
plot(dates1(:,31:51),b_LR_EU_C(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('EU ASSET CUMULATION/DECUMULATION - 1980-2000')

% Picture 2.3
[g] = hpfilter(b_LR_EMU_C(2,1:end),80); 
figure(18)
plot(dates1(:,31:51),b_LR_EMU_C(2,1:end),'.-k')
hold on 
plot(dates1(:,31:51),g,'.--r')
title('EMU ASSET CUMULATION/DECUMULATION - 1980-2000')

% New periods:
% Picture 3.1
[g] = hpfilter(b_LR_NEW_OECD_K(2,1:end),80); 
figure(19)
plot(dates1(:,51:end),b_LR_NEW_OECD_K(2,1:end),'.-k')
hold on 
plot(dates1(:,51:end),g,'.--r')
title('OECD CAPITAL INCOME FLOWS - 2000-2009')

% Picture 3.2
[g] = hpfilter(b_NEW_EU_K(2,1:end),80); 
figure(20)
plot(dates2(1:end-2,:),b_NEW_EU_K(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('EU CAPITAL INCOME FLOWS - 2000-2012')
 
% Picture 3.3
[g] = hpfilter(b_NEW_EMU_K(2,1:end),80); 
figure(21)
plot(dates2(1:end-2,:),b_NEW_EMU_K(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('EMU CAPITAL INCOME FLOWS - 2000-2012')

% Picture 4.1
[g] = hpfilter(b_LR_NEW_OECD_C(2,1:end),80); 
figure(22)
plot(dates1(:,51:end),b_LR_NEW_OECD_C(2,1:end),'.-k')
hold on 
plot(dates1(:,51:end),g,'.--r')
title('OECD ASSET CUMULATION/DECUMULATION - 2000-2009')

% Picture 4.2
[g] = hpfilter(b_NEW_EU_C(2,1:end),80); 
figure(23)
plot(dates2(1:end-2,:),b_NEW_EU_C(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('EU ASSET CUMULATION/DECUMULATION - 2000-2012')


% Picture 4.3
[g] = hpfilter(b_NEW_EMU_C(2,1:end),80); 
figure(24)
plot(dates2(1:end-2,:),b_NEW_EMU_C(2,1:end),'.-k')
hold on 
plot(dates2(1:end-2,:),g,'.--r')
title('EMU ASSET CUMULATION/DECUMULATION - 2000-2012')

% Table 1:
BETA_1 = [b_OECD1(2,1),t_OECD1(2,1);b_EU1(2,1),t_EU1(2,1);b_EMU1(2,1),t_EMU1(2,1)];
BETA_2 = [b_OECD2(2,1),t_OECD2(2,1);b_EU2(2,1),t_EU2(2,1);b_EMU2(2,1),t_EMU2(2,1)];
BETA_NEW = [b_NEW_OECD1(2,1),t_NEW_OECD1(2,1);b_NEW_EU1(2,1),t_NEW_EU1(2,1);b_NEW_EMU1(2,1),t_NEW_EMU1(2,1)];
OLS = table({'OECD';'EU';'EMU';},BETA_1,BETA_2,BETA_NEW,'VariableNames',{'Area' '1980-1990' '1990-2004' '2004-2009/2012'})

% Table 3:
OECD_PANEL1 = [PAN_b_OECD_K1,PAN_t_OECD_K1;PAN_b_OECD_C1,PAN_t_OECD_C1;PAN_b_OECD_U1,PAN_t_OECD_U1;];
OECD_PANEL2 = [PAN_b_OECD_K2,PAN_t_OECD_K2;PAN_b_OECD_C2,PAN_t_OECD_C2;PAN_b_OECD_U2,PAN_t_OECD_U2;];
OECD_PANEL3 = [PAN_b_OECD_K3,PAN_t_OECD_K3;PAN_b_OECD_C3,PAN_t_OECD_C3;PAN_b_OECD_U3,PAN_t_OECD_U3;];

EU_PANEL1 = [PAN_b_EU_K1,PAN_t_EU_K1;PAN_b_EU_C1,PAN_t_EU_C1;PAN_b_EU_U1,PAN_t_EU_U1;];
EU_PANEL2 = [PAN_b_EU_K2,PAN_t_EU_K2;PAN_b_EU_C2,PAN_t_EU_C2;PAN_b_EU_U2,PAN_t_EU_U2;];
EU_PANEL3 = [PAN_b_EU_K3,PAN_t_EU_K3;PAN_b_EU_C3,PAN_t_EU_C3;PAN_b_EU_U3,PAN_t_EU_U3;];

EMU_PANEL1 = [PAN_b_EMU_K1,PAN_t_EMU_K1;PAN_b_EMU_C1,PAN_t_EMU_C1;PAN_b_EMU_U1,PAN_t_EMU_U1;];
EMU_PANEL2 = [PAN_b_EMU_K2,PAN_t_EMU_K2;PAN_b_EMU_C2,PAN_t_EMU_C2;PAN_b_EMU_U2,PAN_t_EMU_U2;];
EMU_PANEL3 = [PAN_b_EMU_K3,PAN_t_EMU_K3;PAN_b_EMU_C3,PAN_t_EMU_C3;PAN_b_EMU_U3,PAN_t_EMU_U3;];


OECD_PANEL = table({'Beta K';'Beta C';'Beta U';},OECD_PANEL1,OECD_PANEL2,OECD_PANEL3,'VariableNames',{'Area' '1980-1990' '1990-2004' '2004-2009/2012'})
EU_PANEL = table({'Beta K';'Beta C';'Beta U';},EU_PANEL1,EU_PANEL2,EU_PANEL3,'VariableNames',{'Area' '1980-1990' '1990-2004' '2004-2009/2012'})
EMU_PANEL = table({'Beta K';'Beta C';'Beta U';},EMU_PANEL1,EMU_PANEL2,EMU_PANEL3,'VariableNames',{'Area' '1980-1990' '1990-2004' '2004-2009/2012'})

%close all