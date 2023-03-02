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

    return self.cachedCharacters
end

function QBClient:onCharacterSpawn(character)
    for _, cached in pairs(self.cachedCharacters) do
        if cached.citizenid == character.identifier then
            TriggerEvent('qb-clothing:client:loadPlayerClothing', cached.skin, character.ped)
        end
    end
end
