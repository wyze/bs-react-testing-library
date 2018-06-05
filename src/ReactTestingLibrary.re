include DomTestingLibrary;

module Simulate = {
  [@bs.module "react-testing-library"] [@bs.scope "Simulate"]
  external click : Dom.element => unit = "";
};

type renderResult;
type renderOptions = {
  .
  "container": Js.undefined(Dom.element),
};

[@bs.module "react-testing-library"]
external cleanup : unit => unit = "";

[@bs.module "react-testing-library"]
external renderIntoDocument : ReasonReact.reactElement => renderResult = "";

[@bs.module "react-testing-library"]
external _render : (ReasonReact.reactElement, renderOptions) => renderResult = "render";

[@bs.get] external container : renderResult => Dom.element = "";

[@bs.send.pipe : renderResult] external debug : unit = "";

[@bs.send.pipe : renderResult] external unmount : unit => bool = "";

[@bs.send.pipe : renderResult] external rerender : ReasonReact.reactElement => unit = "";

let render = (~container=?, element) =>
  _render(element, { "container": Js.Undefined.fromOption(container) });

