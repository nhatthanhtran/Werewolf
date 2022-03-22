function [matPlayers] = WolfKill(matPlayers,intNumOfPlayers)
%Use to determine who get kill over night by wolf
%1 and 2 are wolf so only choose any number greater than that

intNumHumanAlive = sum(matPlayers(3:8,2));
vecAliveHuman = zeros(1,intNumHumanAlive);
intIdx = 1;
for i=3:intNumOfPlayers
   if matPlayers(i,2) == 1
      vecAliveHuman(1,intIdx) = i;
      intIdx = intIdx + 1;
   end
end

% Choose a random alive human to kill, kill the first one in the array
% after random shuffle
vecAliveHuman = vecAliveHuman(randperm(intNumHumanAlive));
try
matPlayers(vecAliveHuman(1,1),3) = matPlayers(vecAliveHuman(1,1),3) + 1;
catch
   test = 1; 
end

end

