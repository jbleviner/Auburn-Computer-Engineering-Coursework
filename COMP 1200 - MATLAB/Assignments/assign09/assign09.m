% Brooke Dowdy, none
% none
% assign09.m
% April 12, 2019
% I used the examples from canvas and matlab to help.
% Auburn Basketball Stats from 2018-2019

clc, clear all

%*****CONSTANTS*****
FILENAME = 'WBB_stats09.xls';

%*****INPUT*****
if ~exist ('FILENAME')
    fprintf('File not found \n')
else
    % print header
    fprintf('2018-19 Auburn Women Basketball \n')
    fprintf('   SEC Games as of 03/23/2019 \n')
    fprintf('  Date     Opponent               AU-Opp  Attend \n')
    
    %read file date
    [numbers, words] = xlsread(FILENAME);
    date = numbers(1:size(numbers), 1:3);
    outcome = numbers(1:size(numbers), 4:5);
    attendance = numbers(1:size(numbers), 6);
    opponent = words(3:size(words), 2);
    
    for n = 1:length(date)
        if words {n+2,3} == 's'
            fprintf('%2.0f/%02.0f/%4.0f ', date(n,1),date(n,2),date(n,3))
            fprintf('%-21s ', opponent{n})
            fprintf('%3d-%2d', outcome(n,1),outcome(n,2))
            fprintf('%7.0f\n',attendance(n))
        end
    end
    
    auMax = max(outcome(:,1));
    auMaxDate = date(auMax == outcome,:);
    auMin = min(outcome(:,1));
    auMinDate = date(auMin == outcome,:);
    
    fprintf('\n')
    fprintf('Au High Points:  %d on %2.0f/%02.0f/%4.0f', auMax, auMaxDate)
    fprintf('\n')
    fprintf('AU Low Points:   %d on %2.0f/%02.0f/%4.0f \n', auMin, auMinDate)
    
    % plot data
    numGames = size(date);
    plotyy([1:numGames], outcome(:,1), [1:numGames], attendance)
    title('2018-19 Auburn Women Basketball')
    axis([0,35,40,100])
    ylabel('AU Scores')
    yyaxis right
    axis([0,35,0,1500])
    ylabel('Game Attendance')
    xlabel('Game')
end