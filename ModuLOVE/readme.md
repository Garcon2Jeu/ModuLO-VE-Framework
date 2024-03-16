## ModuLÖVE Framework

! Work In Progress !

ModuleManager enables a modular workflow, simillar to Unity and Unreal, for LÖVE2D.
With it you can dynamically add or remove classes of object, instanciated or not.

For now, this library is pretty much tied to the project I'm working on, but I wish to make it completely independant from it by the time i start the next one.

Stay tuned!

> You'll find additionnal details on all methods directly in their file.

<br> 

# Get Started

To set up the ModuLÖVE framework, you'll need to require it as a global variable in your main.lua or a dependencies file

```
ModuleManager = require "path.to.file.ModuleManager"
```

>:warning: Be sure to to call the global variable exactly as shown above, it won't work otherwise!

Every other files included in the package is now linked to your project. The only ones you'll need to require from now on are the modules you'll create and other third party libraries they use. You'll find how to do all that down below.

<br>

## Loading Modules

Next you'll need to load the libraries of Modules you'll want in you project. I have included a number of them I created while working on my own games.

<br>

### To load a single Module using the :load() method:

```
ModuleManager:load("Coordinates", function() return CoordinatesModule end)
```

> The first argument is the name of the Module, the second is an anonymous function which returns the class which the ModuleManager will use to feed the targeted object when instanciated.

<br>

### To load multiple Modules using the :loadBundle() method:

```
ModuleManager:loadBundle({
    ["Coordinates"] = function() return CoordinatesModule end,
    ["Dimensions"] = function() return DimensionsModule end
})
```

or

```
local modulesBundle = {
    ["Coordinates"] = function() return CoordinatesModule end,
    ["Dimensions"] = function() return DimensionsModule end
}

ModuleManager:loadBundle(modulesBundle)
```

<br>

### To load pre-made bundles of Modules using the ModulesLibrary:

Included in the package is a library of modules I have created for my own projects. I have bundled them together to make the process even faster.

```
ModuleManager:loadBundle(ModulesLibrary:getEssentials())
```

or if you wish to load them all at once:

```
ModuleManager:loadBundle(ModulesLibrary:getDefaults())
```

Check out all of the bundles in the ModuleLibrary.lua file and feel free to edit them! You'll find explanations on how to create more down below.

That's it! You've now added the ModuLÖve framework to your project and loaded all necessary Modules to get started. Now let's see how to use them:

<br>

# Modular Basics
First, you'll need to add the "Modular" class when declaring your new class:

```
Foo = Class{ __includes = Modular }
```

Great! Now your class is equipped with the necessary method to plug, unplug and find Modules. Let's see how to do all that:

<br>

## Pluging Modules
Pluging a Module means adding all fields and methods of one module into a Class.

<br>

### To plug a single module to a class using the :plug() method
You can plug Modules to a Class when instanciating it or at any time to an already instanciated object. Kinda proud of that. The first place you'll do that is inside the ":init()" method:

```
function Foo:init()
    self:plug("Coordinates", { x = 0, y = 0 })
end
```
> That's it!

Now each object instanciated with this class will benefit from all fields and methods of the plugged Module.

<br>

### To plug multiple Modules to a class using the :plugInBulk() method

```
self:plugInBulk({
    x = 0, 
    y = 0
    width = 16, 
    height = 16
},{
    "Coordinates",
    "Dimensions"
})
```
> Here the first argument is an array containing the parameters for all Modules. It is important for all parameters to have different names so they won't get mixed when plugging Modules. Be sure to keep that in mind when creating new Modules.

> The second argument is an array of strings of the names of all requested Modules, they can be in any order as long as their spelling is identical to the loaded Modules.

I find it clearer to do it this way:

```
    local def = {
        x = 0, 
        y = 0
        width = 16, 
        height = 16
    }

    self:plugInBulk(def, { 
        "Coordinates", 
        "Dimensions" 
    })
```
or
```
    local def = {
        x = 0, 
        y = 0
        width = 16, 
        height = 16
    }

    local moduleNames = { 
        "Coordinates", 
        "Dimensions" 
    }

    self:plugInBulk(def, moduleNames)
```

<br>

## Finding Modules

When plugging a Module, ModuleManager adds a field called ".modules" to the instanciated object. It is an array of each modules' name you can use to check whether the object has a particular plugged modules.

<br>

### To find modules with the :find() method

```
    self:find("Coordinates")
```

> This will return false if:
>- the first argument is nil,
>- the object doesn't have any plugged Modules,
>- the targeted Module hasn't been plugged. 

> It will return the index of the Module if it has been plugged to the object. Therefore, you can use it as follows:

```
if self:find(object, "Coordinates") then
    -- do something
end
```

<br>

## Unplugging Modules

### To Unplug a single Module

>:warning: Because of the way Lua is built, this **does not actually remove the fields and methods** added during the plugging process, all it does **is declaring all conccerned fields to "nil"**, but they are effectly still there. However, it does remove the name of the modules in the ".module" field. This is the reason why I suggest, instead of checking for an individual field, using the **:find()** method to see if a particular object has a plugged module. For all other cases (that I've encountered), unplugging Modules does exactly what it sounds like: for example, remove the Hitbox Module and the object will not longer have a Hitbox.

```
self:unplug(object, "Coordinates")
```
### To Unplug a multiple Modules at once
```
self:unplugInBulk(object, {"Coordinates", "Dimensions"})
```

Now That we've seen how to use the ModuleManager, Module and Modular file, I suggeststarting to read  how to use each module, starting the AppManagerModule and the InputModule. You can find them in the ModuLOVE/modules/app directory.