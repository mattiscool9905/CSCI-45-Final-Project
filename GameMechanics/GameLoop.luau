local connectedPlayers = game:GetService("Players"):GetPlayers()
local PlayerClass = require(path.To.PlayerClass)
local CardModule = require(path.To.CardModule)
local gamePlayers = {}

-- loops through all players and adds a PlayerClass
for i = 1, #connectedPlayers do
    local player = PlayerClass.new(i)
    for j = 1, startingNumberOfCards do
        local card = CardModule.CreateCard()
        player:addCard(card)
    end
    table.insert(gamePlayers, player)
end

-- Start of game
-- Picks Starting Card
local cardPlayed = CardModule.CreateCard()
while cardPlayed.Number > 9 do
    cardPlayed = CardModule.CreateCard()
end

local gameOn = true
local turnPlayerNumber = 1
local nextTurn = false

while gameOn == true do
    local currentPlayer = gamePlayers[turnPlayerNumber]

-- Need to add a way to input Player selecting a card, GUI stuff
-- Need some wait comand until a card becomes selected, so loop doesn't run continuously
-- (Player needs to set currentCard.selected = true)

    for i = 1, currentPlayer.handCount do
        local hand currentPlayer.cardsInHand
        local currentCard = currentPlayer.cardsInHand[i]
        if currentCard.selected == true then
            if currentCard.canBePlayed == true then
            table.remove(currentPlayer.cardsInHand, i)
            currentPlayer.handCount = #currentPlayer.cardsInHand
            cardPlayed = currentCard
            nextTurn = true
        end
    end

    -- Checks if turn player needs to be moved to next player
    if nextTurn == true then
        nextTurn = false
        if reverse == false then
            if turnPlayerNumber == #gamePlayers then
                turnPlayerNumber = 1
            else
                turnPlayerNumber += 1
            end
        else
            if turnPlayerNumber == 1 then
                turnPlayerNumber = #gamePlayers
            else
                turnPlayerNumber -= 1
            end
        end
    end


end