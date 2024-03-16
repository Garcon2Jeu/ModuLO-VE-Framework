---@class Module Class to include to another whencreating a new Module
---@field fieldNames table<string> holds every field of the Module
Module = Class()

---Constructor
---@param self Module|Modular
---@param def? table holds all parameters
function Module:init(def) end

---Sets fieldNames, used for unplugging Modules
---@param def table<string> holds every field of the Module
function Module:setFieldNames(def)
    self.fieldNames = def
end
