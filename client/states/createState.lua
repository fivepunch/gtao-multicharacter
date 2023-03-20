CreateState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function CreateState:init()
    SetNuiFocus(false, false)
    SendNUIMessage({ type = 'navigate', payload = '/' })
end

function CreateState:enter(params)
    Multicharacter:setIntoCharacterCreation()

    SetNuiFocus(true, true)
    SendNUIMessage({ type = 'navigate', payload = '/creation' })
end

function CreateState:update()
end

function CreateState:exit()
    SetNuiFocus(false, false)
end
