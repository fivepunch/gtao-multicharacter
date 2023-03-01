CreateState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function CreateState:init()
    Multicharacter:onCharacterSelect(function(character)
        print('Character ' .. character.name .. ' selected!')

        gStateMachine:done() -- No need to transitioning flag

        Multicharacter:flipTheBird(character, function()
            Multicharacter:deleteCharacter(character)
            Multicharacter:setOutOfMulticharacter()
        end)
    end)
end

function CreateState:enter(params)
    SendNUIMessage({ type = 'navigate', payload = '/create' })
end

function CreateState:update()
end

function CreateState:exit()
end
