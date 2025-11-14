local function getInGameId(src)
    return tostring(src)
end

local function pushIdToClient(src)
    local id = getInGameId(src)
    local ps = Player(src) and Player(src).state
    local ch = ps and ps.Character or nil
    local money = ch and ch.Money or nil
    local gold  = ch and ch.Gold  or nil
    local rol = nil
    if type(ch) == "table" then
        rol = ch.Rol or ch.rol or ch.ROL or ch.Currency2 or ch.currency2 or ch.Gold2 or ch.gold2
    end
    TriggerClientEvent("AX##LWZ:vlab_watermark:setGameId", src, id, money, gold, rol)
end

AddEventHandler("vorp:SelectedCharacter", function(source, _character)
    pushIdToClient(source)
end)

RegisterNetEvent("AX##LWZ:vlab_watermark:requestGameId", function()
    pushIdToClient(source)
end)
