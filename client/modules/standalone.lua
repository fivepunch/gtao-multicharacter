StandaloneClient = Class {}

function StandaloneClient:init()
    self.cachedCharacters = {
        { identifier = 1, name = 'Character 1', model = 'player_zero' },
        { identifier = 2, name = 'Character 2', model = 'mp_m_freemode_01' },
        { identifier = 3, name = 'Character 3', model = 's_m_m_movspace_01' },
        { identifier = 4, name = 'Character 4', model = 'u_m_y_zombie_01' },
        { identifier = 5, name = 'Character 5', model = 'player_one' },
        { identifier = 6, name = 'Character 6', model = 'a_m_y_skater_01' },
        { identifier = 7, name = 'Character 7', model = 'csb_chef' },
        { identifier = 8, name = 'Character 8', model = 'mp_f_cocaine_01' },
    }
end

function StandaloneClient:getCharacters()
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

function StandaloneClient:onCharacterSpawn(character)
    print('Character ' .. character.name .. ' spawned!')
end
