@module("./home.module.css") external styles: {..} = "default"

Js.log(styles)

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
