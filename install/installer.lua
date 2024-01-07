os.execute("clear")

local component = require("component")
local gpu = component.gpu
local logo = [[
  ____      _____       _ __        ______               __
  /  _/___  / __(_)___  (_) /___  __/ ____/___ __________/ /
  / // __ \/ /_/ / __ \/ / __/ / / / /   / __ `/ ___/ __  / 
_/ // / / / __/ / / / / / /_/ /_/ / /___/ /_/ / /  / /_/ /  
/___/_/ /_/_/ /_/_/ /_/_/\__/\__, /\____/\__,_/_/   \__,_/   
                           /____/                                                   
]]
gpu.setForeground(0xa020f0)
print(logo .. "\n")
print("Loading...\n")
os.sleep(1)
print("=== [ SETUP ] ===\n\n")
print("Шаг 1: В каком режиме вы хотите использовать терминал\n\n1: Режим дверного контроллера - в этом режиме данный компьютер становиться контроллером кард, для работы требуется подключенный считыватель.\n\n2: Режим терминала записи - в этом режиме данный пк становиться устройством для записи новых магнитных карт. Для работы требуется подключенный Блок Записи Карт")
io.write("> ")
local mode = io.read()

if (mode == "1") then
  print("ВАЖНО! Что-бы пропускало ваши карты вам понадобится отредактировать файл InfinityCard_Checker.lua на 19 линии, \nчто-бы получить айди карты вам нужно будет установить InfinityCard_ID.lua коммандой:\nwget -f https://raw.githubusercontent.com/Infinitium-Team/InfinityCard/main/release/InfinityCard_ID.lua && InfinityCard_ID.lua\nА после установки и запуска нужно будет кликнуть картой по читателю карт.")
  os.sleep(0.5)
  print("Установка начнется через две секунды...")
  os.sleep(2)
  os.execute("wget -f https://raw.githubusercontent.com/Infinitium-Team/InfinityCard/main/release/InfinityCard_Checker.lua")
  print("Успешно установленно!")
  os.execute("InfinityCard_Checker.lua")
elseif (mode == "2") then
--  os.execute("wget -f https://raw.githubusercontent.com/Infinitium-Team/InfinityCard/main/modules/module_terminal.lua && module_terminal.lua")
  os.execute("wget -f https://raw.githubusercontent.com/Infinitium-Team/InfinityCard/main/release/InfinityCard.lua /infinitycard.lua")
  local file = io.open("/home/.shrc", "w")

  if file then
      file:write("/infinitycard.lua\n")
      file:close()
      
      print("Успешно установленно!")
      os.execute("reboot")
  end
else
 os.exit()
end