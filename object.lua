Object = Class { __includes = Modular }

local modules = {
    "Coordinates",
    "Dimensions",
    "Texture",
    "Animation",
    "Delta"
}

local def = {
    x = 50,
    y = 0,

    width = 16,
    height = 20,

    atlas = Assets:import("graphics", "pink_alien"),
    interval = .3,

    xSpeed = 200,
    dxForce = 10,
    dxPush = 3,

    ySpeed = 200,
    dyForce = 20,
    dyPush = 4
}

def.set = Quads:getSetsOfQuads(def.atlas, def.width, def.height)
def.quad = def.set[1]
def.frames = { def.set[2], def.set[3] }

function Object:init()
    self:plugInBulk(modules, def)
end

function Object:update(dt)
    self:dash(dt)
    self:jump(dt)
    self:move(dt)
end

function Object:move(dt)
    if love.keyboard.isDown("right") then
        self:applySpeed(dt, "x")
    elseif love.keyboard.isDown("left") then
        self:applySpeed(dt, "x", -self.xSpeed)
    elseif love.keyboard.isDown("down") then
        self:applySpeed(dt, "y")
    elseif love.keyboard.isDown("up") then
        self:applySpeed(dt, "y", -self.ySpeed)
    end
end

function Object:dash(dt)
    if App:keyPressed("d") and self.dx < self.dxPush / 2 then
        self:applyPush("x")
    end

    if self.dx > 0 then
        self:applyForce(dt, "x", -self.dxForce)
    elseif self.dx < 0 then
        self.dx = 0
    end

    self:applyDelta("x")
end

function Object:jump(dt)
    if App:keyPressed("space") then
        self:applyPush("y", -self.dyPush)
    end

    self:applyForce(dt, "y")
    self:applyDelta("y")

    if self.y + self.height > VIRTUAL_HEIGHT / 2 then
        self.dy = 0
        self.y = VIRTUAL_HEIGHT / 2 - self.height
    end
end
