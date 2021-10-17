open Ancestor_Jest

describe("Ancestor_CssTypes", (. ()) => {
  it("Length.toString", (. ()) => {
    let toString = Ancestor_CssTypes.Length.toString

    expect(toString(#rem(10.2)))->toBe(`10.2rem`)->ignore
  })

  it("Transform.toString", (. ()) => {
    let toString = Ancestor_CssTypes.Transform.toString
    expect(toString(#translate(10.0->#rem, 20.0->#rem)))->toBe(`translate(10rem, 20rem)`)->ignore

    expect(toString(#translate3d(10->#px, 15->#px, 20->#px)))
    ->toBe(`translate3d(10px, 15px, 20px)`)
    ->ignore

    expect(#translateX(10->#px)->toString)->toBe(`translateX(10px)`)->ignore
    expect(#translateY(15->#px)->toString)->toBe(`translateY(15px)`)->ignore
    expect(#translateZ(20->#px)->toString)->toBe(`translateZ(20px)`)->ignore

    expect(#scale(1.0, 0.5)->toString)->toBe(`scale(1, 0.5)`)->ignore
    expect(#scaleY(1.5)->toString)->toBe(`scaleY(1.5)`)->ignore
    expect(#scaleY(0.5)->toString)->toBe(`scaleY(0.5)`)->ignore
    expect(#scaleX(1.5)->toString)->toBe(`scaleX(1.5)`)->ignore
    expect(#scaleX(0.8)->toString)->toBe(`scaleX(0.8)`)->ignore

    expect(#rotate(125.0->#deg)->toString)->toBe(`rotate(125deg)`)->ignore
    expect(#rotate3d(125.5, 135.5, 145.5, 155.5->#deg)->toString)
    ->toBe(`rotate3d(125.5, 135.5, 145.5, 155.5deg)`)
    ->ignore
  })
})
