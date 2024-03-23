# ModuLÖVE FrameWork

! Work In Progress !

The ModuLÖVE framework enables a modular workflow, simillar to Unity and Unreal, for the LÖVE2D game engine.
With it and among other features, you can dynamically add or remove classes of object, instanciated or not. The ModuLÖVE framework follows the Object-Oriented Programming paradigm based on Matthias Richter *"Class"* library. 

I wrote this framework while taking [Harvard's GD50](https://cs50.harvard.edu/games/2018/) course to make coding games in LÖVE2D easier and faster (ironically, I took a lot of time building this). This is also the first time I've written a framework and hope what works for me will work for you too (please). I welcome any constructive critisisms as I intend to make this as useful as possible!

While working on this framework, I've realized that its main purpose was to build a project faster than without, which would make prototyping even more accessible.

# Why using ModuLÖVE?

It all started when I got tired of writting again and again the same fields and methods of every new class. For exemple, the `x` and `y` field are nearly universal to any object appearing on screen. So every new class looked like this:

```
Avatar = Class()

function Avatar:init(x,y)
    self.x = x or 0
    self.y = y or 0
end
```

 Which is not very **DRY**. 
 
 From this, I started to write classes for these kinds of mutual elements across classes but I had a problem. To integrate these classes into another I had two options:

 - Either using the `__includes` feature when creating the class and instanciating the targeted one by passing the new class's `self` like so:

```
Avatar = Class { __includes = Coordinates }

function Avatar:init(x,y)
    Coordinates(self, x, y)
end
```

> Which technically works but is hardly scallable and difficult to manage when one class depends on a multitude of other ones.

- Or instanciate the class directly into the new one's fields like so:

```
Avatar = Class()

function Avatar:init(x,y)
    self.coordinates = Coordinates(x,y)
end
```

> Which makes everything more bloated than it needs to be. If you wanted to work this way, it would mean that anytime you would want to  access the `x` field, you would need to go through the `coordinates` one. Which a big no no for me.

So in light of that, and inspired by the component system in other game engines like Unity or Unreal, I found the solution in the `ModuLÖVE` system. When enabled, it divides classes into two groups: `Modules` and `Modulars`.

- `Modules` are classes meant to be *plugged* and to add their fields and methods into another class (aka components)
- `Modulars` are classes meant to have Modules plugged into them to benefit from their fields and classes (aka gameObjects / Entities)

Now let's see it in action:

```
Coordinates = Class { __includes = Module }

Coordinates.fieldNames = {"x","y"}

function Coordinates:init(def)
    self.x = def.x or 0
    self.y = def.y or 0
end

function Coordinates:setX(x)
    self.x = x
end
```

> This is a good representation of what would a Module class be. It `__includes` the `Module` class when created. The `fieldNames` field is necessary for the unplugging process which is explained [here](ModuLOVE/readme.md). However, it terms of how classes are, it is pretty generic.

```
Avatar = Class { __includes = Modular }

function Avatar:init()
    self:plug("Coordinates", {x = 0, y = 0})
end
```
> And this is a class which `__includes` the `Modular` class which gives it access to a number of methods to enable the ModuLÖVE workflow.

That's it! The `Avatar` class has direct access to all fields and method of the Coordinates Module. Now, elsewhere in the code, I can do this:

```
self.x = 4
self.y = 17

or 

avatar = Avatar()
avatar:setX(52)
```

Easy, clean, fast and light. Which is a big yes yes for me.

### Unplugging Modules

The other powerful feature of the ModuLÖVE library is the ability to dynamically unplug Modules from Modular class. 

> :warning: However, as a warning, I would like to mention the fact that, because of the way Lua is built, I cannot completely erase fields and methods from an instanciated object (which are still tables) once they are declared. For more details, please read the *Unplugging Modules* section [here](ModuLOVE/readme.md)

That said, unplugging module is exactly how it sounds. Let's see how it works:

```
Tile = Class { __includes = Modular }

local modules = {
    Coordinates,
    Dimensions,
    Texture,
    Hitbox
}

local def = {
    x      = 50,
    y      = 50,
    width  = 16
    height = 16
    atlas  = love.graphics.newImage("assets/graphics/tile.png")
}

function Tile:init()
    self:plugInBulk(modules, def)
end
```

> Consider this `Modular` class in which I want to program a Tile. To appear on screen, this Tile needs `Coordinates`, `Dimensions` and `Texture`. Here I use the `:plugInBulk()` method which lets me plug multiple Modules at once. I define the `Modules` and their parameters right above the `:init()` method in two tables: `modules`and `def`. However, to be able to collide with something else, it needs a `Hitbox`. Among these `Modules`, you'll find the `HitboxModule` which adds fields and methods to enable a `Hitbox` around the Tile.

Now imagine that during gameplay, the avatar of the player breaks this Tile, which I want, int his case, to lose its ability to collide with the player's `Hitbox`. All I need to do is to use the `:unplug()` method like so:

```
if avatar:collides(tile) then
    tile:unplug("Hitbox")
end
```

> And that's it! now the Tile, for all intents and purposes, does not have the `HitBoxModule` plugged into it and has lost the ability to collide with the player. Pretty cool.

# What now?

This was a short preview of the ModuLOVE library. However, included in this repository, are a number are pre-made modules I wrote for my own projects, which is why I call this a framwork. If you would like to try it out, here are two ways to get started:

- Download this whole repository. It is structured like a LÖVE2D project so that you can directly get to programming. You'll find in depths annotations in each modules' file and a definition file in each folder for added explainations on each's intended purpose and use.
- If you want to start fresh, you can only download the [ModuLOVE](ModuLOVE) folder. Use it as a simple library and start building your own Modules!

I would like

# Third-Party Libraries Credits

- Class - Matthias Richter
- Push - https://github.com/Ulydev/push
- Knife - https://github.com/airstruck/knife