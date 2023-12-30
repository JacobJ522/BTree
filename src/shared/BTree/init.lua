local createState = require(script.State)
local Evaluate = require(script.Evaluate)

type BTreeImpl = {
    __index: BTreeImpl,
    createNode: (type: string, ...any) -> (),
    getState: () -> (),
    setState: (string) -> ()
}

local BTree: BTreeImpl = {} :: BTreeImpl
BTree.__index = BTree

function BTree.createNode(type, ...)
    local self = {}

    --initialize node state
    self._state = createState({
        "Idle",
        "Running",
        "Succeeded",
        "Failed"
    })

    self.tick = function() end

    --evaluate node 
    self = Evaluate(self, type, {...})

    return setmetatable(self, BTree)
end

function BTree:getState()
    return self._state:getState()
end

function BTree:setState(state)
    self._state:setState(state)
end

return BTree