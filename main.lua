ModuleManager = require "ModuLOVE.ModuLÖVE"
ModuleManager:loadBundle {
    ["Coordinates"] = CoordinatesModule,
    ["Dimensions"] = DimensionsModule,
    ["AppManager"] = AppManagerModule
}

require "App"
App = App()

function love.load()
end

function love.draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    -- love.graphics.print(tostring(), 50, 50)
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
end
