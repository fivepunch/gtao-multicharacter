function hasResource(resourceName)
    local state = GetResourceState(resourceName)

    return state == 'started' or state == 'starting'
end

function isQBCore()
    return hasResource('qb-core')
end

function isVRP()
    return hasResource('vrp')
end

function isESX()
    return hasResource('esx')
end
