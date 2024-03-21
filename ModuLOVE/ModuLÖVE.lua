---Libraries
---@class Class
Class = require "ModuLOVE.libraries.class"

---@class Timer
---@field every function
---@field remove function
Timer = require "ModuLOVE.libraries.knife.timer"
require "ModuLOVE.libraries.tableUtils"

---ModuLÖVE
require "ModuLOVE.ModuleManager"
require "ModuLOVE.Module"
require "ModuLOVE.Modular"

---Modules

---App
require "ModuLOVE.modules.app.AppManagerModule"
require "ModuLOVE.modules.app.InputModule"

---Assets
require "ModuLOVE.modules.assets.AssetsManagerModule"
require "ModuLOVE.modules.assets.QuadManagerModule"

---StateMachine
require "ModuLOVE.modules.stateMachine.StateMachineModule"
require "ModuLOVE.modules.stateMachine.State"

---Essentials
require "ModuLOVE.modules.essentials.CoordinatesModule"
require "ModuLOVE.modules.essentials.DimensionsModule"

--Texture
require "ModuLOVE.modules.texture.TextureModule"
require "ModuLOVE.modules.texture.AnimationModule"

---@class Image Drawable image type.
---@field getDimensions function
---@field getWidth function
---@field getHeight function
---@class Source represents audio you can play back.
---@class Font Defines the shape of characters that can be drawn onto the screen.
---@class Quad a quadrilateral (a polygon with four sides and four corners) with Texture coordinate information. comes from love.graphics.newQuad()


return ModuleManager()
