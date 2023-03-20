IdleState = Class { __includes = State }

local Multicharacter = exports['fivepunch-multicharacter']

function IdleState:init()
    Multicharacter:onCharacterSpawn(function(character)
        gFramework:onCharacterSpawn(character)
    end)

    Multicharacter:onCharacterSelect(function(character)
        --noop
    end)
end

function IdleState:enter(params)
    local characters = gFramework:getCharacters()

    local transition = true
    local setIntoSelection = true

    if params then
        if params.transition ~= nil then
            transition = params.transition
        end
        if params.setIntoSelection ~= nil then
            setIntoSelection = params.setIntoSelection
        end
    end

    if setIntoSelection then
        Multicharacter:setIntoCharacterSelection(characters, {
            transition = transition,
            drawCursorSprite = false,
        })
    end
    
    SetNuiFocus(true, true)
    SetNuiFocusKeepInput(true)
    SendNUIMessage({ type = 'navigate', payload = '/selection' })
end

function IdleState:update()
end

function IdleState:exit()
    SetNuiFocus(false, false)
    SetNuiFocusKeepInput(false)
end
