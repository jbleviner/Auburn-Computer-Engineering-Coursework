% Jonathan Leviner, d_assign07 64
% Jeremy Douds
% assign07.m
% 3/22/2019
%
%
%
%

clc, clear all 

% file available?

if ~exist( 'lake_powell.txt', 'file' )
    fprintf( 'File not found\n' ) 
else
    % file avaialable continue
    
    %*****CONSTANT*****
    NUM_MONTHS = 12;
    FIRST_YEAR = 2013;
    LAST_YEAR  = 2016;
    
    %*****INPUT*****
    months = 1:NUM_MONTHS;
    years  = FIRST_YEAR:LAST_YEAR;
    % read data file
    lake_powell = load( 'lake_powell.txt' );
    % OR load lake_powell.txt
            
    % print water levels with title and year column headings.
    function [] = printWaterLevels( lake_powell, years, NUM_MONTHS )
    
    end
    
    % print water level summary stats
    function [] = printWaterLevelSummary( lake_powell, months, years )
    
    end

    
    % PART B ==========================================================
    % Determine and print average elevation of water level for each year and overall average
    function overallAve = printYearAve( lake_powell, years )
    
    fprintf('\nPART B: Determine average elevation of water level for each year and overall average\n')
    yearAve = mean(lake_powell);
    fprintf('    Average for Each Year (in feet)\n')
    fprintf('%8d ', years)
    fprintf('\n')
    fprintf('%9.2f', yearAve)
    fprintf('\n')
    overallAve = mean(yearAve);
    fprintf('  Overall average: %.2f feet\n', overallAve)
    
    end
    
    
    % PART C ==========================================================
    % Determine and print how many months of each year > overall average
    function [] = printAboveAve( lake_powell, years, overallAve )
    
    fprintf('\nPART C: Determine how many months of each year > overall average\n')
    for year=1:length(years)
        over_average(year)=length(find(lake_powell(:,year)>overallAve));
    end
    fprintf('  During %5.0f the lake was above average for %3.0f months \n',...
        [years;over_average])
    
    end
    
    
    % PART D ==========================================================
    % Determine and print average elevation of the water for each month
    function [] = printMonthAve( lake_powell, months )
    
    fprintf('\nPART D: Determine and print average elevation of the water for each month\n')
    monthly_average=mean(lake_powell');
    table = [months;monthly_average];
    fprintf('  Average elevation (in feet) of the water for each month\n')
    fprintf('  Month  Elevation\n')
    fprintf('   %2d   %9.2f\n',table)  
    
    end
    
end