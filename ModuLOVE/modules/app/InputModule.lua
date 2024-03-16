---@class InputModule: Module
---@field keysPressed table
---@field canInput boolean
InputModule = Class { __includes = Module }

InputModule.fieldNames = {
    "keysPressed",
    "canInput"
}

function InputModule:init()
    self.keysPressed = {}
    self.canInput = true
end

---When a keypress is triggerred from "love.keypressed(key)" and if the field .canInput is true, <br>
---stores the pressed key in the field ".keysPressed" making it usable elsewhere.
--- Also returns ".canInput"
---@param key string key sent from "love.keypressed(key)"
---@return boolean canInput
function InputModule:pressKey(key)
    if self.canInput then
        self.keysPressed[key] = true
    end

    return self.canInput
end

---Returns whether requested key has been stored in ".keysPressed"
---@param key any
---@return boolean
function InputModule:keyPressed(key)
    return self.keysPressed[key]
end

---Resets ".keysPressed"
--- to place at the end of the "love.update()" process
function InputModule:flushKeys()
    self.keysPressed = {}
end

---Sets the ".canInput" field
---set to false to cut off keyboard input and vice versa
---@param bool boolean
function InputModule:enableInput(bool)
    self.canInput = bool
end
