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

module Hero = {
  @react.component
  let make = () => {
    <section className={styles["hero"]}>
      <Memphis />
      <div className={styles["hero--title-container"]}>
        <h1 className={styles["hero--title"]}> {"Simple, fast and powerful"->s} </h1>
        <p className={styles["hero--text"]}>
          {`A suite of UI primitives for ReScript and React with focus on responsiveness.`->s}
        </p>
      </div>
      <div className={styles["hero--image"]}> <img src="/img/hero-symbol.svg" /> </div>
    </section>
  }
}

module AboutItem = {
  @react.component
  let make = (~icon, ~title, ~description) => {
    <div className={styles["about--item"]}>
      <img src=icon /> <h2> {title->s} </h2> <p> {description->s} </p>
    </div>
  }
}

module About = {
  @react.component
  let make = () => {
    <section className={styles["about"]}>
      <div className={styles["about--row"]}>
        <AboutItem
          icon="/img/layout-icon.svg"
          title="UI primitives"
          description="A set of unstyled components that works as UI primitives."
        />
        <AboutItem
          icon="/img/responsive-icon.svg"
          title="Focus on Responsiveness"
          description="All system props are responsive."
        />
      </div>
      <div className={styles["about--row"]}>
        <AboutItem
          icon="/img/focus-icon.svg"
          title="Focused on ReScript"
          description="It's not a set of bindings for an existing library, Ancestor was written with ReScript."
        />
        <AboutItem
          icon="/img/customizable-icon.svg"
          title="Simple and customizable"
          description="Breakpoints, spacing, radius and all properties are customizable."
        />
      </div>
    </section>
  }
}

module CodePreview = {
  @react.component
  let make = () => {
    <div className={styles["code-preview"]}>
      <div className={styles["code-preview--texts"]}>
        <h2> {`Built for ReScript`->s} </h2>
        <p>
          {`It's not a set of bindings for an existing library, Ancestor was created from scratch to use with ReScript.`->s}
        </p>
      </div>
      <img width="" src="/img/snippet.png" />
    </div>
  }
}

module StartUsing = {
  @react.component
  let make = () => {
    <div className={styles["start-box"]}>
      <div className={styles["start-box--texts"]}>
        <h2> {`Start using right now`->s} </h2>
        <p>
          {`This project is still beta but also actively maintained. It's used in some production `->s}
          <br />
          {`projects daily and keep breaking changes to a minimum whereever possible.`->s}
        </p>
      </div>
      <a href="/docs/getting-started"> <button> {`Let’s start`->s} </button> </a>
    </div>
  }
}

@react.component
let make = () => {
  <Docusaurus.Layout
    title=``
    description="A suite of UI primitives for ReScript and React with focus on responsiveness.">
    <main> <Hero /> <About /> <CodePreview /> <StartUsing /> </main>
  </Docusaurus.Layout>
}

let default = make
