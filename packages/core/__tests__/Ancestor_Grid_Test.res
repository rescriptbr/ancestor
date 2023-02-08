open Jest
open Expect
open Ancestor

module Renderer = ReactTestRenderer

describe("Grid", () => {
  test("should with spacing render correctly", () => {
    expect(
      Renderer.create(
        <Grid spacing={xs: 1, md: 0, lg: 3}>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 1"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 2"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 3"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 4"->React.string} </Box>
        </Grid>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })

  test("should without spacing render correctly", () => {
    expect(
      Renderer.create(
        <Grid>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 1"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 2"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 3"->React.string} </Box>
          <Box columns={xs: #6, md: #4, lg: #3}> {"Column 4"->React.string} </Box>
        </Grid>,
      )->Renderer.toJSON,
    )->toMatchSnapshot
  })
})
