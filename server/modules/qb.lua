MySQL = MySQL ---@diagnostic disable-line

local QBCore = nil

QBServer = Class {}

-- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#L29
local function loadHouses(source)
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

-- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#L6
local function giveStarterItems(source)
    local Player = QBCore.Functions.GetPlayer(source)

    for _, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "Class C Driver License"
        end
        Player.Functions.AddItem(v.item, v.amount, false, info)
    end
end

local function runEnvironmentCheck()
    if not hasResource('qb-clothing') then
        return nil, "qb-clothing is missing in your server. This resource doesn't support custom QB-Core setups."
    end

    return true
end

function QBServer:init()
    -- This verifies if your environment satisfies this resource requirements.
    -- If you wish to adapt this resource to suit your needs, you can safely comment this.
    if assert(runEnvironmentCheck()) then
        print('^2QB-Core environment check successfull!')
    end

    QBCore = exports['qb-core']:GetCoreObject()

    self.hasDonePreloading = {}

    -- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#LL75-L82C5
    self.onPlayerLoadedEvent = AddEventHandler('QBCore:Server:PlayerLoaded', function(Player)
        Citizen.Wait(1000) -- 1 second should be enough to do the preloading in other resources
        self.hasDonePreloading[Player.PlayerData.source] = true
    end)

    self.onPlayerUnloadedEvent = AddEventHandler('QBCore:Server:OnPlayerUnload', function(src)
        self.hasDonePreloading[src] = false
    end)

    QBCore.Functions.CreateCallback("gtao-multicharacter:server:getCharacters", function(source, cb)
        local license = QBCore.Functions.GetIdentifier(source, 'license')

        local characters = {}

        local query =
            'SELECT players.*, playerskins.model, playerskins.skin ' ..
            'FROM players ' ..
            'INNER JOIN playerskins on players.citizenid = playerskins.citizenid ' ..
            'WHERE license = ?'
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
    self.onLoadCharacterEvent = RegisterNetEvent('gtao-multicharacter:server:loadCharacter', function(character)
        local src = source

        if not QBCore.Player.Login(src, character.citizenid) then return end

        Citizen.CreateThread(function()
            while not self.hasDonePreloading[src] do
                Citizen.Wait(1000)
            end

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
    end)

    -- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#L103
    QBCore.Functions.CreateCallback('gtao-multicharacter:server:createCharacter', function(source, cb, charinfo)
        local character = {
            cid = charinfo.cid,
            charinfo = charinfo
        }

        if not QBCore.Player.Login(source, false, character) then return end

        QBCore.Commands.Refresh(source)

        loadHouses(source)
        giveStarterItems(source)

        cb(true)
    end)

    self.onLogoutFromCharacterEvent = RegisterNetEvent('gtao-multicharacter:server:logoutFromCharacter', function()
        local src = source
        QBCore.Player.Logout(src)
    end)

    -- https://github.com/qbcore-framework/qb-multicharacter/blob/e76183ad3ee6440610e498c7b7edffb4f8ca7c89/server/main.lua#LL131-L135C5
    self.onDeleteCharacterEvent = RegisterNetEvent('gtao-multicharacter:server:deleteCharacter', function(citizenid)
        local src = source
        QBCore.Player.DeleteCharacter(src, citizenid)
    end)
end

function QBServer:destroy()
    RemoveEventHandler(self.onPlayerLoadedEvent)
    RemoveEventHandler(self.onPlayerUnloadedEvent)
    RemoveEventHandler(self.onLoadCharacterEvent)
    RemoveEventHandler(self.onLogoutFromCharacterEvent)
    RemoveEventHandler(self.onDeleteCharacterEvent)

    self.hasDonePreloading = nil
end
