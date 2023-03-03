gFramework = nil

CreateThread(function()
    if isQBCore() then
        gFramework = QBServer()
    end
end)
