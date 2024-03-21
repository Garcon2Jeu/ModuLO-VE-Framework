---@class AsymmetricModule : Module implements fields and method to change sprite facing direction when asymmetrical
---@field xOffset number offsets the sprite on the x axis
---@field yOffset number offsets the sprite on the y axis
---@field facingRight boolean if sprite is facing right side of the screen
AsymmetricModule = Class()

AsymmetricModule.fieldNames = {
    "xOffset",
    "facingRight"
}

---Initialises the AsymmetricModule
---@param def table
--- - .xOffset? = number offsets the sprite on the x axis
--- - .yOffset? = number offsets the sprite on the y axis
--- - .reverse? = boolean declare true if the original sprite is facing left
function AsymmetricModule:init(def)
    self.xOffset     = def.xOffset or 0
    self.yOffset     = def.yOffset or 0
    self.facingRight = true
    self.draw        = self.overrideDrawMethod(def.reverse)
end

function AsymmetricModule:isFacingRight()
    return self.facingRight
end

function AsymmetricModule:setFacingRight(bool)
    self.facingRight = bool
end

function AsymmetricModule:toggleFacingRight()
    self.facingRight = not self.facingRight
end

function AsymmetricModule.overrideDrawMethod(reverse)
    local right = reverse and -1 or 1
    local left = reverse and 1 or -1

    return function(self)
        love.graphics.draw(
            self.spriteSheet, self.quad,
            math.floor(self.x + self.xOffset),
            math.floor(self.y + self.yOffset),
            0,
            self.facingRight and right or left, 1,
            self.xOffset, self.yOffset
        )
    end
end
