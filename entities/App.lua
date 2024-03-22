App = Class { __includes = Modular }

function App:init()
    self:plugInBulk({ "AppManager", "Input" })

    self.seedRandom()
    self.setupWindow {
        windowTitle = "ModuLÖVE Framework",
        window_width = WINDOW_WIDTH,
        window_height = WINDOW_HEIGHT,
        virtual_width = VIRTUAL_WIDTH,
        virtual_height = VIRTUAL_HEIGHT,
    }
end

function App:update()
    self:quit()
end

function App:quit()
    if self:keyPressed("escape") then
        love.event.quit()
    end
end
