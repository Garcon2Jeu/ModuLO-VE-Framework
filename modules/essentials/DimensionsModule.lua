---@class DimensionsModule: Module implements the fields and methods for objects with width and height
---@field width number
---@field height number
DimensionsModule = Class { __includes = Module }

DimensionsModule.fieldNames = {
    "width",
    "height"
}

function DimensionsModule:init(def)
    self.width = def.width or 0
    self.height = def.height or 0
end

function DimensionsModule:setWidth(width)
    self.width = width
end

function DimensionsModule:getWidth()
    return self.width
end

function DimensionsModule:setHeight(height)
    self.height = height
end

function DimensionsModule:getHeight()
    return self.height
end
