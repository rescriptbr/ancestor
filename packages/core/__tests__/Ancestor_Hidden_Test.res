open Jest
open Expect
open Ancestor

module Renderer = ReactTestRenderer

describe("Hidden", () => {
  test("should visually hide elements correctly", () => {
    expect(
      Renderer.create(
        <Hidden on={xs: true, md: false, lg: true}>
          <div />
        </Hidden>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })
})
