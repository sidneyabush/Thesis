%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: /Users/sidneybush/Desktop/LevelLoggerCalibration/KnownVolume.xlsx
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/09/22 19:58:24

%% Import the data
[~, ~, raw] = xlsread('/Users/sidneybush/Desktop/LevelLoggerCalibration/KnownVolume.xlsx','Sheet1');
raw = raw(2:end,13:end);
raw(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),raw)) = {''};
cellVectors = raw(:,1);
raw = raw(:,2);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
TimePrecise = cellVectors(:,1);
VolumePrecise = data(:,1);

%% Clear temporary variables
clearvars data raw cellVectors;