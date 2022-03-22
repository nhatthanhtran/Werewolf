function [matPlayers] = EndOfNight(matPlayers)
%Use to calculate the end of night situation
%Find the person get kill during the night
matPlayers(matPlayers(:,3) > 0,2) = 0;
matPlayers(:,3) = 0;
end

