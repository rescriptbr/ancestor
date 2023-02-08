open Jest
open Expect
open Ancestor
module Renderer = ReactTestRenderer

describe("Box", () => {
  test("should render with columns correctly", () => {
    expect(
      Renderer.create(
        <Box columns={xs: #6, md: #12, lg: #3}>
          <div />
        </Box>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })

  test("should render without columns correctly", () => {
    expect(
      Renderer.create(
        <Box>
          <div />
        </Box>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })
})
