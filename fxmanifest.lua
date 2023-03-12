fx_version 'cerulean'
game 'gta5'

author 'Mxthess'
description 'AntiCheat for TROS'
version '1.0.1'

client_script {
    'client/mx_client.lua',
    'config/mx_client_config.lua'
}

server_script {
    'server/mx_server.lua',
    '@mysql-async/lib/MySQL.lua',
    'config/mx_server_config.lua'
}

shared_script {
    'config/mx_client_config.lua',
    'config/mx_server_config.lua'
}

escrow_ignore {
    'server/mx_server.lua',
    'client/mx_client.lua'
}

lua54 'yes'
