while true do
    writer = require("component").os_cardwriter

    local asciiArt = [[
        ____      _____       _ __        ______               __
        /  _/___  / __(_)___  (_) /___  __/ ____/___ __________/ /
        / // __ \/ /_/ / __ \/ / __/ / / / /   / __ `/ ___/ __  / 
      _/ // / / / __/ / / / / / /_/ /_/ / /___/ /_/ / /  / /_/ /  
      /___/_/ /_/_/ /_/_/ /_/_/\__/\__, /\____/\__,_/_/   \__,_/   
                                 /____/                                  
    ]]

    os.execute("clear")
    print(asciiArt .. "\n")
    local computer = require("computer")
    local uptime = computer.uptime()
    local date = os.date("*t", uptime)
    print("© 2022-" .. date.year .. " Infinitum")
    io.write("Выберите алогритм шифрования (KSH/BSE): ")
    local warningColor = "\27[33m"
    local alg = string.lower(io.read())

    if alg == "ksh" then
        print("\nПонял. Будем использовать KSH")
        io.write("Никнейм того кто будет использовать карту (С учетом регистра): ")
        print(warningColor .. "[WARNING] После выполнения, карту будет невозможно переписать!")
        os.sleep(2)
        print("[INFO] Начинаем...")
        local salt = math.random(100000, 999999)
        os.sleep(0.5)
        writer.write(user, user .. "'s InfinityCard", true)
        print("[INFO] Успешно!")
        os.sleep(4)
        os.execute("clear")
    else if alg == "bse" then
        local base64 = require("base64")
        print("\nПонял. Будем использовать BSE")
        io.write("Никнейм того кто будет использовать карту (С учетом регистра): ")
        print(warningColor .. "[WARNING] После выполнения, карту будет невозможно переписать!")
        os.sleep(2)
        print("[INFO] Начинаем...")
        local firstEncodedUser = base64.encode(user)
        local doublyEncodedUser = base64.encode(firstEncodedUser)
        os.sleep(0.5)
        local data = doublyEncodedUser
        writer.write(data, user .. "'s InfinityCard", true)
        print("[INFO] Успешно!")
        os.sleep(4)
        os.execute("clear")
    end
end