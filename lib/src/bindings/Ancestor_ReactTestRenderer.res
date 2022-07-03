type rendered

@send external toJSON: rendered => Js.Json.t = "toJSON"
@module("react-test-renderer") external create: React.element => rendered = "create"
