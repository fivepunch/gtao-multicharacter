local QBCore = nil

QBClient = Class {}

function QBClient:init()
    QBCore = exports['qb-core']:GetCoreObject()

    TriggerEvent('qb-weathersync:client:DisableSync')

    self.cachedCharacters = {}
end

function QBClient:fetchAndCacheCharacters()
    local p = promise.new()

    QBCore.Functions.TriggerCallback("gtao-multicharacter:server:getCharacters", function(characters)
        p:resolve(characters)
    end)

    Citizen.Await(p)

    self.cachedCharacters = p.value
end

function QBClient:getCharacters()
    self:fetchAndCacheCharacters()

    local characters = {}

    for _, character in pairs(self.cachedCharacters) do
        table.insert(characters, {
            identifier = character.citizenid,
            name = string.format('%s %s', character.charinfo.firstname, character.charinfo.lastname),
            model = character.model,
        })
    end

    return characters
end

function QBClient:getCreateCharacterFormStructure()
    return {
        {
            type = 'text',
            name = 'firstname',
            label = 'First name',
        },
        {
            type = 'text',
            name = 'lastname',
            label = 'Last name',
        },
        {
            type = 'select',
            name = 'gender',
            label = 'Gender',
            options = {
                { value = 0, label = 'Male' },
                { value = 1, label = 'Female' },
            },
        }
    }
end

function QBClient:onCharacterSpawn(character)
    for _, cached in pairs(self.cachedCharacters) do
        if cached.citizenid == character.identifier then
            TriggerEvent('qb-clothing:client:loadPlayerClothing', cached.skin, character.ped)
        end
    end
end

function QBClient:onCharacterSelect(character)
    for _, cached in pairs(self.cachedCharacters) do
        if character.identifier == cached.citizenid then
            TriggerServerEvent('gtao-multicharacter:server:loadCharacter', cached)
        end
    end
end

function QBClient:onCharacterCreate(character)
    -- QB doesn't auto assign a updated cid when creating a character
    local cid = 1

    for _, cached in pairs(self.cachedCharacters) do
        if cached.cid > cid then
            cid = cached.cid
        end
    end

    character.cid = cid

    local p = promise.new()

    QBCore.Functions.TriggerCallback("gtao-multicharacter:server:createCharacter", function()
        p:resolve()
    end, character)

    Citizen.Await(p)

    SendNUIMessage({ type = 'navigate', payload = '/' })

    TriggerEvent('qb-clothes:client:CreateFirstCharacter')

    local onMenuCloseEvent = nil

    onMenuCloseEvent = AddEventHandler('qb-clothing:client:onMenuClose', function()
        if onMenuCloseEvent then
            RemoveEventHandler(onMenuCloseEvent)
        end

        TriggerServerEvent('gtao-multicharacter:server:characterCreationCompleted')

        local onPlayerUnloadEvent = nil

        RegisterNetEvent('QBCore:Client:OnPlayerUnload')
        onPlayerUnloadEvent = AddEventHandler('QBCore:Client:OnPlayerUnload', function()
            RemoveEventHandler(onPlayerUnloadEvent)
            gStateMachine:change('idle', { transition = false })
        end)
    end)
end

function QBClient:onCharacterDelete(character)
    TriggerServerEvent('gtao-multicharacter:server:deleteCharacter', character.identifier) -- citizenid
end

function QBClient:destroy()
    TriggerEvent('qb-weathersync:client:EnableSync')
end