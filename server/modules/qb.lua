MySQL = MySQL ---@diagnostic disable-line

local QBCore = nil

QBServer = Class {}

function QBServer:init()
    QBCore = exports['qb-core']:GetCoreObject()

    QBCore.Functions.CreateCallback("gtao-multicharacter:server:getCharacters", function(source, cb)
        local license = QBCore.Functions.GetIdentifier(source, 'license')

        local characters = {}

        local query =
        'SELECT players.*, player_outfits.model, player_outfits.skin FROM players INNER JOIN player_outfits ON player_outfits.citizenid = players.citizenid WHERE license = ? LIMIT 1'
        local rawCharacters = MySQL.query.await(query, { license })

        for i = 1, (#rawCharacters), 1 do
            local character = rawCharacters[i]

            character.charinfo = json.decode(character.charinfo)
            character.money = json.decode(character.money)
            character.job = json.decode(character.job)
            character.model = character.model ~= nil and tonumber(character.model) or 'mp_m_freemode_01'
            character.skin = json.decode(character.skin)

            characters[#characters + 1] = character
        end

        cb(characters)
    end)
end
