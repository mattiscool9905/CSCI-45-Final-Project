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
end