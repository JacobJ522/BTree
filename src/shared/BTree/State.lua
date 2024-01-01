--!strict
export type state<T> = {
    _current: T,
    setState: (state: T) -> (),
    getState: () -> T
}

local function createState<T>(states: {T})
    local _state = { _current = states[1] }

    function _state:setState(_state)
        if table.find(states, _state) then
            self._current = _state
        end
    end

    function _state:getState()
        return self._current
    end

    return _state
end

return createState