// Generated by ReScript, PLEASE EDIT WITH CARE

import * as App from "./App.bs.js";
import * as React from "react";
import * as ReactDom from "react-dom";
import * as Caml_option from "rescript/lib/es6/caml_option.js";

var root = document.querySelector("#root");

if (root == null) {
  console.log("Roout element not found");
} else {
  ReactDom.render(React.createElement(App.make, {}), root);
}

var root$1 = (root == null) ? undefined : Caml_option.some(root);

export {
  root$1 as root,
  
}
/* root Not a pure module */
