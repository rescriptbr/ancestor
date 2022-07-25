open Ancestor_Jest
open Ancestor_TestingLibrary

/**
 * Helper function to resize the window.
 */
%%raw(`
 window.resizeTo = function resizeTo(width) {
    Object.assign(this, {
      innerWidth: width,
      outerWidth: width,
    }).dispatchEvent(new this.Event('resize'))
  }
`)

@val external window: Dom.window = "window"
@send external resizeTo: (Dom.window, int) => unit = "resizeTo"

describe("useResponsiveValue", (. ()) => {
  it("should returns the responsive value correctly", (. ()) => {
    let {result} = renderHook(() =>
      Ancestor.useResponsiveValue("Default", [#xs("Mobile"), #md("Tablet")])
    )

    expect(result.current)->toBe("Tablet")

    act((. ()) => window->resizeTo(320))

    expect(result.current)->toBe("Mobile")
  })
})
