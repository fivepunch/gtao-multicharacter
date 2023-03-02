SelectState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function SelectState:init()
    Multicharacter:onCharacterSelect(function(character)
        print('Character ' .. character.name .. ' selected!')

        Multicharacter:flipTheBird(character, function()
            Multicharacter:deleteCharacter(character)

            stopGTAOMulticharacter()
        end)
    end)
end

function SelectState:enter(params)
    SendNUIMessage({ type = 'navigate', payload = '/select' })
end

function SelectState:update()
end

function SelectState:exit()
end
