local QBCore = exports['qb-core']:GetCoreObject()
local lootedCrates = {}

-- === SPAWN GUARDS ===
RegisterNetEvent('gang_hideout:spawnGuards', function()
    local groupHash = GetHashKey("HIDEOUT_GUARDS")
    AddRelationshipGroup("HIDEOUT_GUARDS")

    SetRelationshipBetweenGroups(5, groupHash, GetHashKey("PLAYER"))
    SetRelationshipBetweenGroups(5, GetHashKey("PLAYER"), groupHash)

    for _, guard in pairs(Config.Guards) do
        RequestModel(guard.model)
        while not HasModelLoaded(guard.model) do Wait(0) end

        local ped = CreatePed(0, guard.model, guard.coords.x, guard.coords.y, guard.coords.z, guard.coords.w, true, true)
        SetEntityAsMissionEntity(ped, true, true)
        SetPedRelationshipGroupHash(ped, groupHash)
        GiveWeaponToPed(ped, GetHashKey(guard.weapon), 200, true, true)
        SetPedArmour(ped, 100)
        SetPedAccuracy(ped, 70)
        SetPedAsEnemy(ped, true)
        TaskCombatHatedTargetsAroundPed(ped, 30.0, 0)
        SetPedCombatAttributes(ped, 46, true)
        SetPedCombatRange(ped, 2)
        SetPedCombatAbility(ped, 2)
        SetPedCombatMovement(ped, 2)
    end
end)

-- === SPAWN LOOT CRATES ===
RegisterNetEvent('gang_hideout:spawnLoot', function()
    for i, coords in pairs(Config.LootCrates) do
        local crateId = "crate_" .. i
        local obj = CreateObject(`prop_box_wood01a`, coords.x, coords.y, coords.z, true, true, true)
        SetEntityAsMissionEntity(obj, true, true)
        FreezeEntityPosition(obj, true)
        PlaceObjectOnGroundProperly(obj)

        exports['qb-target']:AddTargetEntity(obj, {
            options = {
                {
                    label = "Search Crate",
                    icon = "fas fa-box",
                    action = function(entity)
                        if lootedCrates[crateId] then
                            QBCore.Functions.Notify("This crate is empty.", "error")
                            return
                        end
                        lootedCrates[crateId] = true
                        TriggerServerEvent("gang_hideout:giveLoot")
                        exports['qb-target']:RemoveTargetEntity(entity, crateId)
                        DeleteEntity(entity)
                    end
                }
            },
            distance = 2.0
        })
    end
end)

-- === CREATE START NPC ===
CreateThread(function()
    local npc = Config.StartRaidNPC
    RequestModel(npc.model)
    while not HasModelLoaded(npc.model) do Wait(0) end

    local ped = CreatePed(0, npc.model, npc.coords.x, npc.coords.y, npc.coords.z - 1, npc.coords.w, false, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)

    exports['qb-target']:AddTargetEntity(ped, {
        options = {
            {
                label = npc.targetLabel,
                icon = "fas fa-skull-crossbones",
                action = function()
                    TriggerServerEvent("gang_hideout:startRaid")
                end
            }
        },
        distance = 2.5
    })
end)

-- === OPTIONAL: CREATE RAID BLIP ===
RegisterNetEvent("gang_hideout:createBlip", function()
    local blip = AddBlipForCoord(Config.Blip.coords)
    SetBlipSprite(blip, Config.Blip.sprite)
    SetBlipScale(blip, Config.Blip.scale)
    SetBlipColour(blip, Config.Blip.color)
    SetBlipDisplay(blip, 4)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(Config.Blip.label)
    EndTextCommandSetBlipName(blip)
end)
