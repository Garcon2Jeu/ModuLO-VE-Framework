---@class TextureModule implements the fields and methods for objects with an atlas/spritesheet and/or a quad
---@field atlas Image
---@field quad Quad
---@field r number Orientation (radians).
---@field sx number Scale factor (x-axis).
---@field sy number Scale factor (y-axis).
---@field ox number Origin offset (x-axis).
---@field oy number Origin offset (y-axis).
---@field kx number Shearing factor (x-axis).
---@field ky number Shearing factor (y-axis).
---@see https://love2d.org/wiki/love.graphics.draw
TextureModule = Class { __includes = Module }


TextureModule.fieldNames = {
    "spriteSheet",
    "quad"
}


function TextureModule:init(def)
    self.atlas = def.atlas

    self.r     = def.r or 0
    self.sx    = def.sx or 1
    self.sy    = def.sy or self.sx
    self.ox    = def.ox or 0
    self.oy    = def.oy or 0
    self.kx    = def.kx or 0
    self.ky    = def.ky or 0

    if def.quad then
        self.quad = def.quad
        self.draw = self:overrideDraw()
    end
end

function TextureModule:setAtlas(atlas)
    self.atlas = atlas
end

function TextureModule:getAtlas()
    return self.atlas
end

function TextureModule:setQuad(quad)
    self.quad = quad
end

function TextureModule:getQuad()
    return self.quad
end

---Default rendering method for objects without quads
function TextureModule:draw()
    love.graphics.draw(
        self.atlas,
        self.x, self.y,
        self.r,
        self.sx, self.sy,
        self.ox, self.oy,
        self.kx, self.ky
    )
end

---Overrides the draw method to include quad
---@return function draw
function TextureModule:overrideDraw()
    return function()
        love.graphics.draw(
            self.atlas, self.quad,
            self.x, self.y,
            self.r,
            self.sx, self.sy,
            self.ox, self.oy,
            self.kx, self.ky
        )
    end
end

-- function TextureModule.getDefaultDef()
--     return TextureModule.defaultDef
-- end
