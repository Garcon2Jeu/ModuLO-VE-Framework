ModuleManager = require "ModuLOVE.ModuLÖVE"

ModuleManager:loadBundle {
    ["AppManager"]   = AppManagerModule,
    ["Input"]        = InputModule,
    ["StateMachine"] = StateMachineModule,
    ["AssetManager"] = AssetsManagerModule,
    ["QuadManager"]  = QuadManagerModule,
    ["Coordinates"]  = CoordinatesModule,
    ["Dimensions"]   = DimensionsModule,
    ["Texture"]      = TextureModule

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
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(object.width))
    object:draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
