gFramework = nil
gStateMachine = nil

local Multicharacter = exports['fivepunch-multicharacter']

local function onUISetResourceState(data, cb)
    if not gStateMachine then
        return cb(true)
    end

    gStateMachine:change(data.state, data.parameters)

    cb(true)
end

local function OnUIGetCreateCharacterFormStructure(_, cb)
    if not gFramework then
        return cb({})
    end

    cb(gFramework:getCreateCharacterFormStructure())
end

local function OnUICreateCharacter(data, cb)
    if not gFramework then
        return cb({})
    end

    gFramework:onCharacterCreate(data)

    cb(true)
end

local function OnUIPreviousCharacters(_, cb)
    if not gStateMachine then
        cb(false)
    end

    Multicharacter:previousPage()
end

local function OnUINextCharacters(_, cb)
    if not gStateMachine then
        cb(false)
    end

    Multicharacter:nextPage()
end

function startGTAOMulticharacter()
    if not gFramework then return end

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

    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'navigate', payload = '/' })
end

AddEventHandler('onResourceStop', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then return end

    gFramework:destroy()

    Multicharacter:setOutOfMulticharacter()
end)

CreateThread(function()
    RegisterNUICallback('setResourceState', onUISetResourceState)
    RegisterNUICallback('getCreateCharacterFormStructure', OnUIGetCreateCharacterFormStructure)
    RegisterNUICallback('createCharacter', OnUICreateCharacter)
    RegisterNUICallback('previousCharacters', OnUIPreviousCharacters)
    RegisterNUICallback('nextCharacters', OnUINextCharacters)

    if isQBCore() then
        gFramework = QBClient()
    end

    if isESX() then
        gFramework = ESXClient()
    end
end)
