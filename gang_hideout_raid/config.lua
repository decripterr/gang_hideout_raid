Config = {}

Config.UseQBGangs = true

Config.RaidStartNPC = {
    model = 'ig_djblamrupert',
    coords = vector4(-1293.7, -821.0, 17.1, 210.0),
    targetLabel = "Start Gang Raid"
}

Config.RaidLocations = {
    {
        name = "Vagos Warehouse",
        coords = vector3(330.89, -2014.79, 21.57),
        heading = 180.0,
        enemies = 12,
        lootCrates = {
            vector3(334.89, -2016.79, 21.57),
            vector3(331.32, -2012.90, 21.57)
        }
    },
    {
        name = "Ballers Crackhouse",
        coords = vector3(94.12, -1957.46, 20.74),
        heading = 180.0,
        enemies = 10,
        lootCrates = {
            vector3(97.12, -1954.46, 20.74)
        }
    }
}

Config.WeaponPool = {
    "weapon_pistol",
    "weapon_microsmg",
    "weapon_smg"
}

Config.Rewards = {
    { item = "weapon_pistol", amount = 1, chance = 30 },
    { item = "markedbills", amount = math.random(5000, 15000), chance = 50 },
    { item = "weed_brick", amount = 1, chance = 20 },
}

Config.PoliceNotify = true
Config.EscapeTime = 60
Config.SpawnEnemySUV = true
Config.EnemySUVModel = "gresley"
