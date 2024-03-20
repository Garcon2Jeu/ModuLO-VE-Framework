QuadManagerModule = Class { __includes = Module }

---Return a table of quads of the same size using a set of coordinates.
---@param atlas Image from "love.graphics.newImage()" or "AssetsManagerModule:import()"
---@param tileWidth number width of quads
---@param tileHeight number height of quads
---@param quadsCoordinates table each element holds the coordinates of a quad (ex: {x = 16, y =16})
---@param quadNames? table, of strings to name each quad, to be ordered
---@return table set
function QuadManagerModule.getSet(atlas, tileWidth, tileHeight, quadsCoordinates, quadNames)
    local set = {}

    for key, quadCoordinates in pairs(quadsCoordinates) do
        local quad = love.graphics.newQuad(
            quadCoordinates.x,
            quadCoordinates.y,
            tileWidth,
            tileHeight,
            atlas:getDimensions()
        )

        if quadNames and #quadNames > 0 then
            set[quadNames[1]] = quad
            table.remove(quadNames, 1)
        else
            table.insert(set, quad)
        end
    end

    return set
end

---Calculates the coordinates of quads within a set based of:
--- - the set's starting coordinates,
--- - the set's number of rows and columns of quads
--- - the tiles dimensions
---@param setX number starting point of the set in the X axis
---@param setY number starting point of the set in the Y axis
---@param setRows number number of rows of quads in the set
---@param setColumns number number of rows of quads in the set
---@param tilesWidth number width of all quads
---@param tileHeight number height of all quads
---@return table quadsCoordinates
function QuadManagerModule.getQuadsCoordinates(setX, setY, setColumns, setRows, tilesWidth, tileHeight)
    local quadsCoordinates = {}

    for row = 1, setRows do
        local y = (row - 1) * tileHeight + setY
        for column = 1, setColumns do
            local x = (column - 1) * tilesWidth + setX

            table.insert(quadsCoordinates, { x = x, y = y })
        end
    end

    return quadsCoordinates
end

function QuadManagerModule:cutSet(atlas, tile, set, quadNames)
    local quadCoordinates = self.getQuadsCoordinates(
        set.x,
        set.y,
        set.columns,
        set.rows,
        tile.width,
        tile.height
    )

    return self.getSet(
        atlas,
        tile.width,
        tile.height,
        quadCoordinates,
        quadNames
    )
end

-- TO DO
-- get Set Coordinates symmetrical
-- find way to cut quads from an asymmetrical spritesheet
