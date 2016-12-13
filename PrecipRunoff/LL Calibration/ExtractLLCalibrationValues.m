% Match up the exact values of time-volume to the time-volume measurements
% collected by the level loggers.

clear all;

% Check that we're running this from the correct directory, near all the
% data.
shouldBeDir = '/Users/sidneybush/Documents/Graduate School/Panama/2016 Summer Field Season Data/PrecipRunOff/Scripts for AS Meeting Sept. 30th/LLCalData';
if ~strcmp(pwd, shouldBeDir)
    warning(['Change to the directory: ' shouldBeDir ' in order to run.']);
    return;
end

rawMeasuredDataDir = 'RawData/Measured/';
rawTruthDataDir = 'RawData/Truth/';
cleanedDataDir = 'CleanedData/';

% Make sure that every truth file has a matching measured file of the same
% name.
allRawMeasuredFiles = dir([rawMeasuredDataDir '*.csv']);
allRawMeasuredFileNames = {allRawMeasuredFiles.name};
allRawTruthFiles = dir([rawTruthDataDir '*.csv']);
allRawTruthFileNames = {allRawTruthFiles.name};
if ~all(strcmpi(allRawTruthFileNames, allRawMeasuredFileNames))
    warning('Not all measured and truth filenames are matching.');
    return;
end

% For each pair of measured and truth files
for i = 1:length(allRawMeasuredFileNames)
    filename = allRawMeasuredFileNames{i};
    % Import the truth file
    [truthTime,truthVol] = importLLTruthData([rawTruthDataDir filename],2);
    % Import the measured file
    [measuredTime, Raw, measuredMM] = importLLMeasuredData([rawMeasuredDataDir filename], 7);
    
    % Clear out variables so they are not mistakenly carried over from
    % previous loop. 
    firstGreater = 0;
    selectedMeasurementMM = 0;
    selectedMeasurementTime = 0; 
    
    % For each truth time, find the first ll data point that was collected
    % after that truth time - this corresponds to the height measured
    % immediately after the volume was changed
    for j = 1:length(truthTime)
        firstGreater(j) = find(measuredTime > truthTime(j),1);
    end
    firstGreater = firstGreater';
    
    selectedMeasurementMM = measuredMM(firstGreater);
    selectedMeasurementTime = measuredTime(firstGreater);
    
    figure;
    hold on;
    plot(measuredTime, measuredMM);
    plot(selectedMeasurementTime, selectedMeasurementMM,'o');
    hold off;
end
