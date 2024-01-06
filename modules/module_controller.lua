local GUI = require("GUI")

print("Загружен модуль контроллера")
print("Loading libary: GUI")
os.execute("wget -f https://raw.githubusercontent.com/Infinitium-Team/InfinityCard/main/libaries/GUI.lua")
print("Booting up GUI...")
os.sleep(1)


local application = GUI.application()

application:addChild(GUI.panel(1, 1, application.width, application.height, 0x2D2D2D))

-- Add a rounded button
application:addChild(GUI.roundedButton(2, 18, 30, 3, 0xFFFFFF, 0x555555, 0x880000, 0xFFFFFF, "Rounded button")).onTouch = function()
	GUI.alert("Rounded button was pressed")
end 
