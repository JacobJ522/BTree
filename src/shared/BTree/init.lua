
local createState = require(script.State)
local Evaluate = require(script.Evaluate)

type BTreeImpl = {
    __index: BTreeImpl,
    createNode: (type: string, ...any) -> (),
    getState: () -> (),
    setState: (string) -> (),
    start: (node) -> (),
    stop: (node) -> (),
    halt: (node) -> (),
    tickTree: () -> ()
}

type node = {
    _state: createState.state<number | string>
}

--[=[
    @class BTree

    The main class of BTree. Used for creating, running, and modifying nodes.
]=]
local BTree: BTreeImpl = {} :: BTreeImpl
BTree.__index = BTree

local runningTrees = {} --Containins all currently running node trees (root node)

--[=[
    Begins execution of a behavior tree from the root node

    @param node node
]=]
function BTree.start(node)
    --Check if node tree has already been started
    if not table.find(runningTrees, node) then
        --do stuff
    end
end

--[=[
    Stops execution of a behavior tree.

    @param node node
]=]
function BTree.stop(node)
    --Check if node tree has already been started
    if table.find(runningTrees, node) then
        --do stuff
    end
end

--[=[
    Halts execution of a behavior tree, allowing it to continue where it left off when started again.

    @param node node
]=]
function BTree.halt(node)
    --Check if node tree has already been started
    if table.find(runningTrees, node) then
        --do stuff
    end
end

function BTree.tickTree()
    
end


--[=[
    Creates a new behavior tree node

    @param type string
    @param ... tuple
    @return node
]=]
function BTree.createNode(type, ...)
    local self = {}

    --initialize node state
    self._state = createState({
        "Inactive",
        "Running",
        "Failed",
        "Succeeded"
    })

    self.update = function() end

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