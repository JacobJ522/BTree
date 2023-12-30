type List<T> = {T}

type state = {
    setState: (state: string | number) -> ()
}

local function createState<T>(states: {T}): {T}
    local state = { _current = nil }

    function state:setState(_state)
        if states[_state] then
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