% This converts precip data into rain event objects

%Load the mat file containing the MAT Precip
load('MAT_Precip.mat')

% Determine rain events for MAT
[startTimes, endTimes] = FindRainEvents_MAT();

