open DomTestingLibrary;

module FireEvent = {
  include FireEvent;
};

type renderResult;
type renderOptions = {
  .
  "baseElement": Js.undefined(Dom.element),
  "container": Js.undefined(Dom.element),
};

[@bs.module "@testing-library/react"] external cleanup : unit => unit = "";

[@bs.module "@testing-library/react"]
external _render : (ReasonReact.reactElement, renderOptions) => renderResult =
  "render";

[@bs.get] external container : renderResult => Dom.element = "";

[@bs.get] external baseElement : renderResult => Dom.element = "";

[@bs.send.pipe: renderResult]
external _debug : Js.undefined(Dom.element) => unit = "debug";

[@bs.send.pipe: renderResult] external unmount : unit => bool = "";

[@bs.send.pipe: renderResult]
external rerender : ReasonReact.reactElement => unit = "";

let getByAltText = (string, result) =>
  getByAltText(string, result |> container);

let getByPlaceholderText = (string, result) =>
  getByPlaceholderText(string, result |> container);

let getByTestId = (string, result) =>
  getByTestId(string, result |> container);

let getByText = (~matcher, ~options=?, result) =>
  getByText(~matcher, ~options=?options, result |> container);

let getByLabelText = (~matcher, ~options=?, result) =>
  getByLabelText(~matcher, ~options=?options, result |> container);

let getByTitle = (string, result) => getByTitle(string, result |> container);

let getByDisplayValue = (string, result) => getByDisplayValue(string, result |> container);

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
