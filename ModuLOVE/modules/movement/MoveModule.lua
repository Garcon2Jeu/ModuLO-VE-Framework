---@class MoveModule: Module implements fields and methods to influence object's Coordinates along the x and y axis
MoveModule = Class { __includes = Module }

MoveModule.fieldNames = {
    "dx",
    "running"
}


function MoveModule:init(def)
    --x
    self.xSpeed     = def.xSpeed or 0
    self.dx         = 0
    self.dxForce    = def.dxForce or 0
    self.dxFriction = def.dxFriction or 0

    --y
    self.ySpeed     = def.ySpeed or 0
    self.dy         = 0
    self.dyForce    = def.dyForce or 0
    self.dyFriction = def.dyFriction or 0
end

function MoveModule:move(dt, axis, speed)
    if axis == "x" then
        self.x = self.x + (speed or self.xSpeed) * dt
    elseif axis == "y" then
        self.y = self.y + (speed or self.ySpeed) * dt
    end
end
