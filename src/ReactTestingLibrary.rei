module Query = DomTestingLibrary.Query;
module Wait = DomTestingLibrary.Wait;
module WaitForElement = DomTestingLibrary.WaitForElement;

let wait:
  (~callback: unit => unit=?, ~options: Wait.options=?, unit) =>
  Js.Promise.t('a);

let waitForElement:
  (~callback: unit => 'a=?, ~options: WaitForElement.options=?, unit) =>
  Js.Promise.t('a);

let prettyDOM: (~maxLength: int=?, Dom.element) => string;

[@bs.module "dom-testing-library"]
external getNodeText : Dom.element => string = "";

let getByTestId: (string, Dom.element) => Dom.element;

let getByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: Query.options=?,
    Dom.element
  ) =>
  Dom.element;

module Simulate: {
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

[@bs.get] external container : renderResult => Dom.element = "";

[@bs.get] external baseElement : renderResult => Dom.element = "";

[@bs.send.pipe: renderResult] external unmount : unit => bool = "";

[@bs.send.pipe: renderResult]
external rerender : ReasonReact.reactElement => unit = "";

let render:
  (
    ~baseElement: Dom.element=?,
    ~container: Dom.element=?,
    ReasonReact.reactElement
  ) =>
  renderResult;

let debug: (~el: Dom.element=?, unit, renderResult) => unit;
