open Ancestor_Jest

describe("Ancestor_CssTypes", (. ()) => {
  it("Length.toString", (. ()) => {
    let toString = Ancestor_CssTypes.Length.toString

    expect(toString(#rem(10.2)))->toBe(`10.2rem`)

    // CSS calc(...)
    expect(#add(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem + 10px)`)
    expect(#sub(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem - 10px)`)
    expect(#div(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem / 10px)`)
    expect(#mult(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem * 10px)`)
  })

  it("Transform.toString", (. ()) => {
    let toString = Ancestor_CssTypes.Transform.toString
    expect(toString(#translate(10.0->#rem, 20.0->#rem)))->toBe(`translate(10rem, 20rem)`)

    expect(toString(#translate3d(10->#px, 15->#px, 20->#px)))->toBe(`translate3d(10px, 15px, 20px)`)

    expect(#translateX(10->#px)->toString)->toBe(`translateX(10px)`)
    expect(#translateY(15->#px)->toString)->toBe(`translateY(15px)`)
    expect(#translateZ(20->#px)->toString)->toBe(`translateZ(20px)`)

    expect(#scale(1.0, 0.5)->toString)->toBe(`scale(1, 0.5)`)
    expect(#scaleY(1.5)->toString)->toBe(`scaleY(1.5)`)
    expect(#scaleY(0.5)->toString)->toBe(`scaleY(0.5)`)
    expect(#scaleX(1.5)->toString)->toBe(`scaleX(1.5)`)
    expect(#scaleX(0.8)->toString)->toBe(`scaleX(0.8)`)

    expect(#rotate(125.0->#deg)->toString)->toBe(`rotate(125deg)`)
    expect(
      #rotate3d(125.5, 135.5, 145.5, 155.5->#deg)->toString,
    )->toBe(`rotate3d(125.5, 135.5, 145.5, 155.5deg)`)

    expect(#rotateX(125.0->#deg)->toString)->toBe(`rotateX(125deg)`)
    expect(#rotateY(125.0->#deg)->toString)->toBe(`rotateY(125deg)`)
    expect(#rotateZ(125.0->#deg)->toString)->toBe(`rotateZ(125deg)`)

    expect(#skew(125.0->#deg, 225.0->#deg)->toString)->toBe(`skew(125deg, 225deg)`)
    expect(#skewY(125.0->#deg)->toString)->toBe(`skewY(125deg)`)
    expect(#skewX(125.0->#deg)->toString)->toBe(`skewX(125deg)`)
    expect(#perspective(125)->toString)->toBe(`perspective(125)`)
  })
})
