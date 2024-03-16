App = Class { __includes = Modular }

function App:init()
    self:plugInBulk({ "AppManager" })
    self.seedRandom()
    self.setupWindow {
        windowTitle = "Test",
        window_width = 1280,
        window_height = 720,
        virtual_width = 256,
        virtual_height = 144,
    }
end
