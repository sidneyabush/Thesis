function [TOA5,VarName2,CR1000,VarName4,CR1000Std2704,CPUAS_pasture_withTE525CR1] = import_PAS_TippingBucket(filename, startRow, endRow)
%import_PAS_TippingBucket Import numeric data from a text file as column vectors.
%   [TOA5,VARNAME2,CR1000,VARNAME4,CR1000STD2704,CPUAS_PASTURE_WITHTE525CR1]
%   = import_PAS_TippingBucket(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [TOA5,VARNAME2,CR1000,VARNAME4,CR1000STD2704,CPUAS_PASTURE_WITHTE525CR1]
%   = import_PAS_TippingBucket(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [TOA5,VarName2,CR1000,VarName4,CR1000Std2704,CPUAS_pasture_withTE525CR1] = import_PAS_TippingBucket('PrecipRunoff_Pasture_Combined.csv',5, 36884);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/11/17 22:26:03

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 5;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: datetimes (%{"yyyy-MM-dd HH:mm:ss"}D)
%	column2: double (%f)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%{"yyyy-MM-dd HH:mm:ss"}D%f%f%f%f%f%*s%*s%[^\n\r]';

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
TOA5 = dataArray{:, 1};
VarName2 = dataArray{:, 2};
CR1000 = dataArray{:, 3};
VarName4 = dataArray{:, 4};
CR1000Std2704 = dataArray{:, 5};
CPUAS_pasture_withTE525CR1 = dataArray{:, 6};

% For code requiring serial dates (datenum) instead of datetime, uncomment
% the following line(s) below to return the imported dates as datenum(s).

% TOA5=datenum(TOA5);

