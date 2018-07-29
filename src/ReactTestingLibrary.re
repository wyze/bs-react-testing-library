include DomTestingLibrary;

module Simulate = {
  [@bs.module "react-testing-library"] [@bs.scope "Simulate"]
  external click : Dom.element => unit = "";
};

type renderResult;
type renderOptions = {
  .
  "baseElement": Js.undefined(Dom.element),
  "container": Js.undefined(Dom.element),
};

[@bs.module "react-testing-library"] external cleanup : unit => unit = "";

[@bs.module "react-testing-library"]
external _render : (ReasonReact.reactElement, renderOptions) => renderResult =
  "render";

[@bs.get] external container : renderResult => Dom.element = "";

[@bs.get] external baseElement : renderResult => Dom.element = "";

[@bs.send.pipe: renderResult]
external _debug : Js.undefined(Dom.element) => unit = "debug";

[@bs.send.pipe: renderResult] external unmount : unit => bool = "";

[@bs.send.pipe: renderResult]
external rerender : ReasonReact.reactElement => unit = "";

let render = (~baseElement=?, ~container=?, element) => {
  let baseElement_ =
    switch (container) {
    | Some(container') => Js.Undefined.return(container')
    | None => Js.Undefined.fromOption(baseElement)
    };
  let container_ = Js.Undefined.fromOption(container);

  _render(element, {"baseElement": baseElement_, "container": container_});
};

let debug = (~el=?, ()) => _debug(Js.Undefined.fromOption(el));
