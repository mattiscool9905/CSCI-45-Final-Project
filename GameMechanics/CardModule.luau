-- UNO Card System

local CardModule = {}

-- Card colors
CardModule.Colors = {
    "Red",
    "Blue",
    "Green",
    "Yellow",
}

--[[Number meanings
0-9: regualr numbers
10: reverse
11: skip
12: +2
13: wild
14: wild +4
]]

-- Create a card
function CardModule.CreateCard()
    local colorIndex = math.random(1, #CardModule.Colors)
    local color = CardModule.Colors[colorIndex]
    local number = math.random(0, 14)

    if number >= 13 then
    color = "Wild"
    end

    local card = {
        Color = color,
        Number = number,
        canBePlayed = false,
        selected = false
    }

    return card
end

return CardModule
