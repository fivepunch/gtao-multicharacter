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

function onUISetResourceState(state, cb)
    if not gStateMachine then
        return cb(true)
    end

    gStateMachine:change(state)

    cb(true)
end

function enterMulticharacter()
    gStateMachine = StateMachine({
        ['idle'] = function() return IdleState() end,
        ['create'] = function() return CreateState() end,
        ['select'] = function() return SelectState() end,
        ['delete'] = function() return DeleteState() end,
    })

    RegisterNUICallback('setResourceState', onUISetResourceState)

    Multicharacter:onCharacterSpawn(function(character)
        print('Character ' .. character.name .. ' spawned!')
    end)

    Multicharacter:setIntoCharacterSelection(characters)

    gStateMachine:change('idle')
end

function exitMulticharacter()
    if gStateMachine then
        gStateMachine:done()
        gStateMachine = nil
    end

    Multicharacter:setOutOfMulticharacter()
end

CreateThread(function()
    while not NetworkIsSessionStarted() do
        Wait(0)
    end

    enterMulticharacter()
end)
