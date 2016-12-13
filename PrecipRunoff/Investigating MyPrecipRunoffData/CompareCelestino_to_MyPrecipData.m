% COMPARE Celestino Tower Precip Data to MyPrecipData from MAT Forest

%% Import MAT Forest Data
Convert_Rainfall_MAT_PAS_To_10min;

% Import Celestino Tower Data
load('CelestinoClean.mat');

% Plot  
% Rain Gauge (MyPrecip)
figure
plot(tenminutetime_MAT, tenminutetotal_MAT, celestino.dates, celestino.precip1);
title('Forest Rainfall & Runoff', 'fontsize',10);
AX = legend('MyPrecip', 'Celestino', 'northwest');
set(AX,'FontSize',5);
set(gca,'FontSize',10);
xlhand = get(gca,'xlabel');
set(xlhand,'string','Time','fontsize',10);
yhand = get(gca,'ylabel');
set(yhand,'string','Precipitation (mm)','fontsize',10);