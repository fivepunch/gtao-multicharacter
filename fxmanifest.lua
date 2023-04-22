fx_version 'cerulean'
game { 'gta5' }

title 'GTAO Multicharacter'
description 'Fivepunch GTAO themed multi character script.'
author 'Fivepunch https://fivepunch.io'
version '1.2.0'

lua54 'yes'

shared_scripts {
    'shared/utils.lua',
}

client_scripts {
    'lib/class.lua',
    'lib/stateMachine.lua',
    'client/states/idleState.lua',
    'client/states/createState.lua',
    'client/states/selectState.lua',
    'client/states/deleteState.lua',
    'client/bridge.lua',
    'client/modules/*.lua',
    'client/main.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'lib/class.lua',
    'server/modules/*.lua',
    'server/main.lua'
}

files {
    'ui/dist/**/*'
}

ui_page 'ui/dist/index.html'

dependencies {
    'oxmysql',
    'fivepunch-multicharacter',
}
