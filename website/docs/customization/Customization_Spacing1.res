module AncestorCustom = Ancestor.Make({
  include Ancestor.DefaultConfig

  let spacing = v => #px(v * 4)
})
