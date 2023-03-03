local QBCore = nil

QBClient = Class {}

function QBClient:init()
    QBCore = exports['qb-core']:GetCoreObject()

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
            name = character.name,
            model = character.model,
        })
    end

    return characters
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

function QBClient:onCharacterDelete(character)
    TriggerServerEvent('gtao-multicharacter:server:deleteCharacter', character.identifier) -- citizenid
end
