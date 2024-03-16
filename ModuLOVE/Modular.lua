---@class Modular Class for a Modular Object
---@field modules table<string> names of plugged Modules
Modular = Class()

---Plugs individual Module to self by adding all fields and methods
---@param moduleName string name of the Module
---@param def? table defines all parameters of the module's fields
function Modular:plug(moduleName, def)
    local module = ModuleManager:getModule(moduleName)

    ModuleManager.extractMethods(module, self)
    module.init(self, def)
    ModuleManager.updateModulesList(self, moduleName)
end

---Plugs multiple Modules at once using the ":plug()" method
---@param modulesNames table name of the Modules requested
---@param def? table defines all parameters of the module's fields. <br>
---Every field of all modules must be different because all parameters are mixed together
function Modular:plugInBulk(modulesNames, def)
    for key, moduleName in pairs(modulesNames) do
        self:plug(moduleName, def)
    end
end

--- If object has requested Module, returns its index value in the ".modules" table. <br>
--- Else if the ".modules" table or object does not have requested Module, returns false
---@param moduleName string name of the Module
---@return boolean|integer
function Modular:findModule(moduleName)
    return self.modules and table.indexOfValue(self.modules, moduleName)
end

---Unplugs requested Module <br>
---Warning! Doesn't remove fields, only "nils" their value <br>
---(before: object.key = "value" -> after: object.key = nil)
---@param moduleName string name of the Module
function Modular:unplug(moduleName)
    for key, value in pairs(ModuleManager:getModule(moduleName)) do
        self[key] = nil
    end

    for key, value in pairs(ModuleManager:getModule(moduleName).fieldNames) do
        self[value] = nil
    end

    table.removeByValue(self.modules, moduleName)
end

---Unplugs multiple Modules at once using the ":unplug()" method
---@param moduleNames table name of the Modules requested
function Modular:unplugInBulk(moduleNames)
    for key, moduleName in pairs(moduleNames) do
        self:unplug(moduleName)
    end
end
