local QBCore = exports['qb-core']:GetCoreObject()
local inRaid = false
local currentRaid = nil

CreateThread(function()
    RequestModel(Config.RaidStartNPC.model)
    while not HasModelLoaded(Config.RaidStartNPC.model) do Wait(0) end
    local npc = CreatePed(4, Config.RaidStartNPC.model, Config.RaidStartNPC.coords, false, true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    SetBlockingOfNonTemporaryEvents(npc, true)
    exports['qb-target']:AddTargetEntity(npc, {
        options = {
            {
                label = Config.RaidStartNPC.targetLabel,
                icon = "fas fa-skull-crossbones",
                action = function()
                    TriggerServerEvent("gangraid:requestStart")
                end,
            },
        },
        distance = 2.0
    })
end)

RegisterNetEvent("gangraid:start", function(raidData)
    inRaid = true
    currentRaid = raidData
    QBCore.Functions.Notify("You've located a rival hideout: " .. raidData.name, "success")
    SpawnEnemies(raidData)
    CreateLootCrates(raidData)
    if Config.PoliceNotify then
        TriggerServerEvent("gangraid:policeAlert", raidData.coords)
    end
    StartEscapeCountdown()
end)

function SpawnEnemies(raidData)
    for i = 1, raidData.enemies do
        local ped = CreatePed(4, "g_m_y_ballaorig_01", raidData.coords.x + math.random(-5,5), raidData.coords.y + math.random(-5,5), raidData.coords.z, math.random(0,360), true, true)
        GiveWeaponToPed(ped, Config.WeaponPool[math.random(#Config.WeaponPool)], 250, false, true)
        TaskCombatHatedTargetsAroundPed(ped, 50.0, 0)
    end
end

function CreateLootCrates(raidData)
    for _, crate in pairs(raidData.lootCrates) do
        exports['qb-target']:AddBoxZone("lootcrate_"..math.random(1000), crate, 1, 1, {
            name = "lootcrate",
            heading = 0,
            debugPoly = false,
            minZ = crate.z - 1,
            maxZ = crate.z + 1,
        }, {
            options = {
                {
                    label = "Loot Crate",
                    icon = "fas fa-box",
                    action = function()
                        QBCore.Functions.Progressbar("search_crate", "Looting Crate...", 5000, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function()
                            TriggerServerEvent("gangraid:giveReward")
                        end)
                    end,
                }
            },
            distance = 2.0
        })
    end
end

function StartEscapeCountdown()
    Wait(Config.EscapeTime * 1000)
    if Config.SpawnEnemySUV then
        local suv = CreateVehicle(Config.EnemySUVModel, GetEntityCoords(PlayerPedId()) + vector3(10,0,0), 0.0, true, true)
        TaskVehicleDriveToCoord(CreatePedInsideVehicle(suv, 4, "g_m_y_mexgoon_02", -1, true, true), suv, GetEntityCoords(PlayerPedId()), 30.0, 1, Config.EnemySUVModel, 786603, 1.0)
        QBCore.Functions.Notify("Enemy reinforcements arrived! Get out!", "error")
    end
end
