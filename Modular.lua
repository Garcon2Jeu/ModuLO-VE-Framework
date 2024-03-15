Modular = Class()

-- Description:
---- Plugs individual Module to self by adding all fields and methods
-- Requires:
---- moduleName = string, name of the Module
---- def = table, defines all parameters of the module's fields
function Modular:plug(moduleName, def)
    local module = ModuleManager:getModule(moduleName)

    ModuleManager.extractMethods(module, self)
    module.init(self, def)
    ModuleManager.updateModulesList(self, moduleName)
end

-- Description:
---- Plugs multiple Modules at once using the ":plug()" method
-- Requires:
---- def = table, defines all parameters of the module's fields.
---- Every field of all modules must be different because all parameters are mixed together
---- modulesNames = table, name of the Modules requested
function Modular:plugInBulk(def, modulesNames)
    for key, moduleName in pairs(modulesNames) do
        self:plug(moduleName, def)
    end
end

-- Description:
---- If object has requested Module, returns its index value in the ".modules" table
---- Else if the ".modules" table or object does not have requested Module, returns false
-- Requires:
---- moduleName = string, name of the Module
function Modular:findModule(moduleName)
    return self.modules and table.indexOfValue(self.modules, moduleName)
end

-- Description:
---- Unplugs requested Module
---- Warning! Doesn't remove fields, only "nils" their value
---- (before: object.key = "value" -> after: object.key = nil)
-- Requires:
---- moduleName = string, name of the Module
function Modular:unplug(moduleName)
    for key, value in pairs(ModuleManager:getModule(moduleName)) do
        self[key] = nil
    end

    for key, value in pairs(ModuleManager:getModule(moduleName).fieldNames) do
        self[value] = nil
    end

    table.removeByValue(self.modules, moduleName)
end

-- Description:
---- Unplugs multiple Modules at once using the ":unplug()" method
-- Requires:
---- modulesNames = table, name of the Modules requested
function Modular:unplugInBulk(moduleNames)
    for key, moduleName in pairs(moduleNames) do
        self:unplug(moduleName)
    end
end
