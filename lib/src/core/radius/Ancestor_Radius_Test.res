open Ancestor_Jest

module Config = {
  type breakpoints<'a> = [#xs('a) | #md('a)]

  let spacing = 8.0
  let radius = 8.0

  let sizeByBreakpoints = values =>
    switch values {
    | #xs(_) => 0
    | #md(_) => 920
    }

  let unboxBreakpointValue = values =>
    switch values {
    | #xs(v) => v
    | #md(v) => v
    }

  let css = Ancestor_Emotion.css
}

module Radius = Ancestor_Radius.Make(Config)

describe("Radius", (. ()) => {
  describe(".make", (. ()) => {
    it("should generate radius in px correctly", (. ()) => {
      expect(Radius.make(1))->toBe(`8.0px`)
      expect(Radius.make(2))->toBe(`16.0px`)
      expect(Radius.make(3))->toBe(`24.0px`)
    })
  })
})
