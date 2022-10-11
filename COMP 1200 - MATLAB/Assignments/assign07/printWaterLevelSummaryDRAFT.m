% Jonathan Leviner, d_assign07 64
% Jeremy Douds
% printWaterLevelSummary.m
% 3/22/2019
%
%
%
%

clc, clear all

%*****OUTPUT*****
% print with title and year column headings.
fprintf('  Lake Powell Water Levels (in feet)\n')
fprintf('%8d ', years)
fprintf('\n')
% print contents of lake_powell
for month = 1:NUM_MONTHS
    fprintf('%9.2f', lake_powell(month,:))
    fprintf('\n')
end

% print water level summary stats
function [] = printWaterLevelSummary( lake_powell, months, years ) 

end


% PART B ==========================================================
% Determine and print average elevation of water level for each year and overall average
function overallAve = printYearAve( lake_powell, years )

end


% PART C ==========================================================
%Determine and print how many months of each year > overall average
function [] = printAboveAve( lake_powell, years, overallAve )

end


% PART D ==========================================================
% Determine and print average elevation of the water for each month
function [] = printMonthAve( lake_powell, months )

end