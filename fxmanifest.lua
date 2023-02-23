fx_version 'cerulean'
game { 'gta5' }

title 'GTAO Multicharacter'
description 'Fivepunch GTAO themed multi character script.'
author 'Fivepunch https://fivepunch.io'
version '1.0.0'

lua54 'yes'

client_script {
    'lib/class.lua',
    'lib/stateMachine.lua',
    'client/instructionalButtons.lua',
    'client/states/selectState.lua',
    'client/states/deleteState.lua',
    'client/main.lua'
}

dependencies {
    'fivepunch-multicharacter'
}
