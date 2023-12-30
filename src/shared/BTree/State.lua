type List<T> = {T}

type state = {
    setState: (state: string | number) -> ()
}

local function createState<T>(states: {T}): {T}
    local state = { _current = states[1] }

    function state:setState(_state)
        if table.find(states, _state) then
            self._current = _state
        end
    end

    function state:getState()
        return self._current
    end

    return state
end

--local st: {string | number} = createState({1,3,4})

return createState