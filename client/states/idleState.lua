IdleState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function IdleState:init()
    Multicharacter:onCharacterSelect(function(character)
        --noop
    end)
end

function IdleState:enter(params)
    SendNUIMessage({ type = 'navigate', payload = '/idle' })
end

function IdleState:update()
end

function IdleState:exit()
end
