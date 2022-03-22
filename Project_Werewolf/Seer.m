function [matPlayers] = Seer(matPlayers, intNumOfPlayers)
%This is the seer player, can inspect a person at night to check if they
%are wolf or not. This is the 4 player in our set up, will indicate if this
%is wolf or not in the 5th column

%Check if still alive
if matPlayers(4,2) == 1
    %Get alive and non-inspect players
    vecAlivePlayers = zeros(1,intNumOfPlayers);
    intIdx = 1;
    for i=1:intNumOfPlayers
       if matPlayers(i,2) == 1 && matPlayers(i,5) == -1
          vecAlivePlayers(1,intIdx) = i;
          intIdx = intIdx + 1;
       end
    end
    if sum(vecAlivePlayers) == 0
       return 
    end
    vecAlivePlayers = vecAlivePlayers(vecAlivePlayers > 0);
    intNumPlayersNeedInspect = length(vecAlivePlayers);
    %Choose a player to inspect
    vecAlivePlayers = vecAlivePlayers(randperm(intNumPlayersNeedInspect));
    
    if vecAlivePlayers(1,1) == 1 || vecAlivePlayers(1,1) == 2
       matPlayers(vecAlivePlayers(1,1),5) = 1; 
    else
       matPlayers(vecAlivePlayers(1,1),5) = 0; 
    end  
end

end

