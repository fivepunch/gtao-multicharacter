MySQL = MySQL ---@diagnostic disable-line

local QBCore = nil

QBServer = Class {}

-- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#L29
function loadHouses(source)
    local houseGarages = {}
    local houses = {}
    local result = MySQL.query.await('SELECT * FROM houselocations', {})

    if result[1] ~= nil then
        for _, v in pairs(result) do
            local owned = false
            if tonumber(v.owned) == 1 then
                owned = true
            end
            local garage = v.garage ~= nil and json.decode(v.garage) or {}
            houses[v.name] = {
                coords = json.decode(v.coords),
                owned = owned,
                price = v.price,
                locked = true,
                adress = v.label,
                tier = v.tier,
                garage = garage,
                decorations = {},
            }
            houseGarages[v.name] = {
                label = v.label,
                takeVehicle = garage,
            }
        end
    end

    TriggerClientEvent("qb-garages:client:houseGarageConfig", source, houseGarages)
    TriggerClientEvent("qb-houses:client:setHouseConfig", source, houses)
end

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

    -- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#L89
    RegisterNetEvent('gtao-multicharacter:server:loadCharacter', function(character)
        local src = source

        if not QBCore.Player.Lgin(src, character.citizenid) then return end

        print('^2[qb-core]^7 ' ..
            GetPlayerName(src) .. ' (Citizen ID: ' .. character.citizenid .. ') has succesfully loaded!')

        QBCore.Commands.Refresh(src)

        loadHouses(src)

        TriggerClientEvent('apartments:client:setupSpawnUI', src, character)
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green",
            "**" ..
            GetPlayerName(src) ..
            "** (<@" ..
            (QBCore.Functions.GetIdentifier(src, 'discord'):gsub("discord:", "") or "unknown") ..
            "> |  ||" ..
            (QBCore.Functions.GetIdentifier(src, 'ip') or 'undefined') ..
            "|| | " ..
            (QBCore.Functions.GetIdentifier(src, 'license') or 'undefined') ..
            " | " .. character.citizenid .. " | " .. src .. ") loaded..")
    end)
end
