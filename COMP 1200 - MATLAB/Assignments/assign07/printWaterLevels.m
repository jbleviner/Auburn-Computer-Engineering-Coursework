% Jonathan Leviner, d_assign07 64
% Jeremy Douds, Joe Wachter
% printWaterLevels.m
% 3/22/2019
% Jonathan Joe and Jeremy all typed out seperate programs and compiled them
% into this one.
%
% This programs simply takes the average from the water levels given of
% Lake Powell

function [] = printWaterLevels( lake_powell, years, NUM_MONTHS )

% print water levels with title and year column headings.
fprintf(' Lake Powell Water Levels (in feet) \n');
fprintf('%8d ', years)
fprintf('\n')

%print the contents of the lake powell file
    for month = 1:NUM_MONTHS
        fprintf('%9.2f', lake_powell(month,:));
        fprintf('\n')
    end
end