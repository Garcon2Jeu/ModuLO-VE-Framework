Object = Class { __includes = Modular }

local modules = {
    "Coordinates",
    "Dimensions",
    "Texture",
    "Animation",
    "Move"
}

local def = {
    x = 0,
    y = 0,
    width = 16,
    height = 20,
    atlas = Assets:import("graphics", "pink_alien"),
    interval = .3,
    xSpeed = 200,
    ySpeed = 200
}

def.set = Quads:getSetsOfQuads(def.atlas, def.width, def.height)
def.quad = def.set[1]
def.frames = { def.set[2], def.set[3] }

function Object:init()
    self:plugInBulk(modules, def)
end
