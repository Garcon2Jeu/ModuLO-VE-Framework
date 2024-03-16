---Libraries
Class = require "ModuLOVE.libraries.class"
Push = require "ModuLOVE.libraries.push"
require "ModuLOVE.libraries.tableUtils"

---ModuLÖVE
require "ModuLOVE.ModuleManager"
require "ModuLOVE.Module"
require "ModuLOVE.Modular"

---Modules

---App
require "ModuLOVE.modules.app.AppManagerModule"
require "ModuLOVE.modules.app.InputModule"

---Essentials
require "ModuLOVE.modules.CoordinatesModule"
require "ModuLOVE.modules.DimensionsModule"

return ModuleManager()
