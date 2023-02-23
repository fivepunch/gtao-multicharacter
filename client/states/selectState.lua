SelectState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function SelectState:init()
    Multicharacter:onCharacterSelect(function(character)
        print('Character ' .. character.name .. ' selected!')

        gStateMachine:done() -- No need to transitioning flag

        Multicharacter:flipTheBird(character, function()
            Multicharacter:deleteCharacter(character)
            Multicharacter:setOutOfMulticharacter()
        end)
    end)
end

function SelectState:enter(params)
end

function SelectState:update()
end

function SelectState:exit()
end
