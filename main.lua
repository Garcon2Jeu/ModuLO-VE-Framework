ModuleManager = require "ModuLÖVE"
ModuleManager:loadBundle {
    ["Coordinates"] = CoordinatesModule,
    ["Dimensions"] = DimensionsModule,
}

local T = Class { __includes = Modular }

function T:init()
    -- self:plug("Coordinates", { x = 6748, y = 0 })
    local def = {
        x = 6748,
        y = 0,
        width = 16,
        height = 20
    }

    self:plugInBulk(def, { "Coordinates", "Dimensions" })
end

local t = T()
t:unplugInBulk { "Dimensions" }

function love.load()
end

function love.draw()
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
    love.graphics.print(tostring(t.width), 50, 50)
    love.graphics.print(tostring(t.x), 50, 70)
    ------------------------------------------------------DEBUG-------------------------------------------------------------------
end
