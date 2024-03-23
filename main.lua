ModuleManager = require "ModuLOVE.ModuLÖVE"

function love.load()
    App = App()
    Assets = AssetsManagerModule()
    Quads = QuadManagerModule()
    Object = Object()
    TileFoo = Tile()
end

function love.update(dt)
    Timer.update(dt)
    App:update()

    Object:update(dt)
    TileFoo:updateHitbox()

    if Object:collides(TileFoo) then
        Object.dy = 1
        Object.y = TileFoo.y + TileFoo.height + 5
        TileFoo:onConsume()
    end
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Object:draw()
    Object:drawBox()

    TileFoo:draw()
    TileFoo:drawPoints()

    love.graphics.print(tostring(Object:collides(TileFoo)))
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
