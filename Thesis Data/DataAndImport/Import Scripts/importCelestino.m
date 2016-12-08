function [TIMESTAMP,RainTB3_mm_Tot,RainNlynx_mm_Tot] = importCelestino(filename, startRow, endRow)
%importCelestino Import numeric data from a text file as column vectors.
%   [TIMESTAMP,RAINTB3_MM_TOT,RAINNLYNX_MM_TOT] = importCelestino(FILENAME)
%   Reads data from text file FILENAME for the default selection.
%
%   [TIMESTAMP,RAINTB3_MM_TOT,RAINNLYNX_MM_TOT] = importCelestino(FILENAME,
%   STARTROW, ENDROW) Reads data from rows STARTROW through ENDROW of text
%   file FILENAME.
%
% Example:
%   [TIMESTAMP,RainTB3_mm_Tot,RainNlynx_mm_Tot] = importCelestino('celestino_tower_3.csv',5, 151122);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/11/17 19:38:58

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 5;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: datetimes (%{dd/MM/yy HH:mm}D)
%	column2: double (%f)
%   column3: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%{dd/MM/yy HH:mm}D%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
TIMESTAMP = dataArray{:, 1};
RainTB3_mm_Tot = dataArray{:, 2};
RainNlynx_mm_Tot = dataArray{:, 3};

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% TIMESTAMP=datenum(TIMESTAMP);


