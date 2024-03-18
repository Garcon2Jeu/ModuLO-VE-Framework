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
require "ModuLOVE.modules.app.AssetsManagerModule"

---StateMachine
require "ModuLOVE.modules.StateMachine.StateMachineModule"
require "ModuLOVE.modules.StateMachine.State"

---Essentials
require "ModuLOVE.modules.CoordinatesModule"
require "ModuLOVE.modules.DimensionsModule"

---@class Image Drawable image type.
---@class Source represents audio you can play back.
---@class Font Defines the shape of characters that can be drawn onto the screen.


return ModuleManager()
