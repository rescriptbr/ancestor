open Render
//hidden-end
open Ancestor.Default

@react.component
let make = () => {
  <Base display=[#xs(#flex)] justifyContent=[#xs(#center)] width=[#xs(100.->#pct)]>
    <Base
      display=[#xs(#flex)]
      flexDirection=[#xs(#column)]
      justifyContent=[#xs(#center)]
      alignItems=[#xs(#center)]
      maxW=[#xs(356->#px)]
      borderRadius=[#xs(1)]
      p=[#xs(3)]
      bgColor=[#xs(#hex("#000"))]
      tag=#section>
      <Base
        border=[#xs((2->#px, #solid, #hex("#f36")))]
        borderRadius=[#xs(6)]
        height=[#xs(96->#px)]
        width=[#xs(96->#px)]
        src="/img/ww-picture.png"
        tag=#img
        mb=[#xs(2)]
      />
      <Typography
        color=[#xs(#hex("#fff"))]
        m=[#xs(0)]
        textAlign=[#xs(#center)]
        fontSize=[#xs(24->#px)]
        tag=#h1>
        {"Walter White"->s}
      </Typography>
      <Typography
        textAlign=[#xs(#center)] color=[#xs(#hex("#545454"))] fontSize=[#xs(20->#px)] tag=#p>
        {"Teacher"->s}
      </Typography>
      <Typography
        textAlign=[#xs(#center)] color=[#xs(#hex("#a1a1a1"))] fontSize=[#xs(16->#px)] tag=#p>
        {"Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old"->s}
      </Typography>
    </Base>
  </Base>
}
