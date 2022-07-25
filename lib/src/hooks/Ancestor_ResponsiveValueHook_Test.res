open Ancestor_Jest
open Ancestor_TestingLibrary

let windowSpy = ref(None)
@val external window: Dom.window = "window"

beforeEach(.() => {
  windowSpy := spyOnWithMethodName(window, "window", "get")->Some
})

afterEach(.() => {
  switch windowSpy.contents {
  | None => ()
  | Some(spy) => spy->mockRestore()
  }
})

describe("useResponsiveValue", (. ()) => {
  it("should returns the responsive value correctly", (. ()) => {
    let {result} = renderHook(() =>
      Ancestor.useResponsiveValue("Default", [#xs("Mobile"), #md("Tablet")])
    )
    expect(result.current)->toBe("Mobile")
  })
})
