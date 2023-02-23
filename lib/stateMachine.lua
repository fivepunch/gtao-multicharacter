---@diagnostic disable

State = Class {}

function State:init() end

function State:enter(params) end

function State:update(gameTime) end

function State:exit() end

StateMachine = Class {}

function StateMachine:init(states)
    self.empty = {
        init = function() end,
        enter = function(params) end,
        update = function(gameTime) end,
        exit = function() end
    }
    self.states = states or {} -- [name] -> [function that returns states]
    self.current = self.empty
    self.stateName = ''
end

function StateMachine:change(stateName, params)
    assert(self.states[stateName]) -- state must exist!
    self.current:exit()
    self.current = self.states[stateName]()
    self.stateName = stateName
    self.current:enter(params)
end

---comment
---@param gameTime number
function StateMachine:update(gameTime)
    if self.current then
        self.current:update(gameTime)
    end
end

function StateMachine:done()
    self.current:exit()

    self.current = nil
end
