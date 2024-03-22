---@class CoordinatesModule: Module implements the fields and methods for objects with x and y axis
---@field x number
---@field y number
CoordinatesModule = Class { __includes = Module }

CoordinatesModule.fieldNames = {
    "x",
    "y",
}

function CoordinatesModule:init(def)
    self.x = def.x or 0
    self.y = def.y or 0
end

function CoordinatesModule:setX(x)
    self.x = x
end

function CoordinatesModule:getX()
    return self.x
end

function CoordinatesModule:setY(y)
    self.y = y
end

function CoordinatesModule:getY()
    return self.y
end
