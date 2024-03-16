---@class AppManagerModule
AppManagerModule = Class { __includes = Module }
AppManagerModule.fieldNames = {}

---Sets os.time() as the "seed" for the pseudo-random generator method "math.randomseed()".
function AppManagerModule:seedRandom()
    math.randomseed(os.time())
end

---Cheat-sheet Bundle of a number of commonly-used methods for Window setup.
---@param def table  holds all following parameters
--  [windowTitle]: string name of the Window <br>
--- [min?]: number Filter mode used when scaling the image down <br>
--- [mag?]: number Filter mode used when scaling the image up <br>
--  [virtual_width]: number Virtual width of the window in pixels <br>
--  [virtual_height]: number Virtual height of the window in pixels <br>
--  [window_width]: number Real width of the window in pixels <br>
--  [window_height]: number Real height of the window in pixels <br>
--  [fullscreen?]: Boolean whether the window will open or not <br>
--  [resize?]: boolean whether the window can be resized <br>
--  [vsync?]: boolean
function AppManagerModule.setupWindow(def)
    love.window.setTitle(def.windowTitle)
    love.graphics.setDefaultFilter(def.min or "nearest", def.mag or "nearest")

    Push:setupScreen(def.virtual_width, def.virtual_height, def.window_width, def.window_height, {
        fullscreen = def.fullscreen or false,
        resize     = def.resize or true,
        vsync      = def.vsync or true
    })
end

--- Flips a coin, returns true if math.random returns 1
---@param max number divide 100 by max to get probability <br>
---(ex: 2 / 100 = 50%)
---@return boolean
function AppManagerModule.flipCoin(max)
    return math.random(max or 2) == 1
end

-- function App:quit()
--     if self:keyPressed("escape") then
--         love.event.quit()
--     end
-- end
