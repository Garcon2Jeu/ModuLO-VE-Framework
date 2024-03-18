AssetsManagerModule = Class { __includes = Module }
AssetsManagerModule.filedNames = {}

---@param rootDir? string the path of the root directory
---@param categories? table table of categories
function AssetsManagerModule:init(rootDir, categories)
    self.rootDir = rootDir or "assets"
    self.categories = categories or self:getDefaultCategories()
end

---@param relativePath string path for the root directory of the  assets' folder, relative to the main.lua file
function AssetsManagerModule:setRootDir(relativePath)
    self.rootDir = relativePath
end

---@return string rootDir root directory of the assets folder relative to the main.lua file
function AssetsManagerModule:getRootDir()
    return self.rootDir
end

---@return table defaultCategories the default categories in a table
function AssetsManagerModule:getDefaultCategories()
    return {
        ["graphics"] = {
            callback         = function(filePath, settings) return love.graphics.newImage(filePath, settings) end,
            defaultExtension = "png"
        },
        ["audio"] = {
            callback         = function(filePath, type) return love.audio.newSource(filePath, type or "static") end,
            defaultExtension = "wav"
        },
        ["fonts"] = {
            callback         = function(filePath) return love.graphics.newFont(filePath) end,
            defaultExtension = "ttf"
        }
    }
end

---Inserts a new category in the ".category" field
---@param categoryName string name of the category
---@param callback function anonymous function containing the love method to add a new object. <br>
---(ex: love.graphics.newImage() or love.audio.newSource)
---@param defaultExtension string the default extension for this category of file without the "." at the beginning <br>
---(ex: "png", "wav")
function AssetsManagerModule:addCategory(categoryName, callback, defaultExtension)
    self.categories[categoryName] = {
        callback = callback,
        defaultExtension = defaultExtension
    }
end

---Uses callBack methods in the ".category" field to return new object of the requested category. <br>
---(ex: Assets:load("graphics", "tiles") = love.graphics.newImage("assets/graphics/tiles.png")
---@param category string category of asset established in the ":init()" method (ex: "audio")
---@param fileName string name of the file without the extension (ex: "sprite")
---@param customExtension? string overrides the default extension
---@param settings? table Optional table of settings to configure the image
---@return any
function AssetsManagerModule:import(category, fileName, customExtension, settings)
    assert(self.categories[category])

    local filePath =
        self.rootDir .. "/" ..
        category .. "/" ..
        fileName

    filePath = customExtension
        and filePath .. "." .. customExtension
        or filePath .. "." .. self.categories[category].defaultExtension

    return self.categories[category].callback(filePath, settings)
end

--- To import multiple files of the same category at the same time
---@param category string category of asset established in the ":init()" method (ex: "audio")
---@param filesData table holds all the data needed to use the ":import()" method in a table where each element is: <br> <br>
--- if a file doesn't need any additionnal parameters (customExtension or settings) then you can add only its fileName <br>
---if a file needs them, it's file name will be the key of the elements, and the parameters have to stored in an array.<br> <br>
---(ex: AssetsManagerModule:importBatch("graphics",{ <br>
---        "tiles", <br>
---        ["avatar.jpg"] = {customExtension = true, settings = {mipmaps = false, linear = true}} <br>
---     }))
---@return table
function AssetsManagerModule:importBatch(category, filesData)
    local batch = {}

    for fileName, data in pairs(filesData) do
        if type(data) == "string" then
            batch[data] = self:import(category, data)
        else
            batch[fileName] = self:import(category, fileName, data.customExtension or nil, data.settings or nil)
        end
    end

    return batch
end
