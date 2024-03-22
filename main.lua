ModuleManager = require "ModuLOVE.ModuLÖVE"

function love.load()
    App = App()
    Assets = AssetsManagerModule()
    Quads = QuadManagerModule()
    Object = Object()
end

function love.update(dt)
    Timer.update(dt)
    Object:update(dt)
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(Object.x))
    love.graphics.print(tostring(Object.dx), 0, 50)
    Object:draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
