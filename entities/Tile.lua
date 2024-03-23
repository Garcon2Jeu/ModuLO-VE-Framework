Tile = Class { __includes = Modular }

local modules = {
    "Coordinates",
    "Dimensions",
    "Texture",
    "Hitbox",
    "Consummable"
}

local def = {
    x = 120,
    y = 25,
    width = 16,
    height = 16,
    setRows = 10,
    setColumns = 6
}

function Tile:init()
    def.atlas     = Assets:import("graphics", "tiles")
    def.set       = Quads:getSetsOfQuads(def.atlas, def.width, def.height, def.setRows, def.setColumns)
    def.quad      = def.set[1][3]
    def.onConsume = self:getOnConsume()

    self:plugInBulk(modules, def)
end

function Tile:getOnConsume()
    return function()
        if self.consumed then
            self.quad = self.set[9][3]
        else
            self.quad = self.set[1][3]
        end
        self.consumed = not self.consumed
    end
end
