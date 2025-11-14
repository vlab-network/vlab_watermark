local function getInGameId(src)
    return tostring(src)
end

local function pushIdToClient(src)
    local id = getInGameId(src)
    local ps = Player(src) and Player(src).state
    local money = ps and ps.Character and ps.Character.Money or nil
    local gold  = ps and ps.Character and ps.Character.Gold  or nil
    TriggerClientEvent("AX##LWZ:vlab_watermark:setGameId", src, id, money, gold)
end

AddEventHandler("vorp:SelectedCharacter", function(source, _character)
    pushIdToClient(source)
end)

RegisterNetEvent("AX##LWZ:vlab_watermark:requestGameId", function()
    pushIdToClient(source)
end)