% Jonathan Leviner, c_assign08 84
% Joe Wachter, Jeremy Douds
% assign08.m
% 4/5/2019
% We used the examples from canvas and matlab to help.
% Auburn Women's Basketball Stats from the 2018-2019 season.

clc, clear all

%Is the file available
if ~exist('WBB_stats_2019.txt')
    fprintf('File not found\n')
else
    % file available continue
        
    % read data file
    [dates(:,1), dates(:,2), dates(:,3)] = textread('WBB_stats_2019.txt', '%f%f%f%*s%*s%*f%*f');
    [scores(:,1), scores(:,2)] = textread('WBB_stats_2019.txt', '%*f%*f%*f%*s%*s%f%f');
        
    % print season report
    printReport( dates, scores )
    
end