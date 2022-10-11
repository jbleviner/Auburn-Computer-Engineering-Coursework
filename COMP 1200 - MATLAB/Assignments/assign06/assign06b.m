%{
Jonathan Leviner, e_assign06 31
Joe Wachter
File Name: assign06b.m
03/08/2019

Jonathan and Joe both typed out versions of this program and use the best
parts to create this one.

Part B is a simplification of assignment 5, using the fscanf and fopen
commands. This just gives an average of the water level for each year.
%}

clc, clear all

if exist('lake_powell.txt', 'file')
    

YEARS = [2013 2014 2015 2016];
Months = 12;
FIRST_YEAR = 2013;
LAST_YEAR = 2016;
FILENAME = 'lake_powell.txt';

% Prepare data file
[fileID,msg] = fopen(FILENAME,'r');
if fileID < 0
    disp(msg)
else
    % Good open continue with program
    months = 1:Months;
    years = FIRST_YEAR:LAST_YEAR;

% read lake_powell.txt
    for month = 1:Months
        for year = 1:length(years)
            lake_powell(month,year) = fscanf(fileID, '%f', 1);
        end
    end

% Calculations and Printing    
avg_water = mean(lake_powell);
fprintf('\n\nAverage for Each Year (in feet)\n')
fprintf(' %3.0f     %3.0f     %3.0f     %3.0f \n', YEARS)
fprintf('%6.2f  %6.2f  %6.2f  %6.2f \n', avg_water)
o_avg = mean(avg_water);
fprintf('Overall Average: %8.2f feet\n\n\n', o_avg)    
    
end
end