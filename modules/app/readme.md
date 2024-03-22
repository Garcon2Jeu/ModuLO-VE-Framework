# App Bundle

Here you'll find useful modules to quickly set up your project, let's get into it!

I suggest creating a standalone file called App (or whatever) and plugging these two modules to group all things "technical in the same place. You'll find a template below.

## AppManagerModule

This Module is a collection of commoly-used methods for really basic stuff like:
- naming your window, 
- setting the default filter
- settting the Screen using the Push Library,
- seeding the pseudo-random generator

Call them all one after the other at the beginning of your code, and never think of them again.

Also, mostly because I didn't where else to put it, I've included a method for flipping a coin.

## InputModule

This Module will give you more flexibility with the "love.keypressed(key)" method. It is my take on GD50's way of handling this which is there where I learned it in the first place (shocker).

After plugging it wherever you think is best, you'll have to call the ":pressKey()" method inside the aforementioned love method and place the ":flushKeys()" method as the very last event in the "love.update(dt)" method, like this:

```
function love.update(dt)
    -- eveything else
    App:flushKeys()
end

function love.keypressed(key)
    App:pressKey(key)
end
```

When the player presses a key, Love sends that key to its method, then to ours. The ":pressKey()" method then adds a new element to the ".keysPressed" field with its (keyboard) key as the name of the key and its value to "true":

```
App.keysPressed["space"] = true
```

Now, if you wish to check if a key has been pressed, use the ":keysPressed()" method like this:

```
App:keysPressed("space")
```

This will return true or false if the key has been pressed during the current update.

At the end of said update, the ":flushKeys()" method will be triggered and will, just as its name suggests, reset the ".keysPressed" field.

## App template
```
App = Class { __includes = Modular }

function App:init()
    self:plugInBulk({ "AppManager", "Input" })

    self.seedRandom()
    self.setupWindow {
        windowTitle = "Test",
        window_width = 1280,
        window_height = 720,
        virtual_width = 256,
        virtual_height = 144,
    }
end
```

This is also where I would put method for restarting or quitting the application like so:

```
function App:quit()
    if self:keyPressed("escape") then
        love.event.quit()
    end
end
```