% Compare GC precip data to MyPrecipData
% import GC data and referencetimestamps

%% Import reference timestamps, eg. tenminutetime_PAS
Convert_Rainfall_MAT_PAS_To_10min;

% Import Guabo Camp
[GC_Timestamp,GC_tips] = importGC('GuaboCampPrecip_5_12_16 to 8_10_16.csv',3, 2654);
[ synchronizedmm ] = SyncGuaboCamptoMyPrecipData( tenminutetime_PAS, GC_Timestamp); 

%% convert to mm
synchronizedmm = synchronizedmm.*0.254;

%% Plot Pasture Whole Summer
% Rain Gauge (Precip)
figure
plot(tenminutetime_PAS, tenminutetotal_PAS, tenminutetime_PAS, synchronizedmm);
title('Pasture Rainfall & Runoff', 'fontsize',10);
AX = legend('MyPrecip', 'GuaboCamp', 'northwest');
set(AX,'FontSize',5);
set(gca,'FontSize',10);
xlhand = get(gca,'xlabel');
set(xlhand,'string','Time','fontsize',10);
yhand = get(gca,'ylabel');
set(yhand,'string','Precipitation (mm)','fontsize',10);
