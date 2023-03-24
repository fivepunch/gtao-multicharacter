ESXServer = Class {}

local REQUIRED_RESOURCES = { 'skinchanger', 'esx_skin', 'esx_identity' }

local function runEnvironmentCheck()
    for _, required in pairs(REQUIRED_RESOURCES) do
        if not hasResource(required) then
            return nil,
                ("%s is missing in your server. This resource doesn't support custom ESX setups"):format(required)
        end
    end

    return true
end

function ESXServer:init()
    -- This verifies if your environment satisfies this resource requirements.
    -- If you wish to adapt this resource to suit your needs, you can safely comment this.
    if assert(runEnvironmentCheck()) then
        print('^2ESX environment check successfull!')
    end
end
