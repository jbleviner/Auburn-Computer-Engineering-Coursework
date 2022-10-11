%fprintf('\nPART B: Determine average elevation of water level for each year and overall average\n')
%yearAve = mean(lake_powell);
%fprintf(' Average for Each Year (in feet)\n')
%fprintf('%8d ', years)
%fprintf('\n')
%fprintf('%9.2f', yearAve)
%fprintf('\n')
%overallAve = mean(yearAve);
%fprintf(' Overall average: %.2f feet\n', overallAve)


% Read the existence of the data file
n = exist('lake_powell.txt', 'file');
if n == 0
    fprintf('ErrorMsg')
else
    % Find and print the contents of the modified lake_powell
    month = 1:YEARS;
    [g2013, g2016] = textread('lake_powell.txt', '%f %*f %*f %f ');
    new_lake_powell = [g2013, g2016];
    fprintf('Lake Powell \n')
    fprintf('       2013      2016 \n')
    
    fprintf('     %6.2f    %6.2f \n', new_lake_powell)
    fprintf(' \n')
end