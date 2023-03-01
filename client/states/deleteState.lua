DeleteState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function DeleteState:init()
    self.transitioning = false

    Multicharacter:onCharacterSelect(function(character)
        print('Character ' .. character.name .. ' deleted!')

        self.transitioning = true

        Multicharacter:flipTheBird(character, function()
            self.transitioning = false

            Multicharacter:deleteCharacter(character)
            Multicharacter:setSelecting()
        end)
    end)
end

function DeleteState:enter(params)
    SendNUIMessage({ type = 'navigate', payload = '/delete' })
end

function DeleteState:update()
    if self.transitioning then return end
end

function DeleteState:exit()
end
