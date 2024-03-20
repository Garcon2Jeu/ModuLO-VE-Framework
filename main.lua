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

-- local quad = QuadManagerModule.getSet(atlas, 16, 20, Quads.getQuadCoordinates(0, 0, 11, 1, 16, 20))

local tile = { width = 16, height = 20 }
local set = { x = 0, y = 0, columns = 11, rows = 1 }
local quad = Quads:cutSet(atlas, tile, set)

-- local quad = Quads:cutSet(atlas, tiles, set)

function love.load()
end

function love.update(dt)
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    -- love.graphics.print(tostring(quad[5].x), 50, 70)
    love.graphics.draw(atlas, quad[11])
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
