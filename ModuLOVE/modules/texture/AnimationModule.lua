---@class AnimationModule :Module implements basic animation fields and methods using the kinfe.Timer Librairie
--- requires the TextureModule
---@field frames Quad[] array holding all frames (quads) of one animation through which the frameIndex will cycle
---@field frameIndex number references the current frame of animation
---@field timer Timer
AnimationModule = Class()

AnimationModule.fieldNames = {
    "frames",
    "frameIndex",
    "timer"
}

---Initialises an Animation
---@param def table holds
--- - .frames = Quad[] array holding all frames (quads) of one animation through which the frameIndex will cycle
--- - .frameIndex = number references the current frame of animation
--- - .interval? = number frequence of frame changing
--- - .customAnimation = function overrides the default animation method
function AnimationModule:init(def)
    self.frames = def.frames
    self.frameIndex = def.frameIndex or 1
    self.timer = Timer.every(def.interval, def.customAnimation or self:defaultAnimation())
end

---Default Animation method. Alternates between all provided frames in self.frames at given interval
---@return function defaultAnimation
function AnimationModule:defaultAnimation()
    return function()
        self.frameIndex = self.frameIndex + 1 <= #self.frames
            and self.frameIndex + 1 or 1
    end
end

---Returns a quad in the frames field at the frameIndex
---@return Quad frame
function AnimationModule:getCurrentFrame()
    return self.frames[self.frameIndex]
end

---Cheat-sheet method to remember to remove the timer when changing State
function AnimationModule:removeTimer()
    self.timer:remove()
end

-- function AnimationModule:animate()
--     self:setQuad(self:getCurrentFrame())
-- end
