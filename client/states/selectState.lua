SelectState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function SelectState:init()
    Multicharacter:onCharacterSelect(function(character)
        print('Character ' .. character.name .. ' selected!')

        Multicharacter:flipTheBird(character)
        Multicharacter:deleteCharacter(character)

        Multicharacter:setOutOfMulticharacter()

        gFramework:onCharacterSelect(character)

        stopGTAOMulticharacter()
    end)
end

function SelectState:enter(params)
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    SendNUIMessage({ type = 'navigate', payload = '/selection/select' })
end

function SelectState:update()
end

function SelectState:exit()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end
