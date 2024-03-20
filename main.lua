ModuleManager = require "ModuLOVE.ModuLÖVE"
ModuleManager:loadBundle {
    ["Coordinates"]  = CoordinatesModule,
    ["Dimensions"]   = DimensionsModule,
    ["AppManager"]   = AppManagerModule,
    ["Input"]        = InputModule,
    ["StateMachine"] = StateMachineModule,
    ["AssetManager"] = AssetsManagerModule
}

require "App"
App = App()
Assets = AssetsManagerModule()
Quads = QuadManagerModule()

local atlas = Assets:import("graphics", "pink_alien")
local setsOfQuads = Quads:getSetsOfQuads(atlas, 16, 20)

function love.load()
end

function love.update(dt)
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.draw(atlas, setsOfQuads[1])
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
