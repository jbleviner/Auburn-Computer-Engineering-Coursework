% Jonathan Leviner, b_assign09 82
% Joe Wachter, Jeremy Douds
% assign09.m
% 4/12/2019
% We used the examples from canvas and matlab to help.
% Auburn Women's Basketball Stats from the 2018-2019 season.

clc, clear all

%Is the file available
if exist('WBB_stats09.xls','file') == 0
    fprintf('File not found\n')
else
    % file available continue
    
    [score, label, all] = xlsread('WBB_stats09.xls');
    % numeric data size
    [row,column] = size(score);
    if row > 0
        % Exam is last column
        examCol = column;        
        % text data size
        [rNa,cNa] = size(label);
        
        score(isnan(score)) = 0; % replace NaN with zero
        
        % print the grade report
        % printHeaders  display report title and col headers
%         fprintf('                      Fall Midterm Grade Report\n\n');
        fprintf('%10s ', label{1,1:2});         fprintf('%7s ', label{1,3:cNa});
        fprintf('  Grade\n');
        % print names and grades
        for r = 1:row
            totGr = 0;
            fprintf('%10s ', label{r+1,1:2});
            fprintf('%7.0f ',score(r,:));
            fprintf('%8.2f\n',mean(score(r,:)));
        
        end
        % print report again and left justify names
%         fprintf('\n\n                      Fall Midterm Grade Report\n\n');
        fprintf('%-10s ', label{1,1:2});
        fprintf('%7s ', label{1,3:cNa});
        fprintf('  Grade\n');
        for r = 1:row
            totGr = 0;
            fprintf('%-10s ', label{r+1,1:2});
            fprintf('%7.0f ',score(r,:));
            fprintf('%8.2f\n',mean(score(r,:)));
                
        end
    else
        disp('No data read.')
    
    end
            
end