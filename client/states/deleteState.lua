DeleteState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function DeleteState:init()
    Multicharacter:onCharacterSelect(function(character)
        Multicharacter:flipTheBird(character)
        Multicharacter:deleteCharacter(character)

        gFramework:onCharacterDelete(character)

        Multicharacter:setSelecting()
    end)
end

function DeleteState:enter(params)
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    SendNUIMessage({ type = 'navigate', payload = '/delete' })
end

function DeleteState:update()
end

function DeleteState:exit()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end
