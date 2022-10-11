% Jonathan Leviner, c_assign08 84
% Joe Wachter, Jeremy Douds
% printReport.m
% 4/5/2019
% We used the examples from canvas and matlab to help.
% Auburn Women's Basketball Stats from the 2018-2019 season.


% print season report
function [] = printReport( dates, scores )
    printHeaders()
    [ nWins, nLosses ] = printGames(dates, scores);
    printFooter(scores, nWins, nLosses)
    chartScores(scores)
    
end

    % print title and headers
    function [] = printHeaders()
        fprintf('       2018-19 Auburn WBB Results \n')
        fprintf('             Scores      Current Ave Pts \n')
        fprintf('   Date     AU - Opp W/L    AU     Opp \n')
        
    end

    % print date, scores, W/L, current average for each game
    function [ nWins, nLosses ] = printGames( dates, scores )
        nWins = 0;
        nLosses = 0;
        sumscoresAU = 0;
        sumscoresOPP = 0;
        for g = 1:length(scores)
            if scores(g,1) > scores(g,2)
                outcome = 'W';
                nWins = nWins + 1;
            else
                outcome = 'L';
                nLosses = nLosses + 1;
            end
            
            sumscoresAU = sumscoresAU + scores(g,1);
            avescoresAU = sumscoresAU / g;
            
            sumscoresOPP = sumscoresOPP + scores(g,2);
            avescoresOPP = sumscoresOPP / g;
            
            fprintf('%02.0f/%02.0f/%4.0f %3.0f -%3.0f   %s    %3.1f    %3.0f\n', dates(g,:), scores(g,:), outcome, avescoresAU, avescoresOPP)
            
        end
    
    end

    % print number wins, losses; highest and lowest points
    function [] = printFooter( scores, nWins, nLosses )
        maxAU = max(scores(:,1));
        minAU = min(scores(:,1));
        maxOPP = max(scores(:,2));
        minOPP = min(scores(:,2));
        
        fprintf('Season Wins          %2.0f\n', nWins)
        fprintf('Season Losses        %2.0f\n', nLosses)
        fprintf('Most pts    %2.0f   %2.0f\n', maxAU, maxOPP)
        fprintf('Least pts   %2.0f   %2.0f\n', minAU, minOPP)
            
    end

    % pie chart for total Auburn and opponents points
    function [] = chartScores( scores )
        totalAUpts = sum(scores(:,1));
        totalOPPpts = sum(scores(:,2));
        totalpts = [totalAUpts, totalOPPpts];
        
        pie(totalpts)
        title('2018-2019 Auburn WBB Total Points')
        legend('Auburn','Opponents')
    
    end