open Ancestor_Jest

include Ancestor_Css.Make({
  type spacing = int
  let spacing = v => #px(v * 8)
})

describe("Ancestor_Css", (. ()) => {
  describe("Length.toString", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(Length)
      expect(toString(#rem(10.2)))->toBe(`10.2rem`)
      expect(toString(#em(7.5)))->toBe(`7.5em`)
      expect(toString(#px(1)))->toBe(`1px`)
      expect(toString(#pct(100.0)))->toBe(`100%`)

      expect(#add(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem + 10px)`)
      expect(#sub(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem - 10px)`)
      expect(#div(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem / 10px)`)
      expect(#mult(1.6->#rem, 10->#px)->toString)->toBe(`calc(1.6rem * 10px)`)
    })
  })

  describe("Transform.toString", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(Transform)
      expect(toString(#translate(10.0->#rem, 20.0->#rem)))->toBe(`translate(10rem, 20rem)`)

      expect(
        toString(#translate3d(10->#px, 15->#px, 20->#px)),
      )->toBe(`translate3d(10px, 15px, 20px)`)

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

  describe("Gap.toString", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(Gap)

      expect(#v([1])->toString)->toBe(`8.0px`)
      expect(#v([1, 1])->toString)->toBe(`8.0px 8.0px`)

      expect(#inherit->toString)->toBe(`inherit`)
      expect(#unset->toString)->toBe(`unset`)
      expect(#revert->toString)->toBe(`revert`)
      expect(#initial->toString)->toBe(`initial`)
    })
  })

  describe("ListStyle", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(ListStyle)

      expect(#short(#square, #inside, #none)->toString)->toBe(`square inside none`)

      expect(#inherit->toString)->toBe(`inherit`)
      expect(#unset->toString)->toBe(`unset`)
      expect(#revert->toString)->toBe(`revert`)
      expect(#initial->toString)->toBe(`initial`)
    })
  })

  describe("BackgroundSize", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(BackgroundSize)

      expect(#size->toString)->toBe(`size`)
      expect(#contain->toString)->toBe(`contain`)
      expect(#inherit->toString)->toBe(`inherit`)
      expect(#initial->toString)->toBe(`initial`)
      expect(#unset->toString)->toBe(`unset`)
      expect(#auto->toString)->toBe(`auto`)
      expect(#length(12.5->#rem)->toString)->toBe(`12.5rem`)
    })
  })

  describe("BackgroundPosition.toString", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(BackgroundPosition)

      expect(#top->toString)->toBe(`top`)
      expect(#bottom->toString)->toBe(`bottom`)
      expect(#left->toString)->toBe(`left`)
      expect(#right->toString)->toBe(`right`)
      expect(#center->toString)->toBe(`center`)
      expect(#inherit->toString)->toBe(`inherit`)
      expect(#initial->toString)->toBe(`initial`)
      expect(#unset->toString)->toBe(`unset`)
      expect(#length(3.5->#rem)->toString)->toBe(`3.5rem`)
    })
  })

  describe("BackgroundImage.toString", (. ()) => {
    it("should convert into string correctly", (. ()) => {
      let {toString} = module(BackgroundImage)

      expect(#url("path/to/image.png")->toString)->toBe(`url("path/to/image.png")`)
    })
  })
})
