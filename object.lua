Object = Class { __includes = Modular }

local modules = {
    "Coordinates",
    "Dimensions",
    "Texture",
    "Animation"
}

local def = {
    x = 0,
    y = 0,
    width = 16,
    height = 20,
    atlas = Assets:import("graphics", "pink_alien"),
    interval = .3,
}

def.set = Quads:getSetsOfQuads(def.atlas, def.width, def.height)
def.quad = def.quadLibrary
def.frames = { def.quadLibrary[2], def.quadLibrary[3] }

function Object:init()
    self:plugInBulk(modules, def)
end
