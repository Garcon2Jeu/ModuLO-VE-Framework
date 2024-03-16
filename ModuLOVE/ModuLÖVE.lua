---Libraries
Class = require "ModuLOVE.libraries.class"
require "ModuLOVE.libraries.tableUtils"

---ModuLÖVE
require "ModuLOVE.ModuleManager"
require "ModuLOVE.Module"
require "ModuLOVE.Modular"

---Modules

---App
require "ModuLOVE.modules.app.AppManagerModule"
require "ModuLOVE.modules.app.InputModule"

---StateMachine
require "ModuLOVE.modules.StateMachine.StateMachineModule"
require "ModuLOVE.modules.StateMachine.State"

---Essentials
require "ModuLOVE.modules.CoordinatesModule"
require "ModuLOVE.modules.DimensionsModule"



return ModuleManager()
