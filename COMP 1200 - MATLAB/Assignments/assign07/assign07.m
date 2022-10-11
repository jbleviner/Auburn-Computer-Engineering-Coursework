% Jonathan Leviner, d_assign07 64
% Jeremy Douds, Joe Wachter
% assign07.m
% 3/22/2019
% Jonathan Joe and Jeremy all typed out seperate programs and compiled them
% into this one.
%
% This program clarifies the information presented in the text file and in
% previous assignments.

clc, clear all

%Is the file available
if ~exist('lake_powell.txt','file')
    fprintf('File not found\n')
else
    % file available continue
    
    %*****CONSTANT*****
    NUM_MONTHS = 12; 
    FIRST_YEAR = 2013; 
    LAST_YEAR  = 2016; 
 
    %*****INPUT*****
    months = 1:NUM_MONTHS;
    years  = FIRST_YEAR:LAST_YEAR;
    
    % read data file
    lake_powell = load( 'lake_powell.txt' );
    
    % print water levels with title and year column headings.
    printWaterLevels( lake_powell, years, NUM_MONTHS )
    
    % print water level summary stats
    printWaterLevelSummary( lake_powell, months, years )
    
end