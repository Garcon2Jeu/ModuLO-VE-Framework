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
    ["Delta"]        = DeltaModule

}

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 256
VIRTUAL_HEIGHT = 144

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

    object:update(dt)
    -- object:animate()
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(object.x))
    love.graphics.print(tostring(object.dx), 0, 50)
    object:draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
