ModuleManager = require "ModuLOVE.ModuLÖVE"
ModuleManager:loadBundle {
    ["Coordinates"] = CoordinatesModule,
    ["Dimensions"] = DimensionsModule,
    ["AppManager"] = AppManagerModule,
    ["Input"] = InputModule,
}

require "App"
App = App()

function love.load()
end

function love.update(dt)
    App:update()

    App:flushKeys()
end

function love.draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(App.pressKey), 50, 50)
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
end

function love.keypressed(key)
    App:pressKey(key)
end
