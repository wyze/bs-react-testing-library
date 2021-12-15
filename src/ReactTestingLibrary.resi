module FireEvent: {
  let abort: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let animationEnd: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let animationIteration: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let animationStart: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let blur: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let canPlay: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let canPlayThrough: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let change: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let click: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let compositionEnd: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let compositionStart: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let compositionUpdate: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let contextMenu: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let copy: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let cut: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dblClick: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let doubleClick: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let drag: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragEnd: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragEnter: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragExit: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragLeave: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragOver: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let dragStart: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let drop: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let durationChange: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let emptied: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let encrypted: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let ended: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let error: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let focus: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let focusIn: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let focusOut: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let input: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let invalid: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let keyDown: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let keyPress: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let keyUp: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let load: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let loadStart: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let loadedData: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let loadedMetadata: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseDown: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseEnter: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseLeave: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseMove: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseOut: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseOver: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let mouseUp: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let paste: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let pause: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let play: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let playing: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let progress: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let rateChange: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let scroll: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let seeked: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let seeking: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let select: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let stalled: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let submit: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let suspend: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let timeUpdate: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let touchCancel: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let touchEnd: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let touchMove: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let touchStart: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let transitionEnd: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let volumeChange: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let waiting: (Dom.element,  ~eventInit: {..}=?, unit) => unit
  let wheel: (Dom.element,  ~eventInit: {..}=?, unit) => unit
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
  ()) => Promise.t<Dom.element>

let findAllByLabelText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByPlaceholderText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByAltText: (
  renderResult,
  ~matcher: [
    | #Func((string, Dom.element) => bool)
    | #RegExp(Js.Re.t)
    | #Str(string)
  ],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByTitle: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByDisplayValue: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByRole: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

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
  ()) => Promise.t<Dom.element>

let findAllByTestId: (
  renderResult,
  ~matcher: [
    | #Str(string)
    | #RegExp(Js.Re.t)
    | #Func((string, Dom.element) => bool)
  ],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  ()) => Promise.t<array<Dom.element>>

@send external rerender: (renderResult, React.element) => unit = "rerender"

let render: (
  React.element,
  ~baseElement: Dom.element=?,
  ~container: Dom.element=?,
  ~hydrate: bool=?,
  ~wrapper: Dom.element=?,
  ~queries: queries=?,
  ()
  ) => renderResult

let debug: (renderResult, ~el: Dom.element=?, ~maxLengthToPrint: int=?, unit) => unit
