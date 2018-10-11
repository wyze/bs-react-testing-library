module FireEvent = DomTestingLibrary.FireEvent;

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

let getByAltText: (string, renderResult) => Dom.element;

let getByPlaceholderText: (string, renderResult) => Dom.element;

let getByTestId: (string, renderResult) => Dom.element;

let getByText:
  (
    ~matcher: [
                | `Func((string, Dom.element) => bool)
                | `RegExp(Js.Re.t)
                | `Str(string)
              ],
    ~options: DomTestingLibrary.Query.options=?,
    renderResult
  ) =>
  Dom.element;

let getByTitle: (string, renderResult) => Dom.element;

let getByValue: (string, renderResult) => Dom.element;

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
