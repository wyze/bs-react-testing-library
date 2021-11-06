open DomTestingLibrary

module FireEvent = {
  include FireEvent
}

type renderResult
type queries
type renderOptions = {
  "container": Js.undefined<Dom.element>,
  "baseElement": Js.undefined<Dom.element>,
  "hydrate": Js.undefined<bool>,
  "wrapper": Js.undefined<Dom.element>,
  "queries": Js.undefined<queries>,
}

@module("@testing-library/react")
external cleanup: unit => unit = "cleanup"

@module("@testing-library/react")
external _act: (unit => Js.undefined<Js.Promise.t<'a>>) => unit = "act"

let act = callback =>
  _act(() => {
    callback()
    // (work-around) BuckleScript compiles `unit` to `0`, this will cause a warning as following:
    // Warning: The callback passed to act(...) function must return undefined, or a Promise.
    Js.Undefined.empty
  })

@module("@testing-library/react")
external _render: (React.element, renderOptions) => renderResult = "render"

@get external container: renderResult => Dom.element = "container"

@get external baseElement: renderResult => Dom.element = "baseElement"

@send external _debug: (renderResult, Js.undefined<Dom.element>, Js.undefined<int>) => unit = "debug"
@send external unmount: (renderResult, unit) => bool = "unmount"
@send external rerender: (renderResult, React.element) => unit = "rerender"
@send external asFragment: (renderResult, unit) => Dom.element = "asFragment"

// ByLabelText
@send external _getByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Dom.element = "getByLabelText"

let getByLabelText = (result, ~matcher, ~options=?, ()) =>
  _getByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => array<Dom.element> = "getAllByLabelText"

let getAllByLabelText = (result, ~matcher, ~options=?, ()) =>
  _getAllByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Js.null<Dom.element> = "queryByLabelText"

let queryByLabelText = (result, ~matcher, ~options=?, ()) =>
  _queryByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => array<Dom.element> = "queryAllByLabelText"

let queryAllByLabelText = (result, ~matcher, ~options=?, ()) =>
  _queryAllByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Js.Promise.t<Dom.element> = "findByLabelText"

let findByLabelText = (result, ~matcher, ~options=?, ()) =>
  _findByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByLabelText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByLabelTextQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByLabelText"

let findAllByLabelText = (result, ~matcher, ~options=?, ()) =>
  _findAllByLabelText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByPlaceholderText
@send external _getByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Dom.element = "getByPlaceholderText"

let getByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _getByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => array<Dom.element> = "getAllByPlaceholderText"

let getAllByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _getAllByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Js.null<Dom.element> = "queryByPlaceholderText"

let queryByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _queryByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => array<Dom.element> = "queryAllByPlaceholderText"

let queryAllByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _queryAllByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Js.Promise.t<Dom.element> = "findByPlaceholderText"

let findByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _findByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByPlaceholderText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByPlaceholderTextQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByPlaceholderText"

let findAllByPlaceholderText = (result, ~matcher, ~options=?, ()) =>
  _findAllByPlaceholderText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByText
@send external _getByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Dom.element = "getByText"

let getByText = (result, ~matcher, ~options=?, ()) =>
  _getByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => array<Dom.element> = "getAllByText"

let getAllByText = (result, ~matcher, ~options=?, ()) =>
  _getAllByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Js.null<Dom.element> = "queryByText"

let queryByText = (result, ~matcher, ~options=?, ()) =>
  _queryByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => array<Dom.element> = "queryAllByText"

let queryAllByText = (result, ~matcher, ~options=?, ()) =>
  _queryAllByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Js.Promise.t<Dom.element> = "findByText"

let findByText = (result, ~matcher, ~options=?, ()) =>
  _findByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTextQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByText"

let findAllByText = (result, ~matcher, ~options=?, ()) =>
  _findAllByText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByAltText
@send external _getByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Dom.element = "getByAltText"

let getByAltText = (result, ~matcher, ~options=?, ()) =>
  _getByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => array<Dom.element> = "getAllByAltText"

let getAllByAltText = (result, ~matcher, ~options=?, ()) =>
  _getAllByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Js.null<Dom.element> = "queryByAltText"

let queryByAltText = (result, ~matcher, ~options=?, ()) =>
  _queryByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => array<Dom.element> = "queryAllByAltText"

let queryAllByAltText = (result, ~matcher, ~options=?, ()) =>
  _queryAllByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Js.Promise.t<Dom.element> = "findByAltText"

let findByAltText = (result, ~matcher, ~options=?, ()) =>
  _findByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByAltText: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByAltTextQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByAltText"

let findAllByAltText = (result, ~matcher, ~options=?, ()) =>
  _findAllByAltText(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByTitle
@send external _getByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Dom.element = "getByTitle"

let getByTitle = (result, ~matcher, ~options=?, ()) =>
  _getByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => array<Dom.element> = "getAllByTitle"

let getAllByTitle = (result, ~matcher, ~options=?, ()) =>
  _getAllByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Js.null<Dom.element> = "queryByTitle"

let queryByTitle = (result, ~matcher, ~options=?, ()) =>
  _queryByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => array<Dom.element> = "queryAllByTitle"

let queryAllByTitle = (result, ~matcher, ~options=?, ()) =>
  _queryAllByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Js.Promise.t<Dom.element> = "findByTitle"

let findByTitle = (result, ~matcher, ~options=?, ()) =>
  _findByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByTitle: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTitleQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByTitle"

let findAllByTitle = (result, ~matcher, ~options=?, ()) =>
  _findAllByTitle(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByDisplayValue
@send external _getByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Dom.element = "getByDisplayValue"

let getByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _getByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => array<Dom.element> = "getAllByDisplayValue"

let getAllByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _getAllByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Js.null<Dom.element> = "queryByDisplayValue"

let queryByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _queryByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => array<Dom.element> = "queryAllByDisplayValue"

let queryAllByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _queryAllByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Js.Promise.t<Dom.element> = "findByDisplayValue"

let findByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _findByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByDisplayValue: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByDisplayValueQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByDisplayValue"

let findAllByDisplayValue = (result, ~matcher, ~options=?, ()) =>
  _findAllByDisplayValue(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByRole
@send external _getByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Dom.element = "getByRole"

let getByRole = (result, ~matcher, ~options=?, ()) =>
  _getByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => array<Dom.element> = "getAllByRole"

let getAllByRole = (result, ~matcher, ~options=?, ()) =>
  _getAllByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Js.null<Dom.element> = "queryByRole"

let queryByRole = (result, ~matcher, ~options=?, ()) =>
  _queryByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => array<Dom.element> = "queryAllByRole"

let queryAllByRole = (result, ~matcher, ~options=?, ()) =>
  _queryAllByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Js.Promise.t<Dom.element> = "findByRole"

let findByRole = (result, ~matcher, ~options=?, ()) =>
  _findByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByRole: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByRoleQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByRole"

let findAllByRole = (result, ~matcher, ~options=?, ()) =>
  _findAllByRole(result, ~matcher, ~options=Js.Undefined.fromOption(options))

// ByTestId
@send external _getByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Dom.element = "getByTestId"

let getByTestId = (result, ~matcher, ~options=?, ()) =>
  _getByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _getAllByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => array<Dom.element> = "getAllByTestId"

let getAllByTestId = (result, ~matcher, ~options=?, ()) =>
  _getAllByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Js.null<Dom.element> = "queryByTestId"

let queryByTestId = (result, ~matcher, ~options=?, ()) =>
  _queryByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _queryAllByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => array<Dom.element> = "queryAllByTestId"

let queryAllByTestId = (result, ~matcher, ~options=?, ()) =>
  _queryAllByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Js.Promise.t<Dom.element> = "findByTestId"

let findByTestId = (result, ~matcher, ~options=?, ()) =>
  _findByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

@send external _findAllByTestId: (
  renderResult,
  ~matcher: @unwrap
  [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: Js.undefined<ByTestIdQuery.options>,
) => Js.Promise.t<array<Dom.element>> = "findAllByTestId"

let findAllByTestId = (result, ~matcher, ~options=?, ()) =>
  _findAllByTestId(result, ~matcher, ~options=Js.Undefined.fromOption(options))

let render = (element, ~baseElement=?, ~container=?, ~hydrate=?, ~wrapper=?, ~queries=?, ()) => {
  let baseElement_ = switch container {
  | Some(container') => Js.Undefined.return(container')
  | None => Js.Undefined.fromOption(baseElement)
  }
  let container_ = Js.Undefined.fromOption(container)

  _render(
    element,
    {
      "baseElement": baseElement_,
      "container": container_,
      "hydrate": Js.Undefined.fromOption(hydrate),
      "wrapper": Js.Undefined.fromOption(wrapper),
      "queries": Js.Undefined.fromOption(queries),
    },
  )
}

let debug = (result, ~el=?, ~maxLengthToPrint=?, ()) =>
  _debug(result, Js.Undefined.fromOption(el), Js.Undefined.fromOption(maxLengthToPrint))
