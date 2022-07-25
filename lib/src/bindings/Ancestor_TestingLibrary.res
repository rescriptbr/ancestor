type result<'a> = {current: 'a}
type renderHookResult<'a> = {result: result<'a>}

@module("@testing-library/react-hooks/native")
external renderHook: (unit => 'a) => renderHookResult<'a> = "renderHook"
