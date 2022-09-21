open Ancestor_Jest
open Ancestor

module Renderer = Ancestor_ReactTestRenderer

describe("Hidden", (. ()) => {
  it("should visually hide elements correctly", (. ()) => {
    expect(
      Renderer.create(
        <Hidden on={xs: true, md: false, lg: true}>
          <div />
        </Hidden>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })
})
