open DomTestingLibrary;

module FireEvent = {
  include FireEvent;
};

type renderResult;
type queries;
type renderOptions = {
  .
  "container": Js.undefined(Dom.element),
  "baseElement": Js.undefined(Dom.element),
  "hydrate": Js.undefined(bool),
  "wrapper": Js.undefined(Dom.element),
  "queries": Js.undefined(queries),
};

[@bs.module "@testing-library/react"]
external cleanup: unit => unit = "cleanup";

[@bs.module "@testing-library/react"]
external _render: (ReasonReact.reactElement, renderOptions) => renderResult =
  "render";

[@bs.get] external container: renderResult => Dom.element = "container";

[@bs.get] external baseElement: renderResult => Dom.element = "baseElement";

[@bs.send.pipe: renderResult]
external _debug: Js.undefined(Dom.element) => unit = "debug";

[@bs.send.pipe: renderResult] external unmount: unit => bool = "unmount";

[@bs.send.pipe: renderResult]
external rerender: ReasonReact.reactElement => unit = "rerender";

let getByAltText = (string, result) =>
  getByAltText(~matcher=`Str(string), result |> container);

let getByPlaceholderText = (string, result) =>
  getByPlaceholderText(~matcher=`Str(string), result |> container);

let getByTestId = (string, result) =>
  getByTestId(~matcher=`Str(string), result |> container);

let getByText = (~matcher, ~options=?, result) =>
  getByText(~matcher, ~options?, result |> container);

let getByLabelText = (~matcher, ~options=?, result) =>
  getByLabelText(~matcher, ~options?, result |> container);

let getByTitle = (string, result) =>
  getByTitle(~matcher=`Str(string), result |> container);

let getByDisplayValue = (string, result) =>
  getByDisplayValue(~matcher=`Str(string), result |> container);

let render =
    (
      ~baseElement=?,
      ~container=?,
      ~hydrate=?,
      ~wrapper=?,
      ~queries=?,
      element,
    ) => {
  let baseElement_ =
    switch (container) {
    | Some(container') => Js.Undefined.return(container')
    | None => Js.Undefined.fromOption(baseElement)
    };
  let container_ = Js.Undefined.fromOption(container);

  _render(
    element,
    {
      "baseElement": baseElement_,
      "container": container_,
      "hydrate": Js.Undefined.fromOption(hydrate),
      "wrapper": Js.Undefined.fromOption(wrapper),
      "queries": Js.Undefined.fromOption(queries),
    },
  );
};

let debug = (~el=?, ()) => _debug(Js.Undefined.fromOption(el));
