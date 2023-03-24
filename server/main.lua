gFramework = nil

CreateThread(function()
    if isQBCore() then
        gFramework = QBServer()
    end

    if isESX() then
        gFramework = ESXServer()
    end
end)
