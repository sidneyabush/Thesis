% Clean workspace
close all;
clear all;
% Import pasture data
[TIMESTAMP1,RECORD1,PAS_Precip,PAS_Upper,PAS_Middle,PAS_Lower] = import_pasture('PAS_PrecipRunoffOLD.csv',5, 36884);
% Import mature forest data
[TIMESTAMP,RECORD,MAT_Precip,MAT_Upper, MAT_Middle,MAT_Lower] = import_mature('PrecipRunoff_Mature_Combined.csv',1, 31877);

% Generate histogram for pasture precipitation
pas_precip_hist = histogram(PAS_Precip(PAS_Precip ~= 0));
current_fig = gcf; 
current_fig.Name = 'Pasture Precipitation Histogram';

% Generate histogram for pasture lower runoff
% figure;
% pas_lower_hist = histogram(PAS_Lower(PAS_Lower ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Pasture Lower Runoff Histogram';

% Generate histogram for pasture middle runoff
% figure;
% pas_middle_hist = histogram(PAS_Middle(PAS_Middle ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Pasture Middle Runoff Histogram';

% Generate histogram for pasture upper runoff
% figure;
% pas_upper_hist = histogram(PAS_Upper(PAS_Upper ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Pasture Upper Runoff Histogram';



% Generate histogram for mature forest precipitation
figure;
mat_precip_hist = histogram(MAT_Precip(MAT_Precip ~= 0));
current_fig = gcf; 
current_fig.Name = 'Mature Forest Precipitation Histogram';

% Generate histogram for mature forest lower runoff
% figure;
% mat_lower_hist = histogram(MAT_Lower(MAT_Lower ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Mature Forest Lower Runoff Histogram';
% 
% % Generate histogram for mature forest middle runoff
% figure;
% mat_middle_hist = histogram(MAT_Middle(MAT_Middle ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Mature Forest Middle Runoff Histogram';
% 
% % Generate histogram for mature forest upper runoff
% figure;
% mat_upper_hist = histogram(MAT_Upper(MAT_Upper ~=0)); 
% current_fig = gcf; 
% current_fig.Name = 'Mature Forest Upper Runoff Histogram';
