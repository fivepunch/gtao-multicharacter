DeleteState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function DeleteState:init(framework)
    Multicharacter:onCharacterSelect(function(character)
        Multicharacter:flipTheBird(character, function()
            framework:onCharacterDelete(character)
            Multicharacter:deleteCharacter(character)
        end)
    end)
end

function DeleteState:enter(params)
    SendNUIMessage({ type = 'navigate', payload = '/delete' })
end

function DeleteState:update()
end

function DeleteState:exit()
end
