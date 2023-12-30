local BTree = require(game.ReplicatedStorage.Shared.BTree)

local root = BTree.createNode("Fallback", {})
print(root:getState())
root:setState("Idle")
print(root:getState())