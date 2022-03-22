function [matPlayers, blnGameEnd, intWinner] = EndOfGame(matPlayers,intNumOfPlayers)
%Use to check if the game end
%and determine who is the winner
%1 for wolf and 2 for human

%Wolfs are dead
blnGameEnd  = 0;
intWinner = 0;
intAliveWolf = sum(matPlayers(1:2,2));
if  intAliveWolf == 0
    blnGameEnd = 1;
    intWinner = 2;
elseif intAliveWolf >= sum(matPlayers(3:intNumOfPlayers,2)) 
    blnGameEnd = 1;
    intWinner = 1;
end

end

