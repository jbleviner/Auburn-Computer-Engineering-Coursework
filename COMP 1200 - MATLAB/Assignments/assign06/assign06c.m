%{
Jonathan Leviner, e_assign06 31
Joe Wachter
File Name: assign06c.m
03/08/2019

Jonathan and Joe both typed out versions of this program and use the best
parts to create this one.

This program is a variant on the other parts but only takes data from the
years 2013 and 2016. It then takes the averages of just those two years in
a total.
%}

clc, clear all

if exist('lake_powell.txt', 'file')
    
LAKE_POWELL = load("lake_powell.txt");
YEARS = [2013 2014 2015 2016];
MONTHS = 12;

% Read the existence of the data file
n = exist('lake_powell.txt', 'file');
if n == 0
    fprintf('ErrorMsg')
else
    % Find and print the contents of the modified lake_powell
    month = 1:YEARS;
    [g2013, g2016] = textread('lake_powell.txt', '%f %*f %*f %f ');
    new_lake_powell = [g2013, g2016];
    fprintf('Lake Powell water levels (in feet) \n')
    fprintf('       2013      2016 \n')
    
    fprintf('     %6.2f    %6.2f \n', new_lake_powell)
    fprintf(' \n')
end



% PART D
fprintf('\nAverage elevation (in feet) of the water for each month\n')
fprintf('Month   Elevation\n')
for month = 1:12
    z = mean(LAKE_POWELL(month,:));
    fprintf('%3.0f  %11.2f\n', month, z)
end


end