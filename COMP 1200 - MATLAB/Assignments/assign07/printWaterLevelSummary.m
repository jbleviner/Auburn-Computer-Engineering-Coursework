% Jonathan Leviner, d_assign07 64
% Jeremy Douds, Joe Wachter
% printWaterLevelSummary.m
% 3/22/2019
% Jonathan Joe and Jeremy all typed out seperate programs and compiled them
% into this one.
%
%This program simply prints all the averages found in previous files.

function [] = printWaterLevelSummary( lake_powell, months, years)

overallAve = printYearAve( lake_powell, years );
printAboveAve( lake_powell, years, overallAve )
printMonthAve( lake_powell, months )

end


%Part B ==================================================================
%Used to find average elevation overall and for every year
function overallAve = printYearAve( lake_powell, years )

% Print Title and Year Colunm Headings
fprintf('\n\nPart B: Determine average elevation of water level for each year and overall average')
fprintf('     Average for Each Year (in feet)\n')
fprintf('%8.0f %8.0f %8.0f %8.0f', years)
% Find and print mean from each year
average_elevation = mean(lake_powell);
fprintf('\n%9.2f %8.2f %8.2f %8.2f\n', average_elevation)

% Find and print overall average
overallAve = mean(average_elevation);
fprintf('   Overall average:  %7.2f feet\n\n', overallAve)
end


% Part C =================================================================
% Determine how many months of each year > overall average
function [] = printAboveAve( lake_powell, years, overallAve)

% Print title
fprintf('Part C: Determine how many months of each year > overall average \n')

% Find and print the number of months each year that exceed the overall
% average
for year = 1:length(years)
    over_average(year) = length(find(lake_powell(:,year) > overallAve));
end

fprintf(' During %5.0f the lake was above average for %3.0f months \n',...
    [years;over_average])
end


% Part D =================================================================
% Determine and print average elevation of the water for each month
function [] = printMonthAve( lake_powell, months )

% Display title and headings
    fprintf('\nPART D: Determine and print average elevation of the water for each month\n')
    fprintf('  Average elevation (in feet) of the water for each month\n')
    fprintf('  Month  Elevation\n')
    
    % Find and print average elevation of water for each month
    for month = 1:months(1,12)
        average_per_month = mean(lake_powell(month,:));
        fprintf(' %4d %11.2f \n', month, average_per_month)
    end
end