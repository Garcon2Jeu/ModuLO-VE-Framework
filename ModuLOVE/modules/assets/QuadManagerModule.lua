QuadManagerModule = Class { __includes = Module }

---Bundles various methods for quickly cutting multiple symmetrical sets of symmetrical quads in a spritesheet/atlas
---@param atlas Image from "love.graphics.newImage()" or "AssetsManagerModule:import()"
---@param tilesWidth number width of all quads
---@param tilesHeight number height of all quads
---@param setRows? number number of rows of sets in the spritesheet
---@param setColumns? number number of columns of sets in the spritesheet
---@param quadNames? table, of strings to name each quad, to be ordered
---@return table setsOfQuads
function QuadManagerModule:getSetsOfQuads(atlas, tilesWidth, tilesHeight, setRows, setColumns, quadNames)
    setRows = setRows or 1
    setColumns = setColumns or 1

    local tiles = { width = tilesWidth, height = tilesHeight, }
    local quads = {
        rows = (atlas:getHeight() / setRows) / tilesHeight,
        columns = (atlas:getWidth() / setColumns) / tilesWidth
    }

    local setsOfQuads = {}

    for key, setCoordinates in pairs(Quads.getSetsCoordinates(atlas, setRows, setColumns)) do
        table.insert(setsOfQuads,
            self:cutSet(
                atlas,
                tiles,
                { x = setCoordinates.x, y = setCoordinates.y },
                quads,
                quadNames))
    end

    return #setsOfQuads == 1 and setsOfQuads[1] or setsOfQuads
end

---Calculates the coordinates of sets in a symmetrical spritesheet. <br>
---If rows and columns are omitted, will assume there is only 1 set in the spritesheet
---@param atlas Image from "love.graphics.newImage()" or "AssetsManagerModule:import()"
---@param rows? number number of rows of sets in the spritesheet
---@param columns? number number of columns of sets in the spritesheet
---@return table setsCoordinates
function QuadManagerModule.getSetsCoordinates(atlas, rows, columns)
    local setsCoordinates = {}

    if not rows and not columns
        or rows == 1 and columns == 1 then
        table.insert(setsCoordinates, { x = 0, y = 0 })
    else
        local width = atlas:getWidth() / columns
        local height = atlas:getHeight() / rows

        for row = 1, rows do
            local y = (row - 1) * height
            for column = 1, columns do
                table.insert(setsCoordinates, {
                    x = (column - 1) * width,
                    y = y
                })
            end
        end
    end

    return setsCoordinates
end

---Bundles getQuadsCoordinates() and getSet()
---@param atlas Image from "love.graphics.newImage()" or "AssetsManagerModule:import()"
---@param tiles table containing {[width] = number, [height] = number}
---@param set table containing {[x] = number, [y] = number}
---@param quads table containing {[rows] = number, [columns] = number}
---@param quadNames? table of strings to name each quad, to be ordered from top-left to bottom-Right of the spritesheet
---@return table setOfQuad
function QuadManagerModule:cutSet(atlas, tiles, set, quads, quadNames)
    local quadCoordinates = self.getQuadsCoordinates(
        tiles.width,
        tiles.height,
        set.x,
        set.y,
        quads.rows,
        quads.columns
    )

    return self.getSet(
        atlas,
        tiles.width,
        tiles.height,
        quadCoordinates,
        quadNames
    )
end

---Calculates the coordinates of quads within a set based on:
--- - the set's starting coordinates,
--- - the set's number of rows and columns of quads
--- - the tiles dimensions
---@param tilesWidth number width of all quads
---@param tilesHeight number height of all quads
---@param setX number starting point of the set in the X axis
---@param setY number starting point of the set in the Y axis
---@param quadColumns? number number of columns of quads in the set
---@param quadRows? number number of rows of quads in the set
---@return table quadsCoordinates
function QuadManagerModule.getQuadsCoordinates(tilesWidth, tilesHeight, setX, setY, quadRows, quadColumns)
    local quadsCoordinates = {}

    for row = 1, quadRows or 1 do
        local y = (row - 1) * tilesHeight + setY
        for column = 1, quadColumns or 1 do
            local x = (column - 1) * tilesWidth + setX

            table.insert(quadsCoordinates, { x = x, y = y })
        end
    end

    return quadsCoordinates
end

---Return a table of quads of the same size using a set of coordinates.
---@param atlas Image from "love.graphics.newImage()" or "AssetsManagerModule:import()"
---@param tileWidth number width of quads
---@param tileHeight number height of quads
---@param quadsCoordinates table each element holds the coordinates of a quad (ex: {x = 16, y =16})
---@param quadNames? table of strings to name each quad, to be ordered from top-left to bottom-Right of the spritesheet
---@return table set
function QuadManagerModule.getSet(atlas, tileWidth, tileHeight, quadsCoordinates, quadNames)
    local setOfQuads = {}

    for key, quadCoordinates in pairs(quadsCoordinates) do
        local quad = love.graphics.newQuad(
            quadCoordinates.x,
            quadCoordinates.y,
            tileWidth,
            tileHeight,
            atlas:getDimensions()
        )

        if quadNames and #quadNames > 0 then
            setOfQuads[quadNames[1]] = quad
            table.remove(quadNames, 1)
        else
            table.insert(setOfQuads, quad)
        end
    end

    return setOfQuads
end
