// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Ancestor from "@rescriptbr/ancestor/src/Ancestor.bs.js";

function s(prim) {
  return prim;
}

function App(Props) {
  return React.createElement(Ancestor.Default.Box.make, {
              children: React.createElement(Ancestor.Default.Base.make, {
                    fontSize: [Ancestor.Default.xs({
                            NAME: "calc",
                            VAL: [
                              {
                                NAME: "px",
                                VAL: 10
                              },
                              "add",
                              {
                                NAME: "rem",
                                VAL: 0.5
                              }
                            ]
                          })],
                    children: "Teste"
                  })
            });
}

var make = App;

export {
  s ,
  make ,
  
}
/* react Not a pure module */
