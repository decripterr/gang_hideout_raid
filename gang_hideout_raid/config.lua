Config = {}

Config.StartRaidNPC = {
    coords = vector4(-197.43, -1711.59, 32.66, 134.99),
    model = 'g_m_m_chigoon_02',
    targetLabel = 'Start Gang Hideout Raid'
}

Config.Blip = {
    enabled = true,
    coords = vector3(-608.95, -1608.51, 26.89),
    sprite = 161,
    color = 1,
    scale = 0.9,
    label = "Gang Hideout"
}

Config.Guards = {
    { coords = vector4(-612.24, -1608.82, 26.89, 354.31), model = 'g_m_y_ballasout_01', weapon = 'weapon_assaultrifle' },
    { coords = vector4(-608.5, -1607.96, 26.75, 62.64), model = 'g_m_y_ballasout_01', weapon = 'weapon_smg' },
    { coords = vector4(-617.32, -1622.71, 33.01, 353.27), model = 'g_m_y_ballasout_01', weapon = 'weapon_microsmg' },
    { coords = vector4(-605.39, -1627.38, 33.01, 141.29), model = 'g_m_y_ballasout_01', weapon = 'weapon_pumpshotgun' },
    { coords = vector4(-617.15, -1633.37, 33.02, 42.08), model = 'g_m_y_ballasout_01', weapon = 'weapon_assaultrifle' },
    { coords = vector4(1269.0, -1706.5, 54.8, 300.0), model = 'g_m_y_ballasout_01', weapon = 'weapon_smg' },
    { coords = vector4(-590.38, -1618.95, 33.01, 97.2), model = 'g_m_y_ballasout_01', weapon = 'weapon_pistol' },
    { coords = vector4(-605.09, -1622.89, 33.01, 167.82), model = 'g_m_y_ballasout_01', weapon = 'weapon_machinepistol' },
    { coords = vector4(-615.64, -1628.5, 33.01, 98.47), model = 'g_m_y_ballasout_01', weapon = 'weapon_microsmg' },
    { coords = vector4(-624.61, -1618.62, 33.01, 258.7), model = 'g_m_y_ballasout_01', weapon = 'weapon_sawnoffshotgun' },
    { coords = vector4(-609.17, -1612.5, 31, 119.8), model = 'g_m_y_ballasout_01', weapon = 'weapon_combatpdw' },
    { coords = vector4(-611.49, -1614.83, 27.01, 347.29), model = 'g_m_y_ballasout_01', weapon = 'weapon_pistol' },
    { coords = vector4(-599.62, -1587.85, 26.75, 119.01), model = 'g_m_y_ballasout_01', weapon = 'weapon_microsmg' },
    { coords = vector4(-605.2, -1602.69, 34.49, 78.1), model = 'g_m_y_ballasout_01', weapon = 'weapon_assaultrifle' },
    { coords = vector4(-610.55, -1608.18, 30.2, 4.95), model = 'g_m_y_ballasout_01', weapon = 'weapon_advancedrifle' },
    -- Repeat up to 15 NPCs with different coords and weapons
}

Config.LootCrates = {
    vector3(-613.25, -1624.78, 33.01),
    vector3(-605.89, -1633.7, 33.05),
    vector3(-596.6, -1619.59, 33.01),
    vector3(-589.16, -1618.51, 33.01)
    -- Add more as needed
}
