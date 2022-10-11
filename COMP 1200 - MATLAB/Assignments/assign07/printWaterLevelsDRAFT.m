% Jonathan Leviner, d_assign07 64
% Jeremy Douds
% printWaterLevels.m
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
    
    % print water levels with title and year column headings.
    function [] = printWaterLevels( lake_powell, years, NUM_MONTHS )
    
    end