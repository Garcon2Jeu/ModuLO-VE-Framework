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
require "ModuLOVE.modules.app.QuadManagerModule"

---StateMachine
require "ModuLOVE.modules.stateMachine.StateMachineModule"
require "ModuLOVE.modules.stateMachine.State"

---Essentials
require "ModuLOVE.modules.essentials.CoordinatesModule"
require "ModuLOVE.modules.essentials.DimensionsModule"

---@class Image Drawable image type.
---@field getDimensions function
---@field getWidth function
---@field getHeight function
---@class Source represents audio you can play back.
---@class Font Defines the shape of characters that can be drawn onto the screen.


return ModuleManager()
