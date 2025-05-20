local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("gang_hideout:startRaid", function()
    TriggerClientEvent("gang_hideout:spawnGuards", -1)
    TriggerClientEvent("gang_hideout:spawnLoot", -1)
    TriggerClientEvent("gang_hideout:createBlip", -1)
end)

RegisterNetEvent("gang_hideout:giveLoot", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    -- Customize your loot here
    local items = {
        { name = "markedmoney", chance = 60 },
        { name = "weapon_pumpshotgun", chance = 10 },
        { name = "cokebaggy", chance = 30 }
    }

    for _, item in pairs(items) do
        if math.random(1, 100) <= item.chance then
            Player.Functions.AddItem(item.name, 500)
            TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items[item.name], "add")
            break
        end
    end
end)
