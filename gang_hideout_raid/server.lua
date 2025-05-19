local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("gangraid:requestStart", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local raid = Config.RaidLocations[math.random(#Config.RaidLocations)]
    TriggerClientEvent("gangraid:start", src, raid)
end)

RegisterServerEvent("gangraid:giveReward", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    for _, reward in pairs(Config.Rewards) do
        if math.random(100) <= reward.chance then
            Player.Functions.AddItem(reward.item, reward.amount)
            TriggerClientEvent("QBCore:Notify", src, "Found: " .. reward.item, "success")
            break
        end
    end
end)

RegisterServerEvent("gangraid:policeAlert", function(coords)
    local alertData = {
        title = "Gang Hideout Raid",
        coords = coords,
        description = "Gunfire and gang activity reported near a warehouse!",
        radius = 75,
        sprite = 84,
        color = 1,
        scale = 1.2,
        duration = 6000,
        job = { 'police', 'sheriff' }
    }
    TriggerClientEvent("ps-dispatch:client:customAlert", -1, alertData)
end)
