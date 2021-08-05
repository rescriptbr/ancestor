open Render
open Ancestor.Default

@module("./home.module.css") external styles: {..} = "default"

@react.component
let make = () => {
  let {siteConfig} = Docusaurus.useDocusaurusContext()

  <Docusaurus.Layout
    title={siteConfig.title} description="Description will go into a meta tag in <head />">
    <main>
      <Grid alignItems=[#xxs(#center)] justifyContent=[#xxs(#"space-between")]>
        <Box size=[#xxs(#6)]>
          <h1 className={styles["hero--title"]}> {"Simple, fast and powerful"->s} </h1>
          <p className={styles["hero--text"]}>
            {`A suite of layout primitives for ReScript and React with focus on responsiveness.`->s}
          </p>
        </Box>
        <Box size=[#xxs(#6)]> <img src="/img/hero-symbol.svg" /> </Box>
      </Grid>
    </main>
  </Docusaurus.Layout>
}

let default = make
