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


function love.load()

end

function love.update(dt)
    App:update()
    App:flushKeys()
end

function love.draw()
    Push:start()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    -- love.graphics.print(tostring(table.count(States.states)), 50, 70)
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    Push:finish()
end

function love.keypressed(key)
    App:pressKey(key)
end
