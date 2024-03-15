Class = require "libraries.class"

ModuleManager = Class()

function ModuleManager:init()
    self.modules = {}
end

function ModuleManager:load(moduleName, moduleClass)
    self.modules[moduleName] = function() return moduleClass end
end
