Class = require "libraries.class"

ModuleManager = Class()

function ModuleManager:init()
    self.modules = {}
end

-- Description:
---- Loads single Module into ModuleManager, to use for all Modules intended in the project.
-- Requires:
---- modulesName = string, name of the Module.
---- moduleClass = class, un-instanciated.
function ModuleManager:load(moduleName, moduleClass)
    self.modules[moduleName] = function() return moduleClass end
end

-- Description:
---- Recursively loads multiple modules at once.
-- Requires:
---- modulesTable = table, each element must have a string key as its name.
-- Optionnal:
function ModuleManager:loadBundle(modulesTable)
    for moduleName, moduleClass in pairs(modulesTable) do
        if type(moduleName) == "string" then
            self:load(moduleName, moduleClass)
        else
            self:loadBundle(moduleClass)
        end
    end
end

-- Description:
---- DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class
---- Extracts methods from one class to targeted class.
-- Requires:
---- from = class, from where the method are extracted
---- to = class, where the methods will be stored
-- Optionnal:
function ModuleManager.extractMethods(from, to)
    for key, value in pairs(from) do
        to[key] = to[key] or value
    end
end

-- Description:
---- DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class
---- Creates if necessary the ".modules" table and adds the names of the Module currently being plugged
-- Requires:
---- object = instanciated object, in which the ".modules" table will be create and/or updated
---- moduleName = string, name of the Module
-- Optionnal:
function ModuleManager.updateModulesList(object, moduleName)
    object.modules = object.modules or {}
    table.insert(object.modules, moduleName)
end

-- Description:
---- DO NOT USE this method on its own, it is wrapped in the :plug() method in the Modular class
---- Asserts the requested Module in the ".modules" table and returns it
-- Requires:
----
-- Optionnal:
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
