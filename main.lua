-- ModuleManager = require "ModuLÖVE"
require "ModuLÖVE"
ModuleManager = ModuleManager()
ModuleManager:load("Coordinates", CoordinatesModule)

function love.load()
end

function love.draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(table.count(ModuleManager.modules)), 50, 50)
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
end
