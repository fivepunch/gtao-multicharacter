gFramework = nil
gStateMachine = nil

local Multicharacter = exports['fivepunch-multicharacter']

function onUISetResourceState(state, cb)
    if not gStateMachine then
        return cb(true)
    end

    gStateMachine:change(state)

    cb(true)
end

function OnUIGetCreateCharacterFormStructure(_, cb)
    if not gFramework then
        return cb({})
    end

    cb(gFramework:getCreateCharacterFormStructure())
end

function OnUICreateCharacter(data, cb)
    if not gFramework then
        return cb({})
    end

    gFramework:onCharacterCreate(data)
end

function startGTAOMulticharacter(framework)
    if isQBCore() then
        gFramework = QBClient()
    end

    -- if isESX() then
    --     gFramework = ESXClient()
    -- end

    -- if isVRP() then
    --     gFramework = VRPClient()
    -- end

    gStateMachine = StateMachine({
        ['idle'] = function() return IdleState() end,
        ['create'] = function() return CreateState() end,
        ['select'] = function() return SelectState() end,
        ['delete'] = function() return DeleteState() end,
    })

    gStateMachine:change('idle')
end

function stopGTAOMulticharacter()
    if gStateMachine then
        gStateMachine:done()
        gStateMachine = nil
    end

    if gFramework then
        gFramework:destroy()
        gFramework = nil
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
    RegisterNUICallback('getCreateCharacterFormStructure', OnUIGetCreateCharacterFormStructure)
    RegisterNUICallback('createCharacter', OnUICreateCharacter)

    while true do
        Wait(0)
        if NetworkIsSessionStarted() then
            return startGTAOMulticharacter()
        end
    end
end)
