module FireEvent: {
  let abort: (~eventInit: {..}=?, Dom.element) => unit
  let animationEnd: (~eventInit: {..}=?, Dom.element) => unit
  let animationIteration: (~eventInit: {..}=?, Dom.element) => unit
  let animationStart: (~eventInit: {..}=?, Dom.element) => unit
  let blur: (~eventInit: {..}=?, Dom.element) => unit
  let canPlay: (~eventInit: {..}=?, Dom.element) => unit
  let canPlayThrough: (~eventInit: {..}=?, Dom.element) => unit
  let change: (~eventInit: {..}=?, Dom.element) => unit
  let click: (~eventInit: {..}=?, Dom.element) => unit
  let compositionEnd: (~eventInit: {..}=?, Dom.element) => unit
  let compositionStart: (~eventInit: {..}=?, Dom.element) => unit
  let compositionUpdate: (~eventInit: {..}=?, Dom.element) => unit
  let contextMenu: (~eventInit: {..}=?, Dom.element) => unit
  let copy: (~eventInit: {..}=?, Dom.element) => unit
  let cut: (~eventInit: {..}=?, Dom.element) => unit
  let dblClick: (~eventInit: {..}=?, Dom.element) => unit
  let doubleClick: (~eventInit: {..}=?, Dom.element) => unit
  let drag: (~eventInit: {..}=?, Dom.element) => unit
  let dragEnd: (~eventInit: {..}=?, Dom.element) => unit
  let dragEnter: (~eventInit: {..}=?, Dom.element) => unit
  let dragExit: (~eventInit: {..}=?, Dom.element) => unit
  let dragLeave: (~eventInit: {..}=?, Dom.element) => unit
  let dragOver: (~eventInit: {..}=?, Dom.element) => unit
  let dragStart: (~eventInit: {..}=?, Dom.element) => unit
  let drop: (~eventInit: {..}=?, Dom.element) => unit
  let durationChange: (~eventInit: {..}=?, Dom.element) => unit
  let emptied: (~eventInit: {..}=?, Dom.element) => unit
  let encrypted: (~eventInit: {..}=?, Dom.element) => unit
  let ended: (~eventInit: {..}=?, Dom.element) => unit
  let error: (~eventInit: {..}=?, Dom.element) => unit
  let focus: (~eventInit: {..}=?, Dom.element) => unit
  let focusIn: (~eventInit: {..}=?, Dom.element) => unit
  let focusOut: (~eventInit: {..}=?, Dom.element) => unit
  let input: (~eventInit: {..}=?, Dom.element) => unit
  let invalid: (~eventInit: {..}=?, Dom.element) => unit
  let keyDown: (~eventInit: {..}=?, Dom.element) => unit
  let keyPress: (~eventInit: {..}=?, Dom.element) => unit
  let keyUp: (~eventInit: {..}=?, Dom.element) => unit
  let load: (~eventInit: {..}=?, Dom.element) => unit
  let loadStart: (~eventInit: {..}=?, Dom.element) => unit
  let loadedData: (~eventInit: {..}=?, Dom.element) => unit
  let loadedMetadata: (~eventInit: {..}=?, Dom.element) => unit
  let mouseDown: (~eventInit: {..}=?, Dom.element) => unit
  let mouseEnter: (~eventInit: {..}=?, Dom.element) => unit
  let mouseLeave: (~eventInit: {..}=?, Dom.element) => unit
  let mouseMove: (~eventInit: {..}=?, Dom.element) => unit
  let mouseOut: (~eventInit: {..}=?, Dom.element) => unit
  let mouseOver: (~eventInit: {..}=?, Dom.element) => unit
  let mouseUp: (~eventInit: {..}=?, Dom.element) => unit
  let paste: (~eventInit: {..}=?, Dom.element) => unit
  let pause: (~eventInit: {..}=?, Dom.element) => unit
  let play: (~eventInit: {..}=?, Dom.element) => unit
  let playing: (~eventInit: {..}=?, Dom.element) => unit
  let progress: (~eventInit: {..}=?, Dom.element) => unit
  let rateChange: (~eventInit: {..}=?, Dom.element) => unit
  let scroll: (~eventInit: {..}=?, Dom.element) => unit
  let seeked: (~eventInit: {..}=?, Dom.element) => unit
  let seeking: (~eventInit: {..}=?, Dom.element) => unit
  let select: (~eventInit: {..}=?, Dom.element) => unit
  let stalled: (~eventInit: {..}=?, Dom.element) => unit
  let submit: (~eventInit: {..}=?, Dom.element) => unit
  let suspend: (~eventInit: {..}=?, Dom.element) => unit
  let timeUpdate: (~eventInit: {..}=?, Dom.element) => unit
  let touchCancel: (~eventInit: {..}=?, Dom.element) => unit
  let touchEnd: (~eventInit: {..}=?, Dom.element) => unit
  let touchMove: (~eventInit: {..}=?, Dom.element) => unit
  let touchStart: (~eventInit: {..}=?, Dom.element) => unit
  let transitionEnd: (~eventInit: {..}=?, Dom.element) => unit
  let volumeChange: (~eventInit: {..}=?, Dom.element) => unit
  let waiting: (~eventInit: {..}=?, Dom.element) => unit
  let wheel: (~eventInit: {..}=?, Dom.element) => unit
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

let act: (unit => unit) => unit

@get external container: renderResult => Dom.element = "container"
@get external baseElement: renderResult => Dom.element = "baseElement"

@send external unmount: (renderResult, unit) => bool = "unmount"
@send external asFragment: (renderResult, unit) => Dom.element = "asFragment"

// ByLabelText
let getByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => Dom.element

let getAllByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => array<Dom.element>

let queryByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => array<Dom.element>

let findByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByPlaceholderText
let getByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => Dom.element

let getAllByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => array<Dom.element>

let queryByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => array<Dom.element>

let findByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByText
let getByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => Dom.element

let getAllByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => array<Dom.element>

let queryByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => array<Dom.element>

let findByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByAltText
let getByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => Dom.element

let getAllByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => array<Dom.element>

let queryByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => array<Dom.element>

let findByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByTitle
let getByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => Dom.element

let getAllByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => array<Dom.element>

let queryByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => array<Dom.element>

let findByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByDisplayValue
let getByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => Dom.element

let getAllByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => array<Dom.element>

let queryByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => array<Dom.element>

let findByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByRole
let getByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => Dom.element

let getAllByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => array<Dom.element>

let queryByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => array<Dom.element>

let findByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

// ByTestId
let getByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
 ()) => Dom.element

let getAllByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => array<Dom.element>

let queryByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => Js.null<Dom.element>

let queryAllByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => array<Dom.element>

let findByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => Js.Promise.t<Dom.element>

let findAllByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => Js.Promise.t<array<Dom.element>>

@send external rerender: (renderResult, ReasonReact.reactElement) => unit = "rerender"

let render: (
  ReasonReact.reactElement,
  ~baseElement: Dom.element=?,
  ~container: Dom.element=?,
  ~hydrate: bool=?,
  ~wrapper: Dom.element=?,
  ~queries: queries=?,
  ()
  ) => renderResult

let debug: (renderResult, ~el: Dom.element=?, ~maxLengthToPrint: int=?, unit) => unit
