open Jest
open Expect
open Ancestor
module Renderer = Ancestor_ReactTestRenderer

describe("Stack", () => {
  test("should render correctly", () => {
    expect(
      Renderer.create(
        <Stack direction={xs: #horizontal, md: #vertical}>
          <div />
        </Stack>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })

  test("should render with dividers correctly", () => {
    let placeholder = <div> {`Placeholder`->React.string} </div>
    let divider = <div> {`Divider`->React.string} </div>

    expect(
      Renderer.create(
        <Stack divider={divider}>
          placeholder
          placeholder
        </Stack>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })
})
