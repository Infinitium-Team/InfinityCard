event = require("event")
doorc = require("component").os_doorcontroller
local comp = require("computer")
local data = require("component").data

function openDoor()
    doorc.open()
    comp.beep(1500, 2)
    os.sleep(0.1)
    os.sleep(3)
    doorc.close()
end

function ferror()
    print("Ошибка")
end

function checkCard(cardUniqueId)
    if cardUniqueId == "card-id" or cardUniqueId == "card-id2 continue..." then
        openDoor()
    else
        ferror()
    end
end

function unameChecker(eventName, address, playerName, cardData, cardUniqueId, isCardLocked, side)
    if string.sub(cardData, -2) == "==" then
        local newCardData = data.decode64(data.decode64(cardData))
        if newCardData == playerName then
            checkCard(cardUniqueId)
        else
            ferror()
        end
    else
        if cardData == playerName then
            checkCard(cardUniqueId)
        else
            ferror()
        end
    end
end

event.listen("magData", unameChecker)
event.pull("interrupted")
event.ignore("magData", unameChecker)