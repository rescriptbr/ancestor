// Generated by ReScript, PLEASE EDIT WITH CARE

import * as React from "react";
import * as Ancestor from "@rescriptbr/ancestor/src/Ancestor.bs.js";

function s(prim) {
  return prim;
}

function App(Props) {
  return React.createElement(Ancestor.Box.make, {
              children: null
            }, React.createElement(Ancestor.Base.make, {
                  textDecoration: [Ancestor.xs("none")],
                  tag: "a",
                  children: "Test",
                  href: "test"
                }), React.createElement(Ancestor.Box.make, {
                  display: [Ancestor.xs("flex")],
                  gap: [Ancestor.xs({
                          NAME: "one",
                          VAL: {
                            NAME: "rem",
                            VAL: 3.2
                          }
                        })],
                  children: null
                }, React.createElement(Ancestor.Box.make, {
                      bgColor: [Ancestor.xs({
                              NAME: "hex",
                              VAL: "#000"
                            })],
                      width: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })],
                      height: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })]
                    }), React.createElement(Ancestor.Box.make, {
                      bgColor: [Ancestor.xs({
                              NAME: "hex",
                              VAL: "#000"
                            })],
                      width: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })],
                      height: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })]
                    }), React.createElement(Ancestor.Box.make, {
                      bgColor: [Ancestor.xs({
                              NAME: "hex",
                              VAL: "#000"
                            })],
                      width: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })],
                      height: [Ancestor.xs({
                              NAME: "px",
                              VAL: 50
                            })]
                    })));
}

var make = App;

export {
  s ,
  make ,
  
}
/* react Not a pure module */
