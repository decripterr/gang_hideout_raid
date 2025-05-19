fx_version 'cerulean'
game 'gta5'

author 'Decripterr'
description 'Gang Hideout Raid Heist for QBCore with ps-dispatch integration'
version '1.1.0'

shared_script 'config.lua'
client_scripts {
    'client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Remove if not using MySQL
    'server.lua',
}
