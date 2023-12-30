local createState = require(script.State)

type BTreeImpl = {
    __index: BTreeImpl,
    createNode: (type: string, children: {}) -> (),
    getState: () -> (),
    setState: (string) -> ()
}

local BTree: BTreeImpl = {} :: BTreeImpl
BTree.__index = BTree

function BTree.createNode(type, children)
    local self = {}

    self._children = children
    self._type = type

    self._state = createState({
        "Succeeded",
        "Failed",
        "Running",
        "Idle"
    })

    return setmetatable(self, BTree)
end

function BTree:getState()
    return self._state:getState()
end

function BTree:setState(state)
    self._state:setState(state)
end

return BTree