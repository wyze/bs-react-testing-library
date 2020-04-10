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
external _debug: (Js.undefined(Dom.element), Js.undefined(int)) => unit =
  "debug";

[@bs.send.pipe: renderResult] external unmount: unit => bool = "unmount";

[@bs.send.pipe: renderResult]
external rerender: ReasonReact.reactElement => unit = "rerender";

[@bs.send.pipe: renderResult]
external asFragment: unit => Dom.element = "asFragment";

// ByLabelText
[@bs.send.pipe: renderResult]
external _getByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Dom.element =
  "getByLabelText";

let getByLabelText = (~matcher, ~options=?, result) =>
  _getByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _getAllByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  array(Dom.element) =
  "getAllByLabelText";

let getAllByLabelText = (~matcher, ~options=?, result) =>
  _getAllByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _queryByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Js.null(Dom.element) =
  "queryByLabelText";

let queryByLabelText = (~matcher, ~options=?, result) =>
  _queryByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _queryAllByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  array(Dom.element) =
  "queryAllByLabelText";

let queryAllByLabelText = (~matcher, ~options=?, result) =>
  _queryAllByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _findByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByLabelText";

let findByLabelText = (~matcher, ~options=?, result) =>
  _findByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _findAllByLabelText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByLabelTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByLabelText";

let findAllByLabelText = (~matcher, ~options=?, result) =>
  _findAllByLabelText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

// ByPlaceholderText
[@bs.send.pipe: renderResult]
external _getByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Dom.element =
  "getByPlaceholderText";

let getByPlaceholderText = (~matcher, ~options=?, result) =>
  _getByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _getAllByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  array(Dom.element) =
  "getAllByPlaceholderText";

let getAllByPlaceholderText = (~matcher, ~options=?, result) =>
  _getAllByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _queryByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Js.null(Dom.element) =
  "queryByPlaceholderText";

let queryByPlaceholderText = (~matcher, ~options=?, result) =>
  _queryByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _queryAllByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  array(Dom.element) =
  "queryAllByPlaceholderText";

let queryAllByPlaceholderText = (~matcher, ~options=?, result) =>
  _queryAllByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _findByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Js.Promise.t(Dom.element) =
  "findByPlaceholderText";

let findByPlaceholderText = (~matcher, ~options=?, result) =>
  _findByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

[@bs.send.pipe: renderResult]
external _findAllByPlaceholderText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByPlaceholderTextQuery.options)
  ) =>
  Js.Promise.t(array(Dom.element)) =
  "findAllByPlaceholderText";

let findAllByPlaceholderText = (~matcher, ~options=?, result) =>
  _findAllByPlaceholderText(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

// ByText
[@bs.send.pipe: renderResult]
external _getByText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTextQuery.options)
  ) =>
  Dom.element =
  "getByText";

let getByText = (~matcher, ~options=?, result) =>
  _getByText(result, ~matcher, ~options=Js.Undefined.fromOption(options));

// ByAltText
[@bs.send.pipe: renderResult]
external _getByAltText:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByAltTextQuery.options)
  ) =>
  Dom.element =
  "getByAltText";

let getByAltText = (~matcher, ~options=?, result) =>
  _getByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options));

// ByTitle
[@bs.send.pipe: renderResult]
external _getByTitle:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTitleQuery.options)
  ) =>
  Dom.element =
  "getByTitle";

let getByTitle = (~matcher, ~options=?, result) =>
  _getByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options));

// ByDisplayValue
[@bs.send.pipe: renderResult]
external _getByDisplayValue:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByDisplayValueQuery.options)
  ) =>
  Dom.element =
  "getByDisplayValue";

let getByDisplayValue = (~matcher, ~options=?, result) =>
  _getByDisplayValue(
    result,
    ~matcher,
    ~options=Js.Undefined.fromOption(options),
  );

// ByRole
[@bs.send.pipe: renderResult]
external _getByRole:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByRoleQuery.options)
  ) =>
  Dom.element =
  "getByRole";

let getByRole = (~matcher, ~options=?, result) =>
  _getByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options));

// ByTestId
[@bs.send.pipe: renderResult]
external _getByTestId:
  (
    ~matcher: [@bs.unwrap] [
                | `Str(string)
                | `RegExp(Js.Re.t)
                | `Func((string, Dom.element) => bool)
              ],
    ~options: Js.undefined(ByTestIdQuery.options)
  ) =>
  Dom.element =
  "getByTestId";

let getByTestId = (~matcher, ~options=?, result) =>
  _getByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options));

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

let debug = (~el=?, ~maxLengthToPrint=?, ()) =>
  _debug(
    Js.Undefined.fromOption(el),
    Js.Undefined.fromOption(maxLengthToPrint),
  );
