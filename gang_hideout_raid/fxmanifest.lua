fx_version 'cerulean'
game 'gta5'

description 'Gang Hideout Raid (Multiplayer Synced)'
author 'Decripterr'
version '1.0.0'

shared_script 'config.lua'

client_scripts {
    'client.lua'
}

server_scripts {
    '@qb-core/server/main.lua',
    'server.lua'
}

dependencies {
    'qb-core',
    'qb-target'
}
