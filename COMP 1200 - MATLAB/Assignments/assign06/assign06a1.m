%*****CONSTANT*****
Months = 12;
FIRST_YEAR = 2013;
LAST_YEAR = 2016;
FILENAME = 'lake_powell.txt';


%*****INPUT****

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
            lake_powell(month,year) = fscanf(fileID, '%f', 1);end
    end
    
    % print the lake_powell matrix with title and year column headings.
    fprintf(' Lake Powell Water Levels (in feet)\n')
    fprintf('%8d ', years)
    fprintf('\n')
    
    % print contents of lake_powell
    for month = 1:Months
        fprintf('%9.2f', lake_powell(month,:))
        fprintf('\n')
    end
end

    
