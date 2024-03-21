Object = Class { __includes = Modular }

local modules = {
    "Coordinates",
    "Dimensions",
    "Texture"
}

local def = {
    x = 0,
    y = 0,
    width = 16,
    height = 20,
    atlas = Assets:import("graphics", "pink_alien"),
}

def.frames = Quads:getSetsOfQuads(def.atlas, def.width, def.height)
def.quad = def.frames[1]

function Object:init()
    self:plugInBulk(modules, def)
end
