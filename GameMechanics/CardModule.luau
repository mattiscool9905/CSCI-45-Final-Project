-- UNO Card System

local CardModule = {}

-- Card colors
CardModule.Colors = {
    "Red",
    "Blue",
    "Green",
    "Yellow"
}

-- Create a card
function CardModule.CreateCard(color, number)
    local card = {
        Color = color,
        Number = number
    }

    return card
end

return CardModule
