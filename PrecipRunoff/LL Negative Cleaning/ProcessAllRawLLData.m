% Script Purpose: For each LL file, convert the multiple date formats into
% a single unified format. Then, convert 5 minute increments to 10

clear all;

% Check that we're in the right directory to start in. 
shouldBeDir = '/Users/sidneybush/Documents/Graduate School/Panama/Data - Summer 2016/PrecipRunOff';
if ~strcmp(pwd, shouldBeDir)
    warning(['Change to the directory: ' shouldBeDir ' in order to run.']); 
    return;
end

rawDataDir = 'RawData/';
cleanedDataDir = '/CleanedData/';

% Find only the CSV files in the data folder
allRawFiles = dir([rawDataDir '*.csv']);

% Create a structure that will store all the data we process
for i = 1:length(allRawFiles)
%    
end

% For each raw data file, do a couple of things
for i = 1:length(allRawFiles)
    % Process the individual file to correct date stamps
    [timeStamp, heightMM] = processLLFile([rawDataDir allRawFiles(i).name]);
    % Clean data by removing any negative values and any too-small positive
    % values
    minimumvalidchangeheight= 0.2;
    heightMM(heightMM < minimumvalidchangeheight)=0; 
    
    % Save the results to a structure that we can use later
    % Separate out just the filename, we'll use that below
    [~,name,~] = fileparts(allRawFiles(i).name);
    % Create a new field in the structure whose value is a structure
    % itself. That sub-structure contains the timestamp and heightmm
    allLL.(name) = struct('timeStamp',timeStamp, 'heightMM', heightMM); 
    
end

% Save our structure to a .mat file so we can load it elsewhere
saveDir = [shouldBeDir cleanedDataDir 'allLL'];
save(saveDir, 'allLL');