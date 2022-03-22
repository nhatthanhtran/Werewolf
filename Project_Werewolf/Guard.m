function [matPlayers] = Guard(matPlayers,intNumOfPlayers)
%Use to determine who to gaurd at night by the guard
%This player will be the 3rd player in the array, the fourth column will
%determine who is the guard player

%this check if guard still alive
if matPlayers(3,2) == 1
    intNumPlayersAlive = sum(matPlayers(:,2));
    vecAlivePlayers = zeros(1,intNumPlayersAlive);
    intIdx = 1;
    for i=1:intNumOfPlayers
       if matPlayers(i,2) == 1
          vecAlivePlayers(1,intIdx) = i;
          intIdx = intIdx + 1;
       end
    end
    blnDuplicate = 1;
    
    %Guard need to use information from seer to better protect people
    %Protection witness program - protect seer as much as possible
    vecSeer = [4 4];
    vecHuman = matPlayers(matPlayers(:,5) == 0,1);
    vecHuman = vecHuman'; %create the right dimension for concatenation
    
    %Remove wolf from protection
    for i = 1:2
       if matPlayers(i,5) == 1
          vecAlivePlayers = vecAlivePlayers(vecAlivePlayers ~= i); 
       end
    end
    
    intInnocentLeft = length(vecAlivePlayers);
    %Combine info
    for i=1:intInnocentLeft
       if vecAlivePlayers(i) == 4
          vecAlivePlayers = [vecAlivePlayers vecSeer];
       elseif sum(vecHuman == vecAlivePlayers(i)) > 0
           vecAlivePlayers = [vecAlivePlayers vecAlivePlayers(i)];
       end
    end
    intNumOfPlayerProt = length(vecAlivePlayers);
    %Guard Duty
    while blnDuplicate == 1
        vecAlivePlayers = vecAlivePlayers(randperm(intNumOfPlayerProt));
        if vecAlivePlayers(1,1) ~= matPlayers(3,4)
            blnDuplicate = 0;
            matPlayers(vecAlivePlayers(1,1),3) = matPlayers(vecAlivePlayers(1,1),3) - 1;
            matPlayers(3,4) = vecAlivePlayers(1,1);
        end     
    end
end

end

