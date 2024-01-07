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
    print("© 2022-2023 Infinitum")
    io.write("Выберите алгоритм шифрования (KSH/BSE): ")
    local warningColor = "\27[33m"
    local infoColor = "\27[0m"
    local alg = string.lower(io.read())

    if alg == "ksh" then
        print("\nПонял. Будем использовать KSH")
        io.write("Никнейм того кто будет использовать карту (С учетом регистра): ")
        local user = io.read()
        print(warningColor .. "[WARNING] После выполнения, карту будет невозможно переписать!")
        os.sleep(2)
        print(infoColor .. "[INFO] Начинаем...")
        local salt = math.random(100000, 999999)
        os.sleep(0.5)
        writer.write(user, user .. "'s InfinityCard", true)
        print(infoColor .. "[INFO] Успешно!")
        os.sleep(4)
        os.execute("clear")
    elseif alg == "bse" then
        print("\nПонял. Будем использовать BSE")
        io.write("Никнейм того кто будет использовать карту (С учетом регистра): ")
        local user = io.read()
        print(warningColor .. "[WARNING] После выполнения, карту будет невозможно переписать!")
        os.sleep(2)
        print(infoColor .. "[INFO] Начинаем...")
        local firstEncodedUser = encode64(user)
        local doublyEncodedUser = encode64(firstEncodedUser)
        os.sleep(0.5)
        local data = doublyEncodedUser
        writer.write(data, user .. "'s InfinityCard", true)
        print(infoColor .. "[INFO] Успешно!")
        os.sleep(4)
        os.execute("clear")
    end
end