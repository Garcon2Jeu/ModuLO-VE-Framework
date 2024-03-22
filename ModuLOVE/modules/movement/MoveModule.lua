---@class DeltaModule: Module implements fields and methods to influence object's Coordinates along the x and y axis
---@field xSpeed number incremental velocity on the x axis
---@field dx number delta value for the x axis
---@field dxForce number constant velocity for dx
---@field dxPush number incremental velocity for dx
---@field ySpeed number incremental velocity on the y axis
---@field dy number delta value for the y axis
---@field dyForce number constant velocity for dy
---@field dyPush number incremental velocity for dy

DeltaModule = Class { __includes = Module }

DeltaModule.fieldNames = {
    "xSpeed",
    "dx",
    "dxForce",
    "dxPush",
    "ySpeed",
    "dy",
    "dyForce",
    "dyPush",
}

function DeltaModule:init(def)
    self.xSpeed  = def.xSpeed or 0
    self.dx      = 0
    self.dxForce = def.dxForce or 0
    self.dxPush  = def.dxPush or 0

    self.ySpeed  = def.ySpeed or 0
    self.dy      = 0
    self.dyForce = def.dyForce or 0
    self.dyPush  = def.dyPush or 0
end

---Increments axis value by adding speed times deltaTime. <br>
---Use this to make object move at a constant speed, like walking or running.
---@param dt number DeltaTime.
---@param axis string "x" or "y".
---@param customSpeed? number overrides default Speed for this axis.
---(can be used for reversing object speed or increasing it, <br>
--- ex: -object.xSpeed or object.xSpeed * 2)
--- - (ex: <br>
--- if love.keyboard.isDown("right") then <br>
--- object:applySpeed(dt, "x") <br>
--- end)
function DeltaModule:applySpeed(dt, axis, customSpeed)
    self[axis] = self[axis] + (customSpeed or self[axis .. "Speed"]) * dt
end

---Applies a current Delta value to an axis (ex: "dx" or the x axis)
---To be used during the "love.update(dt)" step
---@param axis string x or y
function DeltaModule:applyDelta(axis)
    self[axis] = self[axis] + self["d" .. axis]
end

---Whe used repeatedly, applies constant force on object (ex: gravity) <br>
---Increments axis' Delta value by adding force times deltaTime
--- To be used during the "love.update(dt)" step and before the ":applySpeed()" method.
---@param dt number deltaTime
---@param axis string x or y
---@param customForce? number overrides default Force value for this axis.
function DeltaModule:applyForce(dt, axis, customForce)
    self["d" .. axis] = self["d" .. axis] + (customForce or self["d" .. axis .. "Force"]) * dt
end

---Applies Push value to current axis' Delta value, to be used with the ":applySpeed()" method <br>
---Use this alone to make object move on its own at a constant speed, like glidding, <br>
---or in tandem with the ":applyForce()" method for a push against a force<br>
---(ex: an upward Push against a downward Force = jump)
---@param axis string x or y
---@param customPush? number overrides default Push value for this axis.
function DeltaModule:applyPush(axis, customPush)
    self["d" .. axis] = self["d" .. axis] + (customPush or self["d" .. axis .. "Push"])
end
