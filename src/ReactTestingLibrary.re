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
  getByAltText(string, result |> baseElement);

let getByPlaceholderText = (string, result) =>
  getByPlaceholderText(string, result |> baseElement);

let getByTestId = (string, result) =>
  getByTestId(string, result |> baseElement);

let getByText = (~matcher, ~options=?, result) =>
  getByText(~matcher, ~options=?options, result |> baseElement);

let getByLabelText = (~matcher, ~options=?, result) =>
  getByLabelText(~matcher, ~options=?options, result |> baseElement);

let getByTitle = (string, result) => getByTitle(string, result |> baseElement);

let getByDisplayValue = (string, result) => getByDisplayValue(string, result |> baseElement);

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
