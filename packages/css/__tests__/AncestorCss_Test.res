open Jest
open Expect
module Renderer = AncestorCss_ReactTestRenderer

describe("Tokens", () => {
  test("should transform spacing tokens correctly", () => {
    open AncestorCss_Custom
    let className = style(. [padding(2), margin(4)])

    expect(Renderer.create(<div className />)->Renderer.toJSON)->toMatchSnapshot
  })
  test("should transform color tokens correctly", () => {
    open AncestorCss_Custom
    let className = style(. [color(#primary), bgColor(#secondary)])

    expect(Renderer.create(<div className />)->Renderer.toJSON)->toMatchSnapshot
  })
})
