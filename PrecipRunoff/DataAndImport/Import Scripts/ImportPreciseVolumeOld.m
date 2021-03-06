%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: /Users/sidneybush/Desktop/LevelLoggerCalibration/KnownVolume.xlsx
%    Worksheet: Sheet1
%
% To extend the code for use with different selected data or a different
% spreadsheet, generate a function instead of a script.

% Auto-generated by MATLAB on 2016/09/22 19:49:50

%% Import the data
[~, ~, raw] = xlsread('/Users/sidneybush/Desktop/LevelLoggerCalibration/KnownVolume.xlsx','Sheet1');
raw = raw(2:end,5:6);

%% Create output variable
data = reshape([raw{:}],size(raw));

%% Allocate imported array to column variable names
Time1 = data(:,1);
Volume = data(:,2);

%% Clear temporary variables
clearvars data raw;