local Multicharacter = exports['fivepunch-multicharacter']

function onUISetResourceState(state, cb)
    if not gStateMachine then
        return cb(true)
    end

    gStateMachine:change(state)

    cb(true)
end

function startGTAOMulticharacter(framework)
    gStateMachine = StateMachine({
            ['idle'] = function() return IdleState() end,
            ['create'] = function() return CreateState() end,
            ['select'] = function() return SelectState(framework) end,
            ['delete'] = function() return DeleteState(framework) end,
    })

    Multicharacter:onCharacterSpawn(function(character)
        framework:onCharacterSpawn(character)
    end)

    Multicharacter:setIntoCharacterSelection(framework:getCharacters())

    gStateMachine:change('idle')

    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
end

function stopGTAOMulticharacter()
    if gStateMachine then
        gStateMachine:done()
        gStateMachine = nil
    end

    Multicharacter:setOutOfMulticharacter()

    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'navigate', payload = '/' })
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    stopGTAOMulticharacter()
end)

CreateThread(function()
    RegisterNUICallback('setResourceState', onUISetResourceState)

    if isQBCore() then
        return startGTAOMulticharacter(QBClient())
    end

    -- if isESX() then
    --     return startGTAOMulticharacter(QBClient())
    -- end

    -- if isVRP() then
    --     return startGTAOMulticharacter(QBClient())
    -- end

    startGTAOMulticharacter(StandaloneClient())
end)
