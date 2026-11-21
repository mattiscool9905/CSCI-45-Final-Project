local connectedPlayers = game:GetService("Players"):GetPlayers()
local PlayerClass = require(path.To.PlayerClass)
local CardModule = require(path.To.CardModule)
local gamePlayers = {}

-- loops through all players and adds a PlayerClass
for i = 1, #connectedPlayers do
    local player = PlayerClass.new(i)
    for j = 1, startingNumberOfCards do
        local card = CardModule:CreateCard()
        player:addCard(card)
    end
    table.insert(gamePlayers, player)
end

-- variables and functions for gameloop

local gameOn = true
local turnPlayerNumber = 1
local nextTurn = false
local reverse = false
local cardEffect = false

-- Moves over into the next players turn
local function NextPlayerTurn()
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

    -- Start of game

-- Picks Starting Card
local cardPlayed = CardModule:CreateCard()
while cardPlayed.Number > 9 do
    cardPlayed = CardModule:CreateCard()
end

while gameOn == true do

    local currentPlayer = gamePlayers[turnPlayerNumber]

-- Checks for cards that canBePlayed
    for i = 1, currentPlayer.handCount do
        local currentCard = currentPlayer.cardsInHand[i]
        if currentCard.Number == cardPlayed.Number or currentCard.Color == cardPlayed.Color or currentCard.Color == "Wild" then
            currentCard.canBePlayed = true
        else
            currentCard.canBePlayed = false
        end
    end

    -- Need to add a way to input Player selecting a card, GUI stuff
    -- Need some wait comand until a card becomes selected, so loop doesn't run continuously
    -- (Player needs to set currentCard.selected = true)

-- Checks through all of cards to see if one is both selected and canBePlayed
    for i = 1, currentPlayer.handCount do
        local currentCard = currentPlayer.cardsInHand[i]
        if currentCard.selected == true and currentCard.canBePlayed == true then
            table.remove(currentPlayer.cardsInHand, i)
            currentPlayer.handCount = #currentPlayer.cardsInHand
            cardPlayed = currentCard
            nextTurn = true
            if cardPlayed.Number > 9 then
                cardEffect = true
            end
            break
        end
    end

    -- Checks if turn player needs to be moved to next player
    if nextTurn == true then
        NextPlayerTurn()
    end

    -- Card effects
    if cardEffect == true then
        cardEffect = false
        if cardPlayed.Number == 10 then     -- reverse
            reverse = not reverse
            NextPlayerTurn()
            NextPlayerTurn()
        end

        if cardPlayed.Number == 11 then     -- skip
            NextPlayerTurn()
        end

        if cardPlayed.Number == 12 then     -- +2
            local nextPlayer = gamePlayers[turnPlayerNumber]
                for i = 1, 2 do
                    local card = CardModule:CreateCard()
                    nextPlayer:addCard(card)
                end
            NextPlayerTurn()
        end

        if cardPlayed.Number == 13 then     -- Wild

        -- More GUI stuff for player to choose color 

        end

        if cardPlayed.Number == 14 then     -- Wild +4
            local nextPlayer = gamePlayers[turnPlayerNumber]
                for i = 1, 4 do
                    local card = CardModule:CreateCard()
                    nextPlayer:addCard(card)
                end

            -- Gap for player choosing color

            NextPlayerTurn()
        end
    end

    wait(10)

end