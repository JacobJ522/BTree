local types = {
    ["Fallback"] = function(node, args)
        local children = args --child nodes 

        node.tick = function()
            for _, childNode in ipairs(children) do
                --do stuff

            end
        end

        return node
    end,

    ["Action"] = function(node, args)

        return node
    end
}

local function Evaluate(node, type, args)
    if types[type] then
        return types[type](node, args)
    else
        --error
        return node
    end
end

return Evaluate