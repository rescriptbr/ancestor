open Render

@module("./home.module.css") external styles: {..} = "default"

module Memphis = {
  module Lines = {
    @react.component
    let make = (~id) => {
      <img src="/img/memphis-01.svg" id />
    }
  }
  module Square = {
    @react.component
    let make = (~id) => {
      <img src="/img/memphis-02.svg" id />
    }
  }

  module Circle = {
    @react.component
    let make = (~id) => {
      <img src="/img/memphis-03.svg" id />
    }
  }

  @react.component
  let make = () => {
    <div className={styles["memphis"]}>
      <Lines id={styles["lines-1"]} />
      <Lines id={styles["lines-2"]} />
      <Square id={styles["square-1"]} />
      <Circle id={styles["circle-1"]} />
      <Square id={styles["square-2"]} />
      <Circle id={styles["circle-2"]} />
    </div>
  }
}

@react.component
let make = () => {
  let {siteConfig} = Docusaurus.useDocusaurusContext()

  <Docusaurus.Layout
    title={siteConfig.title} description="Description will go into a meta tag in <head />">
    <main>
      <div className={styles["hero"]}>
        <Memphis />
        <div className={styles["hero--title-container"]}>
          <h1 className={styles["hero--title"]}> {"Simple, fast and powerful"->s} </h1>
          <p className={styles["hero--text"]}>
            {`A suite of layout primitives for ReScript and React with focus on responsiveness.`->s}
          </p>
        </div>
        <div className={styles["hero--image"]}> <img src="/img/hero-symbol.svg" /> </div>
      </div>
      <br />
      <br />
      <br />
      <br />
      <br />
    </main>
  </Docusaurus.Layout>
}

let default = make
