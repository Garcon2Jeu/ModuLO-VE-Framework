ModuleManager = require "ModuLOVE.ModuLÖVE"
ModuleManager:loadBundle {
    ["Coordinates"]  = CoordinatesModule,
    ["Dimensions"]   = DimensionsModule,
    ["AppManager"]   = AppManagerModule,
    ["Input"]        = InputModule,
    ["StateMachine"] = StateMachineModule,
}

require "App"
App = App()
Assets = AssetsManagerModule()
local font = Assets:import("fonts", "fipps", "otf")

function love.load()

end

function love.update(dt)
    App:update()

    if App:keyPressed("space") then
        sound:play()
    end

    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    -- love.graphics.print(tostring(assets:load("graphics", "tiles")), 50, 70)

    love.graphics.setFont(font)
    love.graphics.print("test")
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
