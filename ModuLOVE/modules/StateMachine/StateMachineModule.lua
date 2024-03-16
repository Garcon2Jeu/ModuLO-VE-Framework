---@class StateMachineModule: Module
StateMachineModule = Class { __includes = Module }

StateMachineModule.fieldNames = {
    "states",
    "current",
    "placeholder"
}

---Enables a StateMachine. <br> <br>
--- Remember that you can instanciate this class as any other Module as a standalone object <br>
--- (ex: local StateMachine = StateMachineModule(def))
---@param def table holds all following parameters
--- [states]: table holds all the States to be loaded in the following format: <br>
--- [string]: State <br> <br>
--- ex: ["jump"] = JumpState
function StateMachineModule:init(def)
    self.current = State()
    self.placeholder = nil
    self.states = {}

    if def.states then
        self:loadBundle(def.states)
    end
end

---Loads a single State
---@param stateName string name of the state without the "State" suffix <br>
--- (ie: "jump" for the JumpState)
---@param State State State object
function StateMachineModule:load(stateName, State)
    self.states[stateName] = function() return State() end
end

---Loads multiple States at once
---@param statesBundle table holds all to be loaded States
------ [stateName]: State
function StateMachineModule:loadBundle(statesBundle)
    for stateName, State in pairs(statesBundle) do
        self:load(stateName, State)
    end
end

---Changes between different loaded States: <br>
--- - asserts if targeted State has been loaded to ".states" field
--- - triggers the current State's ":exit()" method
--- - replaces current State with targeted one and instanciate it
--- - triggers new current State ":enter()" method
---@param stateName string name of the targeted State
---@param enterParams table holds all parameters for targeted State
function StateMachineModule:changeState(stateName, enterParams)
    assert(self.states[stateName])
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

---Triggers current State's ":update(dt)" method
---@param dt number deltaTime, found in the "love.update(dt)" method
function StateMachineModule:updateState(dt)
    self.current:update(dt)
end

---Triggers current State's ":draw(dt)" method
function StateMachineModule:drawState()
    self.current:draw()
end

-- function StateMachineModule:getCurrentStateName(name)
--     return not name and self.stateMachine.current:getCurrentStateName()
--         or name == self.stateMachine.current:getCurrentStateName()
-- end
