StateMachineModule = Class { __includes = Module }

StateMachineModule.fieldNames = {
    "states",
    "current",
    "placeholder"
}

function StateMachineModule:init(def)
    self.current = BaseState()
    self.placeholder = nil
    self.states = {}

    if def.states then
        self:loadBundle(def.states)
    end
end

function StateMachineModule:load(stateName, State)
    self.states[stateName] = function() return State() end
end

function StateMachineModule:loadBundle(statesBundle)
    for stateName, State in pairs(statesBundle) do
        self:load(stateName, State)
    end
end

function StateMachineModule:changeState(stateName, enterParams)
    assert(self.states[stateName])
    self.current:exit()
    self.current = self.states[stateName]()
    self.current:enter(enterParams)
end

function StateMachineModule:updateState(dt)
    self.current:update(dt)
end

function StateMachineModule:drawState()
    self.current:draw()
end

function StateMachineModule:getCurrentStateName(name)
    return not name and self.stateMachine.current:getCurrentStateName()
        or name == self.stateMachine.current:getCurrentStateName()
end
