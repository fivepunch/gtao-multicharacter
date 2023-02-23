--[[
    States

    - Selecting state:
        Label: 'Select your character'
        Commands:
            Backspace -> Exit character selection
            Left arrow -> Previous page
            Right arrow -> Next page
            Delete -> Transition to delete character

    - Deleting state:
        Label: 'Delete a character'
        Commands:
            Backspace -> Exit deleting state back to selecting state
            Left Arrow -> Previous page
            Right arrow -> Next page
 ]]
local Multicharacter = exports['fivepunch-multicharacter']

local characters = {
    { identifier = 1, name = 'Character 1', model = 'player_zero' },
    { identifier = 2, name = 'Character 2', model = 'mp_m_freemode_01' },
    { identifier = 3, name = 'Character 3', model = 's_m_m_movspace_01' },
    { identifier = 4, name = 'Character 4', model = 'u_m_y_zombie_01' },
    { identifier = 5, name = 'Character 5', model = 'player_one' },
    { identifier = 6, name = 'Character 6', model = 'a_m_y_skater_01' },
    { identifier = 7, name = 'Character 7', model = 'csb_chef' },
    { identifier = 8, name = 'Character 8', model = 'mp_f_cocaine_01' },
}

function enterSelection()
    gStateMachine = StateMachine({
        ['selecting'] = function() return SelectingState() end,
        ['deleting'] = function() return DeletingState() end,
    })

    Multicharacter:onCharacterSpawn(function(character)
        print('Character ' .. character.name .. ' spawned!')
    end)

    Multicharacter:setIntoCharacterSelection(characters)

    gStateMachine:change('selecting')
end

function exitSelection()
    if gStateMachine then
        gStateMachine:done()
        gStateMachine = nil
    end

    Multicharacter:setOutOfMulticharacter()
end

RegisterCommand('enter', enterSelection, false)
RegisterCommand('exit', exitSelection, false)
RegisterCommand('creation', function()
    Multicharacter:setIntoCharacterCreation()

    Citizen.Wait(10000)

    Multicharacter:setOutOfMulticharacter()
end, false)
