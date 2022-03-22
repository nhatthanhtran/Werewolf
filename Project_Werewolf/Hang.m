function [matPlayers] = Hang(intHangPer,matPlayers)
%Use to decide save/hang a person

if intHangPer == 0
   return  
end

%Wolf Logic - save wolf, hang others
intNumHang = 0;
if intHangPer > 2
    intNumHang = sum(matPlayers(1:2,2));
end

%Human Logic
intNumHumanAlive = sum(matPlayers(3:8,2));
%Remove the person that got hang, they cant vote
if intHangPer > 2
    intNumHumanAlive = intNumHumanAlive - 1;
end

%Human who vote for hang should remember to kill the target if choosen
intNumOfVotes = sum(matPlayers(:,6) == intHangPer);
intNumHang = intNumHang + intNumOfVotes;
intNumHumanAlive = intNumHumanAlive - intNumOfVotes;

intNumHang = intNumHang + sum(round(rand(intNumHumanAlive,1)));

%Hang logic
intNumTotalAlive = sum(matPlayers(:,2));

if intNumHang > intNumTotalAlive/2
   matPlayers(intHangPer,2) = 0; 
end

end

