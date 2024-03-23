---@class ConsummableModule: Module Implements fields for making an Enity Consummable
---@field consummed boolean whether this Enity has been consummed or not
---@field onConsume function method to trigger when consummed
ConsummableModule = Class { __includes = Module }

ConsummableModule.fieldNames = {
    "consummed",
    "onConsume",
}

function ConsummableModule:init(def)
    self.consumed = false
    self.onConsume = def.onConsume
end
