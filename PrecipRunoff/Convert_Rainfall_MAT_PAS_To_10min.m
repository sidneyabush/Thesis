%% Import MAT Precip Data

[TimeStamp,Precip,RainfallRate] = importMATprecip('MAT_Precip_May22-July27_2016 - Sheet1.csv',2, 19120);

% If there are an odd number of points, we won't be able to add the last 5
% minute point to any other point to get 10 minutes of data. So cut off the
% last point in this case. 
isodd= mod(length(TimeStamp),2);
if isodd
    TimeStamp(end)=[];
end

tenminuterate_MAT=[];
tenminutetotal_MAT=[];
tenminutetime_MAT=[];

for i= 1:2:length(TimeStamp)
%   Divide rainfall rate by 2 after adding, because we're now doing the
%   rate over 10 instead of 5 minutes
    tenminuterate_MAT = [tenminuterate_MAT; (RainfallRate(i) + RainfallRate(i+1))/2];
%   Totals can simply be added
    tenminutetotal_MAT = [tenminutetotal_MAT; Precip(i) + Precip(i+1)];
%   Just take the first of the two timestamps
    tenminutetime_MAT = [tenminutetime_MAT; TimeStamp(i)];
end

% Timestamp for precip is an hour later than it should be, so subtract an
% hour from it. 
% tenminutetime_MAT = tenminutetime_MAT - hours(1);
%% Import PAS Precip Data

[TimeStampPAS,PrecipPAS,RainfallRatePAS] = importPASPrecip2('PAS_Precip_May22-July27_2016 - Sheet1.csv',2, 19153);

% If there are an odd number of points, we won't be able to add the last 5
% minute point to any other point to get 10 minutes of data. So cut off the
% last point in this case. 
isodd= mod(length(TimeStampPAS),2);
if isodd
    TimeStampPAS(end)=[];
end

tenminuterate_PAS=[];
tenminutetotal_PAS=[];
tenminutetime_PAS=[];

for i= 1:2:length(TimeStampPAS)
%   Divide rainfall rate by 2 after adding, because we're now doing the
%   rate over 10 instead of 5 minutes
    tenminuterate_PAS = [tenminuterate_PAS; (RainfallRatePAS(i) + RainfallRatePAS(i+1))/2];
    tenminutetotal_PAS = [tenminutetotal_PAS; PrecipPAS(i) + PrecipPAS(i+1)];
    tenminutetime_PAS = [tenminutetime_PAS; TimeStampPAS(i)];
end

% Timestamp for precip is an hour later than it should be, so subtract an
% hour from it. 
% tenminutetime_PAS = tenminutetime_PAS - hours(1);