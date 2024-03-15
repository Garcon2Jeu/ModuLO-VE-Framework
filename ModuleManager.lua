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
---- Loads multiple modules at once.
-- Requires:
---- modulesTable = table, each element must have a string key as its name. Can be a multidimensionnal table
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
