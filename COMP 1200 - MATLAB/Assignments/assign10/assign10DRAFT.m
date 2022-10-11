% Jonathan Leviner, b_assign10 76
% Joe Wachter, Jeremy Douds
% assign10.m
% 4/19/2019
% We used the examples from canvas and matlab to help.
% Auburn Women's Basketball Stats from the 2018-2019 season.

clc, clear all

% CONSTANTS
filename = 'WBB_results_2019.xls';
input_sheet = 'WBB results 2019';
output_sheet = 'WBB report 2019';

% INPUT
if ~exist (filename)
    % print message
    disp('File not found \n')
else
    % print header
    [num,txt] = xlsread(filename, input_sheet);
    
    % OUTPUT
    % Part 1 - Create new spreadsheet in file
    % Assign string names
    cell_title = sprintf('%s Home games as of %02d/%02d/%4d', txt{1,1}, num(length(num),1), num(length(num),2), num(length(num),3));
    outMatrix{1,1} = cell_title;
    outMatrix{2,1} = sprintf('Date');
    outMatrix{2,2} = sprintf('Opponent');
    outMatrix{2,3} = sprintf('AU');
    outMatrix{2,4} = sprintf('Opp');
    outMatrix{2,5} = sprintf('Attend');
    
    % Determine whether a host game is at home or away
    homegame = 0;
    count = 0;
    home = 'vs';
    for k = 1:length(num)
        where_at = txt{k+2,1};
        homegame = strcmp(where_at, home);
        switch homegame
            case 1
                count = count + 1;
                outMatrix{count+2,1} = sprintf('%2d/%2d/%4d', num(k,1), num(k,2), num(k,3));
                outMatrix{count+2,2} = txt{k+2,2};
                auburn_score(count,1) = num(k,4);
                opponent_score(count,1) = num(k,5);
                attendance(count,1) = num(k,6);
                outMatrix{count+2,3} = auburn_score(count,1);
                outMatrix{count+2,4} = opponent_score(count,1);
                outMatrix{count+2,5} = attendance(count,1);
        end
    end
    
    outMatrix{count+3,1} = sprintf('Average: ');
    outMatrix{count+3,3} = mean(auburn_score);
    outMatrix{count+3,4} = mean(opponent_score);
    outMatrix{count+3,5} = mean(attendance);
    
    % Write a new spreadsheet into the existing file
    xlswrite(filename, outMatrix, output_sheet)
    
    % Part 2 - Create a subplot
    % Save title and text for subplots
    plot_title = sprintf('%s Point Spread as of %02d/%02d/%4d', txt{1,1}, num(length(num),1), num(length(num),2), num(length(num),3));
    hist_title = sprintf('%s Game High Points as of %02d/%02d/%4d', txt{1,1}, num(length(num),1), num(length(num),2), num(length(num),3));
    xaxis1 = sprintf('Game');
    yaxis1 = sprintf('Spread Points');
    xaxis2 = sprintf('# points');
    yaxis2 = sprintf('# games');
    
    % Find point spread and save string
    pointspread = num(:,4) - num(:,5);
    highspread = max(pointspread);
    lowspread = min(pointspread);
    plottext = sprintf('Highest spread = %d', highspread);
    xlength = length(num);
    highspread_loc = find(highspread==pointspread);
    
    % Use subplot to create two images in the same figure
    % Plot
    subplot(2,1,1)
    plot([0 xlength+5 lowspread-5 highspread+20])
    grid on
    axis([0 xlength+5 lowspread-5 highspread+20])
    text(highspread_loc, highspread+2, plottext, 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom')
    title(plot_title)
    xlabel(xaxis1)
    ylabel(yaxis1)
    
    % Histogram
    subplot(2,1,2)
    histogram(num(:,8))
    title(hist_title)
    xlabel(xaxis2)
    ylabel(yaxis2)
    
end