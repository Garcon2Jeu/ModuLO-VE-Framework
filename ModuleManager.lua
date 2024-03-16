---@class ModuleManager Manages loaded Modules
---@field modules table<string> Lists all loaded modules
ModuleManager = Class()

---comment
function ModuleManager:init()
    self.modules = {}
end

---Loads single Module into ModuleManager, to use for all Modules intended in the project.
---@param moduleName string name of the Module.
---@param moduleClass Module un-instanciated. @source ModuLÖVE.lua
function ModuleManager:load(moduleName, moduleClass)
    self.modules[moduleName] = function() return moduleClass end
end

---Recursively loads multiple modules at once.
---@param modulesTable table<string, Module> Table of moduleClasses with their name as keys
function ModuleManager:loadBundle(modulesTable)
    for moduleName, moduleClass in pairs(modulesTable) do
        if type(moduleName) == "string" then
            self:load(moduleName, moduleClass)
        else
            self:loadBundle(moduleClass)
        end
    end
end

---DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class <br>
---Extracts methods from one class to targeted class.
---@param from Module from where the method are extracted
---@param to Modular where the methods will be stored
function ModuleManager.extractMethods(from, to)
    for key, value in pairs(from) do
        to[key] = to[key] or value
    end
end

--- DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class <br>
--- Creates if necessary the ".modules" table and adds the names of the Module currently being plugged
---@param modular Modular instanciated object, in which the ".modules" table will be create and/or updated
---@param moduleName string name of the Module
function ModuleManager.updateModulesList(modular, moduleName)
    modular.modules = modular.modules or {}
    table.insert(modular.modules, moduleName)
end

---DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class <br>
---Asserts the requested Module in the ".modules" table and returns it
---@param moduleName string name of the Module
---@return Module moduleClass un-instanciated. @source ModuLÖVE.lua
function ModuleManager:getModule(moduleName)
    assert(self.modules[moduleName])
    return self.modules[moduleName]()
end

-- function Modular:find(object, moduleName)
--     if not object or not object.modules then
--         return false
--     end

--     return table.indexOfValue(object.modules, moduleName)
-- end
