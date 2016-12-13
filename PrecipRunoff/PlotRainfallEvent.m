function [runoffRatio] = PlotRainfallEvent( dateRange, legendValues, plotTitle, timeValPairs )
%Plot the precip and one or more runoff events for a specific date range,
%and calculate the runoff ratio. 
startDate = dateRange(1);
endDate = dateRange(2);

runoffSums = [];

figure
hold on
% For each of the time/value matrixes that were passed into varargin,
% select just the times and values within the date range. Then plot.
for i = 1:length(timeValPairs)
    times = timeValPairs{i}{1};
    values = timeValPairs{i}{2};
    validEventIndex = times > startDate & times < endDate;
    
    % Select just the times and dates that were between the start and end
    times = times(validEventIndex);
    values = values(validEventIndex);
    
    % The first plot is the precip, give it a special dashed line. And,
    % make sure not to lump together precip and runoffs when averaging for
    % runoff ratio. 
    if i == 1
        plot(times, values, '--', 'LineWidth', 4)
        precipSum = sum(values);
    else
        plot(times, values, 'LineWidth', 4)
        runoffSums = [runoffSums sum(values)];
    end 
end

legend(legendValues{:})
ylabel('mm', 'FontSize', 20)
xlabel('Time', 'FontSize', 20)
title(plotTitle, 'FontSize', 20)
set(gca,'FontSize',15)
hold off

% Calculate and return the runoff ratio. 
runoffRatio = mean(runoffSums)/precipSum;
end

