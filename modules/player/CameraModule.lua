---@class CameraModule : Module
---@field cameraScroll number
---@field cameraOffset number position of the camera's center point
CameraModule = Class { __includes = Module }

CameraModule.fieldNames = {
    "cameraScroll",
    "viewPort",
    "cameraOffset"
}

function CameraModule:init(def)
    self.cameraScroll = 0
    self.cameraOffset = def.cameraOffset
end

--- Updates Camera's X relative to a given X coordinate (player avatar) <br>
--- Camera follows referenceX if it pushes past cameraOffset and
--- stops if referenceX plus the difference between the screen's width and cameraOffset goes
--- further than the last tile's X plus its width
--- Allows going back and forth from start and end of the level
---@param referenceX number references which X coordinate the camera should follow
---@param screenWidth number
---@param levelWidth number width of current level's tileMap
function CameraModule:updateCamera(referenceX, screenWidth, levelWidth)
    if referenceX < self.cameraOffset then
        self.cameraScroll = 0
    elseif referenceX + (screenWidth - self.cameraOffset) >= levelWidth then
        self.cameraScroll = levelWidth - screenWidth
    else
        self.cameraScroll = math.floor(referenceX - self.cameraOffset)
    end
end

---Feeds the "love.graphics.translate()" method the inverted ".cameraScroll" field
function CameraModule:scrollCamera()
    love.graphics.translate(-self.cameraScroll, 0)
end

---Returns true if the given Entity's coordinates are within the camera's view
---@param entity Entity
---@return boolean
function CameraModule:isInView(entity)
    return entity.x >= self.cameraScroll
        and entity.x <= self.cameraScroll + VIRTUAL_WIDTH
        and entity.y >= 0
        and entity.y <= VIRTUAL_WIDTH
end
