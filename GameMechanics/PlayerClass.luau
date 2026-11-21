local PlayerClass = {}
PlayerClass.__index = PlayerClass

function PlayerClass.new(turnNumber)
    local self = setmetatable({}, PlayerClass)
    self.canPlay = false
    self.mustDraw = false
    self.handCount = 0
    self.turnNumber = turnNumber
    self.cardsInHand = {}

    return self
end

function PlayerClass:addCard(card)
    table.insert(self.cardsInHand, card)
    self.handCount = #self.cardsInHand
end

return PlayerClass