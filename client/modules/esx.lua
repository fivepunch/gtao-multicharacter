local DEFAULT_ESX_SKIN = {
    ["m"] = {
        mom = 43,
        dad = 29,
        face_md_weight = 61,
        skin_md_weight = 27,
        nose_1 = -5,
        nose_2 = 6,
        nose_3 = 5,
        nose_4 = 8,
        nose_5 = 10,
        nose_6 = 0,
        cheeks_1 = 2,
        cheeks_2 = -10,
        cheeks_3 = 6,
        lip_thickness = -2,
        jaw_1 = 0,
        jaw_2 = 0,
        chin_1 = 0,
        chin_2 = 0,
        chin_13 = 0,
        chin_4 = 0,
        neck_thickness = 0,
        hair_1 = 76,
        hair_2 = 0,
        hair_color_1 = 61,
        hair_color_2 = 29,
        tshirt_1 = 4,
        tshirt_2 = 2,
        torso_1 = 23,
        torso_2 = 2,
        decals_1 = 0,
        decals_2 = 0,
        arms = 1,
        arms_2 = 0,
        pants_1 = 28,
        pants_2 = 3,
        shoes_1 = 70,
        shoes_2 = 2,
        mask_1 = 0,
        mask_2 = 0,
        bproof_1 = 0,
        bproof_2 = 0,
        chain_1 = 22,
        chain_2 = 2,
        helmet_1 = -1,
        helmet_2 = 0,
        glasses_1 = 0,
        glasses_2 = 0,
        watches_1 = -1,
        watches_2 = 0,
        bracelets_1 = -1,
        bracelets_2 = 0,
        bags_1 = 0,
        bags_2 = 0,
        eye_color = 0,
        eye_squint = 0,
        eyebrows_2 = 0,
        eyebrows_1 = 0,
        eyebrows_3 = 0,
        eyebrows_4 = 0,
        eyebrows_5 = 0,
        eyebrows_6 = 0,
        makeup_1 = 0,
        makeup_2 = 0,
        makeup_3 = 0,
        makeup_4 = 0,
        lipstick_1 = 0,
        lipstick_2 = 0,
        lipstick_3 = 0,
        lipstick_4 = 0,
        ears_1 = -1,
        ears_2 = 0,
        chest_1 = 0,
        chest_2 = 0,
        chest_3 = 0,
        bodyb_1 = -1,
        bodyb_2 = 0,
        bodyb_3 = -1,
        bodyb_4 = 0,
        age_1 = 0,
        age_2 = 0,
        blemishes_1 = 0,
        blemishes_2 = 0,
        blush_1 = 0,
        blush_2 = 0,
        blush_3 = 0,
        complexion_1 = 0,
        complexion_2 = 0,
        sun_1 = 0,
        sun_2 = 0,
        moles_1 = 0,
        moles_2 = 0,
        beard_1 = 11,
        beard_2 = 10,
        beard_3 = 0,
        beard_4 = 0
    },
    ["f"] = {
        mom = 28,
        dad = 6,
        face_md_weight = 63,
        skin_md_weight = 60,
        nose_1 = -10,
        nose_2 = 4,
        nose_3 = 5,
        nose_4 = 0,
        nose_5 = 0,
        nose_6 = 0,
        cheeks_1 = 0,
        cheeks_2 = 0,
        cheeks_3 = 0,
        lip_thickness = 0,
        jaw_1 = 0,
        jaw_2 = 0,
        chin_1 = -10,
        chin_2 = 10,
        chin_13 = -10,
        chin_4 = 0,
        neck_thickness = -5,
        hair_1 = 43,
        hair_2 = 0,
        hair_color_1 = 29,
        hair_color_2 = 35,
        tshirt_1 = 111,
        tshirt_2 = 5,
        torso_1 = 25,
        torso_2 = 2,
        decals_1 = 0,
        decals_2 = 0,
        arms = 3,
        arms_2 = 0,
        pants_1 = 12,
        pants_2 = 2,
        shoes_1 = 20,
        shoes_2 = 10,
        mask_1 = 0,
        mask_2 = 0,
        bproof_1 = 0,
        bproof_2 = 0,
        chain_1 = 85,
        chain_2 = 0,
        helmet_1 = -1,
        helmet_2 = 0,
        glasses_1 = 33,
        glasses_2 = 12,
        watches_1 = -1,
        watches_2 = 0,
        bracelets_1 = -1,
        bracelets_2 = 0,
        bags_1 = 0,
        bags_2 = 0,
        eye_color = 8,
        eye_squint = -6,
        eyebrows_2 = 7,
        eyebrows_1 = 32,
        eyebrows_3 = 52,
        eyebrows_4 = 9,
        eyebrows_5 = -5,
        eyebrows_6 = -8,
        makeup_1 = 0,
        makeup_2 = 0,
        makeup_3 = 0,
        makeup_4 = 0,
        lipstick_1 = 0,
        lipstick_2 = 0,
        lipstick_3 = 0,
        lipstick_4 = 0,
        ears_1 = -1,
        ears_2 = 0,
        chest_1 = 0,
        chest_2 = 0,
        chest_3 = 0,
        bodyb_1 = -1,
        bodyb_2 = 0,
        bodyb_3 = -1,
        bodyb_4 = 0,
        age_1 = 0,
        age_2 = 0,
        blemishes_1 = 0,
        blemishes_2 = 0,
        blush_1 = 0,
        blush_2 = 0,
        blush_3 = 0,
        complexion_1 = 0,
        complexion_2 = 0,
        sun_1 = 0,
        sun_2 = 0,
        moles_1 = 12,
        moles_2 = 8,
        beard_1 = 0,
        beard_2 = 0,
        beard_3 = 0,
        beard_4 = 0
    }
}

local ESX = nil

ESXClient = Class {}

local function getCharacterModel(character)
    if character.model then
        return character.model
    end

    return character.skin.sex == 1 and 'mp_f_freemode_01' or 'mp_m_freemode_01'
end

-- By ESX standards, you should only applying skin to your own playerPed. So we need a small workaround :P
-- https://github.com/esx-framework/esx_core/blob/85b340794ca0940bc99fc7d8f948fef0461e4857/%5Bcore%5D/skinchanger/client/main.lua#L149
local function setPedSkin(ped, skin)
    -- If there's an error simply don't apply
    pcall(function()
        local characterSkin = {}

        for k, v in pairs(skin) do
            characterSkin[k] = v
        end

        if skin ~= nil then
            for k, v in pairs(skin) do
                if k ~= 'sex' and k ~= 'mom' and k ~= 'dad' and k ~= 'face_md_weight' and k ~= 'skin_md_weight' and k ~=
                    'nose_1' and k ~= 'nose_2' and k ~= 'nose_3' and k ~= 'nose_4' and k ~= 'nose_5' and k ~= 'nose_6' and k ~=
                    'cheeks_1' and k ~= 'cheeks_2' and k ~= 'cheeks_3' and k ~= 'lip_thickness' and k ~= 'jaw_1' and k ~=
                    'jaw_2' and k ~= 'chin_1' and k ~= 'chin_2' and k ~= 'chin_3' and k ~= 'chin_4' and k ~=
                    'neck_thickness' and k ~= 'age_1' and k ~= 'age_2' and k ~= 'eye_color' and k ~= 'eye_squint' and k ~=
                    'beard_1' and k ~= 'beard_2' and k ~= 'beard_3' and k ~= 'beard_4' and k ~= 'hair_1' and k ~= 'hair_2' and
                    k ~= 'hair_color_1' and k ~= 'hair_color_2' and k ~= 'eyebrows_1' and k ~= 'eyebrows_2' and k ~=
                    'eyebrows_3' and k ~= 'eyebrows_4' and k ~= 'eyebrows_5' and k ~= 'eyebrows_6' and k ~= 'makeup_1' and k ~=
                    'makeup_2' and k ~= 'makeup_3' and k ~= 'makeup_4' and k ~= 'lipstick_1' and k ~= 'lipstick_2' and k ~=
                    'lipstick_3' and k ~= 'lipstick_4' and k ~= 'blemishes_1' and k ~= 'blemishes_2' and k ~= 'blemishes_3' and
                    k ~= 'blush_1' and k ~= 'blush_2' and k ~= 'blush_3' and k ~= 'complexion_1' and k ~= 'complexion_2' and
                    k ~= 'sun_1' and k ~= 'sun_2' and k ~= 'moles_1' and k ~= 'moles_2' and k ~= 'chest_1' and k ~=
                    'chest_2' and k ~= 'chest_3' and k ~= 'bodyb_1' and k ~= 'bodyb_2' and k ~= 'bodyb_3' and k ~= 'bodyb_4' then
                    characterSkin[k] = v
                end
            end
        end

        local face_weight = (characterSkin['face_md_weight'] / 100) + 0.0
        local skin_weight = (characterSkin['skin_md_weight'] / 100) + 0.0
        SetPedHeadBlendData(ped, characterSkin['mom'], characterSkin['dad'], 0, characterSkin['mom'],
            characterSkin['dad'], 0,
            face_weight, skin_weight, 0.0, false)

        SetPedFaceFeature(ped, 0, (characterSkin['nose_1'] / 10) + 0.0)                                      -- Nose Width
        SetPedFaceFeature(ped, 1, (characterSkin['nose_2'] / 10) + 0.0)                                      -- Nose Peak Height
        SetPedFaceFeature(ped, 2, (characterSkin['nose_3'] / 10) + 0.0)                                      -- Nose Peak Length
        SetPedFaceFeature(ped, 3, (characterSkin['nose_4'] / 10) + 0.0)                                      -- Nose Bone Height
        SetPedFaceFeature(ped, 4, (characterSkin['nose_5'] / 10) + 0.0)                                      -- Nose Peak Lowering
        SetPedFaceFeature(ped, 5, (characterSkin['nose_6'] / 10) + 0.0)                                      -- Nose Bone Twist
        SetPedFaceFeature(ped, 6, (characterSkin['eyebrows_5'] / 10) + 0.0)                                  -- Eyebrow height
        SetPedFaceFeature(ped, 7, (characterSkin['eyebrows_6'] / 10) + 0.0)                                  -- Eyebrow depth
        SetPedFaceFeature(ped, 8, (characterSkin['cheeks_1'] / 10) + 0.0)                                    -- Cheekbones Height
        SetPedFaceFeature(ped, 9, (characterSkin['cheeks_2'] / 10) + 0.0)                                    -- Cheekbones Width
        SetPedFaceFeature(ped, 10, (characterSkin['cheeks_3'] / 10) + 0.0)                                   -- Cheeks Width
        SetPedFaceFeature(ped, 11, (characterSkin['eye_squint'] / 10) + 0.0)                                 -- Eyes squint
        SetPedFaceFeature(ped, 12, (characterSkin['lip_thickness'] / 10) + 0.0)                              -- Lip Fullness
        SetPedFaceFeature(ped, 13, (characterSkin['jaw_1'] / 10) + 0.0)                                      -- Jaw Bone Width
        SetPedFaceFeature(ped, 14, (characterSkin['jaw_2'] / 10) + 0.0)                                      -- Jaw Bone Length
        SetPedFaceFeature(ped, 15, (characterSkin['chin_1'] / 10) + 0.0)                                     -- Chin Height
        SetPedFaceFeature(ped, 16, (characterSkin['chin_2'] / 10) + 0.0)                                     -- Chin Length
        SetPedFaceFeature(ped, 17, (characterSkin['chin_3'] / 10) + 0.0)                                     -- Chin Width
        SetPedFaceFeature(ped, 18, (characterSkin['chin_4'] / 10) + 0.0)                                     -- Chin Hole Size
        SetPedFaceFeature(ped, 19, (characterSkin['neck_thickness'] / 10) + 0.0)                             -- Neck Thickness

        SetPedHairColor(ped, characterSkin['hair_color_1'], characterSkin['hair_color_2'])                   -- Hair Color
        SetPedHeadOverlay(ped, 3, characterSkin['age_1'], (characterSkin['age_2'] / 10) + 0.0)               -- Age + opacity
        SetPedHeadOverlay(ped, 0, characterSkin['blemishes_1'], (characterSkin['blemishes_2'] / 10) + 0.0)   -- Blemishes + opacity
        SetPedHeadOverlay(ped, 1, characterSkin['beard_1'], (characterSkin['beard_2'] / 10) + 0.0)           -- Beard + opacity
        SetPedEyeColor(ped, characterSkin['eye_color'])                                                      -- Eyes color
        SetPedHeadOverlay(ped, 2, characterSkin['eyebrows_1'], (characterSkin['eyebrows_2'] / 10) + 0.0)     -- Eyebrows + opacity
        SetPedHeadOverlay(ped, 4, characterSkin['makeup_1'], (characterSkin['makeup_2'] / 10) + 0.0)         -- Makeup + opacity
        SetPedHeadOverlay(ped, 8, characterSkin['lipstick_1'], (characterSkin['lipstick_2'] / 10) + 0.0)     -- Lipstick + opacity
        SetPedComponentVariation(ped, 2, characterSkin['hair_1'], characterSkin['hair_2'], 2)                -- Hair
        SetPedHeadOverlayColor(ped, 1, 1, characterSkin['beard_3'], characterSkin['beard_4'])                -- Beard Color
        SetPedHeadOverlayColor(ped, 2, 1, characterSkin['eyebrows_3'], characterSkin['eyebrows_4'])          -- Eyebrows Color
        SetPedHeadOverlayColor(ped, 4, 2, characterSkin['makeup_3'], characterSkin['makeup_4'])              -- Makeup Color
        SetPedHeadOverlayColor(ped, 8, 1, characterSkin['lipstick_3'], characterSkin['lipstick_4'])          -- Lipstick Color
        SetPedHeadOverlay(ped, 5, characterSkin['blush_1'], (characterSkin['blush_2'] / 10) + 0.0)           -- Blush + opacity
        SetPedHeadOverlayColor(ped, 5, 2, characterSkin['blush_3']) ---@diagnostic disable-line
        SetPedHeadOverlay(ped, 6, characterSkin['complexion_1'], (characterSkin['complexion_2'] / 10) + 0.0) -- Complexion + opacity
        SetPedHeadOverlay(ped, 7, characterSkin['sun_1'], (characterSkin['sun_2'] / 10) + 0.0)               -- Sun Damage + opacity
        SetPedHeadOverlay(ped, 9, characterSkin['moles_1'], (characterSkin['moles_2'] / 10) + 0.0)           -- Moles/Freckles + opacity
        SetPedHeadOverlay(ped, 10, characterSkin['chest_1'], (characterSkin['chest_2'] / 10) + 0.0)          -- Chest Hair + opacity
        SetPedHeadOverlayColor(ped, 10, 1, characterSkin['chest_3']) ---@diagnostic disable-line

        if characterSkin['bodyb_1'] == -1 then
            SetPedHeadOverlay(ped, 11, 255, (characterSkin['bodyb_2'] / 10) + 0.0) -- Body Blemishes + opacity
        else
            SetPedHeadOverlay(ped, 11, characterSkin['bodyb_1'], (characterSkin['bodyb_2'] / 10) + 0.0)
        end

        if characterSkin['bodyb_3'] == -1 then
            SetPedHeadOverlay(ped, 12, 255, (characterSkin['bodyb_4'] / 10) + 0.0)
        else
            SetPedHeadOverlay(ped, 12, characterSkin['bodyb_3'], (characterSkin['bodyb_4'] / 10) + 0.0) -- Blemishes 'added body effect' + opacity
        end

        if characterSkin['ears_1'] == -1 then
            ClearPedProp(ped, 2)
        else
            SetPedPropIndex(ped, 2, characterSkin['ears_1'], characterSkin['ears_2'], 2) -- Ears Accessories
        end

        SetPedComponentVariation(ped, 8, characterSkin['tshirt_1'], characterSkin['tshirt_2'], 2)  -- Tshirt
        SetPedComponentVariation(ped, 11, characterSkin['torso_1'], characterSkin['torso_2'], 2)   -- torso parts
        SetPedComponentVariation(ped, 3, characterSkin['arms'], characterSkin['arms_2'], 2)        -- Arms
        SetPedComponentVariation(ped, 10, characterSkin['decals_1'], characterSkin['decals_2'], 2) -- decals
        SetPedComponentVariation(ped, 4, characterSkin['pants_1'], characterSkin['pants_2'], 2)    -- pants
        SetPedComponentVariation(ped, 6, characterSkin['shoes_1'], characterSkin['shoes_2'], 2)    -- shoes
        SetPedComponentVariation(ped, 1, characterSkin['mask_1'], characterSkin['mask_2'], 2)      -- mask
        SetPedComponentVariation(ped, 9, characterSkin['bproof_1'], characterSkin['bproof_2'], 2)  -- bulletproof
        SetPedComponentVariation(ped, 7, characterSkin['chain_1'], characterSkin['chain_2'], 2)    -- chain
        SetPedComponentVariation(ped, 5, characterSkin['bags_1'], characterSkin['bags_2'], 2)      -- Bag

        if characterSkin['helmet_1'] == -1 then
            ClearPedProp(ped, 0)
        else
            SetPedPropIndex(ped, 0, characterSkin['helmet_1'], characterSkin['helmet_2'], 2) -- Helmet
        end

        if characterSkin['glasses_1'] == -1 then
            ClearPedProp(ped, 1)
        else
            SetPedPropIndex(ped, 1, characterSkin['glasses_1'], characterSkin['glasses_2'], 2) -- Glasses
        end

        if characterSkin['watches_1'] == -1 then
            ClearPedProp(ped, 6)
        else
            SetPedPropIndex(ped, 6, characterSkin['watches_1'], characterSkin['watches_2'], 2) -- Watches
        end

        if characterSkin['bracelets_1'] == -1 then
            ClearPedProp(ped, 7)
        else
            SetPedPropIndex(ped, 7, characterSkin['bracelets_1'], characterSkin['bracelets_2'], 2) -- Bracelets
        end
    end)
end

function ESXClient:init()
    ESX = exports['es_extended']:getSharedObject()

    self.cachedCharacters = {}
    self.slots = nil

    if not ESX.GetConfig().Multichar then
        print('Multichar is disabled in ESX config!')
        return
    end

    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function(playerData, isNew, skin)
        if isNew then
            SendNUIMessage({ type = 'navigate', payload = '/' })
            SetNuiFocus(false, false)

            TriggerEvent('skinchanger:loadSkin', skin, function()
                TriggerEvent('esx_skin:openSaveableMenu', function()
                    TriggerServerEvent('esx_multicharacter:relog')
                    gStateMachine:change('idle', { transition = false })
                end)

                SetEntityHeading(PlayerPedId(), 180.0)
            end)

            return
        end

        local playerPed = PlayerPedId()
        local spawnCoords = playerData.coords or vector4(428.23, -984.28, 29.76, 3.5)

        TriggerEvent('skinchanger:loadSkin', skin)

        SetEntityCoordsNoOffset(playerPed, spawnCoords.xyz, false, false, false) ---@diagnostic disable-line
        SetEntityHeading(playerPed, spawnCoords.w)

        TriggerServerEvent('esx:onPlayerSpawn')
        TriggerEvent('esx:onPlayerSpawn')
        TriggerEvent('playerSpawned')
        TriggerEvent('esx:restoreLoadout')
    end)

    Citizen.CreateThread(function()
        while not ESX.PlayerLoaded do
            Citizen.Wait(100)

            if NetworkIsPlayerActive(PlayerId()) then
                ShutdownLoadingScreen()
                ShutdownLoadingScreenNui()
                TriggerEvent('esx:loadingScreenOff')

                RequestModel('mp_m_freemode_01')

                while not HasModelLoaded('mp_m_freemode_01') do
                    Wait(0)
                end

                exports.spawnmanager:spawnPlayer({
                    x = 0.0,
                    y = 0.0,
                    z = 0.0,
                    heading = 0.0,
                    model = 'mp_m_freemode_01',
                    skipFade = true
                }, function()
                    SetPedDefaultComponentVariation(PlayerPedId())
                    SetModelAsNoLongerNeeded('mp_m_freemode_01')
                    startGTAOMulticharacter()
                end)
                break
            end
        end
    end)
end

function ESXClient:fetchAndCacheCharacters()
    local p = promise.new()

    local onSetupCharactersEvent = nil
    onSetupCharactersEvent = RegisterNetEvent('esx_multicharacter:SetupUI', function(characters, slots)
        RemoveEventHandler(onSetupCharactersEvent)
        p:resolve({ characters = characters, slots = slots })
    end)

    TriggerServerEvent("esx_multicharacter:SetupCharacters")

    Citizen.Await(p)

    self.cachedCharacters = p.value ~= nil and p.value.characters or {}
    self.slots = p.value ~= nil and p.value.slots or 1

    for _, character in pairs(self.cachedCharacters) do
        character.model = getCharacterModel(character)
        character.skin = character.skin ~= nil and character.skin or DEFAULT_ESX_SKIN
        character.skin.sex = character.sex == 'f' and 1 or 0
    end
end

function ESXClient:getCharacters()
    self:fetchAndCacheCharacters()

    local characters = {}

    for _, character in pairs(self.cachedCharacters) do
        table.insert(characters, {
            identifier = character.id,
            name = string.format('%s %s', character.firstname, character.lastname),
            model = character.model,
        })
    end

    return characters
end

function ESXClient:getCreateCharacterFormStructure()
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

function ESXClient:onCharacterSpawn(character)
    setPedSkin(character.ped, self.cachedCharacters[character.identifier].skin)
end

function ESXClient:onCharacterSelect(character)
    TriggerServerEvent('esx_multicharacter:CharacterChosen', character.identifier, false)
end

function ESXClient:onCharacterCreate(character)
    local slot = self.slots

    for i = 1, self.slots do
        if not self.cachedCharacters[i] then
            slot = i
            break
        end
    end

    TriggerServerEvent('esx_multicharacter:CharacterChosen', slot, true)
    TriggerEvent('esx_identity:showRegisterIdentity')
end

function ESXClient:onCharacterDelete(character)
    TriggerServerEvent('esx_multicharacter:DeleteCharacter', character.identifier)
end

function ESXClient:destroy()
    stopGTAOMulticharacter()

    gFramework = nil
end
