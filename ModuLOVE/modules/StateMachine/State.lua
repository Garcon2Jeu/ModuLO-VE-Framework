---@class State State template, acts as an empty base state when enabling the StateMachine
---@field stateName string name of the State without the "State" suffix
State = Class()

-- This class acts a template.
-- When creating new States, you can paste this file into a new one,
-- erase everything above and including this block of comments,
-- un-comment the one below and complete the informations.
-- Don't forget to complete the fields and methods annotations as you use them!

-- ---@class StateName State description here
-- ---@field stateName string name of the State without the "State" suffix
-- StateName = Class { __includes = State }
State.stateName = "base"

---Constructor of the State, will be triggered first when loaded
function State:init() end

---Will be triggered directly after being called
function State:enter() end

--Will be triggered if called during the "love.update(dt)" process
function State:update(dt) end

--Will be triggered if called during the "love.draw()" process
function State:draw() end

--Will be triggered last if current State gets changed
function State:exit() end

---Sets stateName
---@param stateName string
function State:setStateName(stateName)
    self.stateName = stateName
end

---Returns StateName
---@return string
function State:getCurrentStateName()
    return self.stateName
end
