local config = {
    limit = {1, 200},                              --N�mero m�nimo e m�ximo da loteria.
    numbers = 3,                                   --Quantos n�meros o player deve escolher.
    price = xxx,                                   --Pre�o para participar da loteria.
    storages = {9571, 9572, 9573},
}    
function onSay(cid, words, param)
    if getGlobalStorageValue(config.storages[1]) < 1 then
        doPlayerSendCancel(cid, "A loteria est� fechada.")
    elseif getPlayerStorageValue(cid, config.storages[3]) ~= -1 then
        doPlayerSendCancel(cid, "Voc� j� fez sua aposta.")
    elseif param == "" then
        doPlayerSendCancel(cid, "!apostar number1 number2 number3")
    elseif getPlayerMoney(cid) < config.price then
        doPlayerSendCancel(cid, "Voc� precisa de, no m�nimo, "..config.price.." gold para apostar.")
    else
        local numbers = param:explode(" ")
        if #numbers ~= config.numbers then
            doPlayerSendCancel(cid, "Escolha "..config.numbers.." n�meros, entre "..config.limit[1].." - "..config.limit[2]..".")
        else           
            local str = ""
            for i = 1, #numbers do
                numbers[i] = tonumber(numbers[i])
                if not numbers[i] or numbers[i] < config.limit[1] or numbers[i] > config.limit[2] then
                    return doPlayerSendCancel(cid, "Escolha n�meros v�lidos ["..config.limit[1].." - "..config.limit[2].."].")
                end
                if str == "" then
                    str = numbers[i]
                else
                    str = str..(i == #numbers and " e " or ", ")..numbers[i]
                end
            end
            doPlayerRemoveMoney(cid, config.price)
            doPlayerSendTextMessage(cid, 27, "Voc� escolheu os n�meros: "..str..".")
            for i = 0, config.numbers - 1 do
                setPlayerStorageValue(cid, config.storages[3] + i, numbers[i + 1])
            end
            addGlobalStorageValue(config.storages[2], config.price)
        end
    end
    return true
end