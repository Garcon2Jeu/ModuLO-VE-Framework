ModuleManager = require "ModuLOVE.ModuLÖVE"

ModuleManager:loadBundle {
    ["AppManager"]   = AppManagerModule,
    ["Input"]        = InputModule,
    ["StateMachine"] = StateMachineModule,
    ["AssetManager"] = AssetsManagerModule,
    ["QuadManager"]  = QuadManagerModule,
    ["Coordinates"]  = CoordinatesModule,
    ["Dimensions"]   = DimensionsModule,
    ["Texture"]      = TextureModule,
    ["Animation"]    = AnimationModule,
    ["Move"]         = MoveModule

}

require "App"
App = App()
Assets = AssetsManagerModule()
Quads = QuadManagerModule()

require "object"

local object = Object()


function love.load()
end

function love.update(dt)
    Timer.update(dt)

    if love.keyboard.isDown("right") then
        object:move(dt, "x")
    elseif love.keyboard.isDown("left") then
        object:move(dt, "x", -object.xSpeed)
    elseif love.keyboard.isDown("down") then
        object:move(dt, "y")
    elseif love.keyboard.isDown("up") then
        object:move(dt, "y", -object.ySpeed)
    end
    -- object:animate()
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    -- love.graphics.print(tostring(object.width))
    object:draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
