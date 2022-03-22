function [matPlayers,intHangPerson] = ChooseHangPerson(matPlayers,intNumOfPlayers)
%Use during day to choose who to hang

%Get Alive Players
intHangPerson  = 0;
matPlayers(:,6) = 0;
intNumPlayersAlive = sum(matPlayers(:,2));
matAlivePlayers = zeros(2,intNumPlayersAlive);
intIdx = 1;
for i=1:intNumOfPlayers
   if matPlayers(i,2) == 1
      matAlivePlayers(1,intIdx) = i;
      intIdx = intIdx + 1;
   end
end
%Wolf Option
 vecWolfOptions = matAlivePlayers(1,matAlivePlayers(1,:)>2);
%Choose who to hang
for i = 1:intNumPlayersAlive   
    
    %Wolf Choices
    if matAlivePlayers(1,i) == 1 || matAlivePlayers(1,i) == 2
        vecWolfOptions = vecWolfOptions(randperm(length(vecWolfOptions)));
        matAlivePlayers(2, matAlivePlayers(1,:) == vecWolfOptions(1,1)) = matAlivePlayers(2,matAlivePlayers(1,:) == vecWolfOptions(1,1)) + 1; 
         matPlayers(matAlivePlayers(1,i),6) = vecWolfOptions(1,1);
    else
        %Human Choices
        vecHumanOptions = matAlivePlayers(1,matAlivePlayers(1,:)~=matAlivePlayers(1,i));
        %Consider Seer Power
        %Get verified human
        vecVerifiedHuman = matPlayers(matPlayers(:,5) == 0,1);
        vecVerifiedHuman = vecVerifiedHuman';
        intVerifiedHuman = length(vecVerifiedHuman);
        %Combine info
        for j=1:intVerifiedHuman
           if sum(vecHumanOptions == vecVerifiedHuman(j)) > 0
               vecHumanOptions = vecHumanOptions(vecHumanOptions ~= vecVerifiedHuman(j));
           end
        end
        
        % Get wolf if get inspected
        for k = 1:2
           if matPlayers(k,5) == 1
              vecHumanOptions = [vecHumanOptions k k]; 
           end
        end
        
        vecHumanOptions = vecHumanOptions(randperm(length(vecHumanOptions)));
        matAlivePlayers(2,matAlivePlayers(1,:) == vecHumanOptions(1,1)) = matAlivePlayers(2,matAlivePlayers(1,:) == vecHumanOptions(1,1)) + 1;
        matPlayers(matAlivePlayers(1,i),6) = vecHumanOptions(1,1);
    end
end

%Find who has the most vote to hang
intNumVote = 0;
for i=1:intNumPlayersAlive
    if matAlivePlayers(2,i) > intNumVote
       intNumVote = matAlivePlayers(2,i);
       intHangPerson = matAlivePlayers(1,i);
       
    elseif matAlivePlayers(2,i) == intNumVote
        intHangPerson = 0;
    end
end

end

