event = require("event")

function cardData(eventName, address, playerName, cardData, cardUniqueId, isCardLocked, side)
    print("Player with nickname " .. playerName .. " have card with id " .. cardUniqueId .. " and data " .. cardData)
end

event.listen("magData", cardData)
event.pull("interrupted")
event.ignore("magData", cardData)