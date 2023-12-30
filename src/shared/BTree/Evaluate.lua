local types = {
    ["Fallback"] = function(node, args)
        local children = args --child nodes 

        node.tick = function()
            for _, childNode in ipairs(children) do
                
                return --TODO: Need to figure out approach/how to run nodes (can nodes run consecutively?)

            end
        end

        return node
    end,

    ["Action"] = function(node, args)

        return node
    end
}

local function Evaluate(node, type, args)
    return types[type](node, args)
end

return Evaluate