%{
Jonathan Leviner, f_assign05 91
Joe Wachter, Walter Clanton
File Name: assign05.m
03/01/2019

Jonathan Joe and Walter all typed out different versions of this program and
with a collabrotive effort used the best parts of each program to create
this one.

This program takes information from a txt file that relates to the water
levels in lake Powell. The program takes the yearly and monthly averages,
shows all months that are above average, determines the aveage elavation of
each months water level and prints a graph
%}

clc, clear all

% PART A
LAKE_POWELL = load("lake_powell.txt");
YEARS = [2013 2014 2015 2016];
MONTHS = [1 2 3 4 5 6 7 8 9 10 11 12];

fprintf('\nLake Powell Water Levels (in feet)\n')
fprintf('  %3.0f  ', YEARS(1,:))
for month = 1:12
    fprintf('\n%6.2f  %6.2f  %6.2f  %6.2f', LAKE_POWELL(month,:) )
end
fprintf('\n')

% PART B
avg_water = mean(LAKE_POWELL);
fprintf('\n\nAverage for Each Year (in feet)\n')
fprintf(' %3.0f     %3.0f     %3.0f     %3.0f \n', YEARS)
fprintf('%6.2f  %6.2f  %6.2f  %6.2f \n', avg_water)
o_avg = mean(avg_water);
fprintf('Overall Average: %8.2f feet\n\n\n', o_avg)

% PART C
for month_year = 1:4
    num_w1 = find(LAKE_POWELL(:,month_year) > o_avg);
    num_w2 = length(num_w1);
    fprintf('During %4.0f the lake was above average for %3.0f months\n', YEARS)
end
fprintf(' \n')

% PART D
fprintf('\nAverage elevation (in feet) of the water for each month\n')
fprintf('Month   Elevation\n')
for month = 1:12
    z = mean(LAKE_POWELL(month,:));
    fprintf('%3.0f  %11.2f\n', month, z)
end

% PART E
%DATE = 2013:1/12:2017-1/12;
%plot(DATE,LAKE_POWELL(:))
%title('Water Level Values in Lake Powell')
%xlabel('Year')
%ylabel('Water level, ft')
