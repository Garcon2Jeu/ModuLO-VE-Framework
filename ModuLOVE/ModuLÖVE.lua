require "libraries.librariesIndex"

---ModuLÖVE
require "ModuLOVE.ModuleManager"
require "ModuLOVE.Module"
require "ModuLOVE.Modular"

require "modules.modulesIndex"
require "states.statesIndex"
require "entities.entitiesIndex"

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
VIRTUAL_WIDTH = 256
VIRTUAL_HEIGHT = 144

return ModuleManager {
    ["AppManager"]   = AppManagerModule,
    ["Input"]        = InputModule,
    ["StateMachine"] = StateMachineModule,
    ["AssetManager"] = AssetsManagerModule,
    ["QuadManager"]  = QuadManagerModule,
    ["Coordinates"]  = CoordinatesModule,
    ["Dimensions"]   = DimensionsModule,
    ["Texture"]      = TextureModule,
    ["Animation"]    = AnimationModule,
    ["Delta"]        = DeltaModule,
    ["Hitbox"]       = HitboxModule,
    ["Consummable"]  = ConsummableModule,
}
