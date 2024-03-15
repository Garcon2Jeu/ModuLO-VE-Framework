ModuleManager = require "ModuLÖVE"
ModuleManager:loadBundle({
    {
        ["Coordinates"] = CoordinatesModule,
        ["Coordinates2"] = CoordinatesModule
    },
    {
        ["Coordinates3"] = CoordinatesModule,
        ["Coordinates4"] = CoordinatesModule
    }
})

local t = {}

for name, module in pairs(ModuleManager.modules) do
    table.insert(t, name)
end

function love.load()
end

function love.draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    local y = 10
    for name, module in pairs(ModuleManager.modules) do
        love.graphics.print(tostring(name), 50, y)
        y = y + 15
    end
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
end
