%Play the game
clc, clear all;
%Initialize
intNumOfPlayers = 8;
intTotalGames = 10000;
% matPlayers = zeros(intNumOfPlayers,4);
% matPlayers(:,2) = 1;

%intHangPerson = ChooseHangPerson(matPlayers,intNumOfPlayers);

% matPlayers = EndOfNight(matPlayers);

% matPlayers = Guard(matPlayers,intNumOfPlayers);

% matPlayers = WolfKill(matPlayers,intNumOfPlayers);

%matPlayers = Hang(3,matPlayers);
vecRecord = zeros(intTotalGames,2);
for i=1:intTotalGames
    blnEndOfGame  = 0;
    intWinner = 0;
    matPlayers = zeros(intNumOfPlayers,6);
    matPlayers(:,2) = 1;
    matPlayers(:,1) = 1:1:intNumOfPlayers;
    %Set up seer, -1 not inspect , 0 human, 1 wolf
    matPlayers(:,5) = -1;
    matPlayers(4,5) = 0;
    intRound = 1;
    while blnEndOfGame == 0
        %Night Time
        matPlayers = WolfKill(matPlayers,intNumOfPlayers);
        matPlayers = Seer(matPlayers,intNumOfPlayers);
        matPlayers = Guard(matPlayers,intNumOfPlayers);
        matPlayers = EndOfNight(matPlayers);
   
        %Day Time
        [matPlayers,intHangPerson] = ChooseHangPerson(matPlayers,intNumOfPlayers);
        matPlayers = Hang(intHangPerson,matPlayers);
        [matPlayers,blnEndOfGame,intWinner] = EndOfGame(matPlayers,intNumOfPlayers);
        intRound = intRound + 1;
    end
    vecRecord(i,1) = intWinner;
    vecRecord(i,2) = intRound;
end
sum(vecRecord(:,1) == 2)/intTotalGames
sum(vecRecord(:,1) == 1)/intTotalGames
sum(vecRecord(:,2))/intTotalGames