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

@bs.module("@testing-library/react")
external cleanup: unit => unit = "cleanup"

let act: (unit => unit) => unit

@bs.get external container: renderResult => Dom.element = "container"

@bs.get external baseElement: renderResult => Dom.element = "baseElement"

@bs.send.pipe(: renderResult) external unmount: unit => bool = "unmount"

@bs.send.pipe(: renderResult)
external asFragment: unit => Dom.element = "asFragment"

// ByLabelText
let getByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => Dom.element

let getAllByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByLabelText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByLabelTextQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByPlaceholderText
let getByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => Dom.element

let getAllByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByPlaceholderText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByPlaceholderTextQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByText
let getByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => Dom.element

let getAllByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByTextQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByAltText
let getByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => Dom.element

let getAllByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByAltText: (
  ~matcher: [#Func((string, Dom.element) => bool) | #RegExp(Js.Re.t) | #Str(string)],
  ~options: DomTestingLibrary.ByAltTextQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByTitle
let getByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => Dom.element

let getAllByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByTitle: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTitleQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByDisplayValue
let getByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => Dom.element

let getAllByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByDisplayValue: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByDisplayValueQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByRole
let getByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => Dom.element

let getAllByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByRole: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByRoleQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

// ByTestId
let getByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => Dom.element

let getAllByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => array<Dom.element>

let queryByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => Js.null<Dom.element>

let queryAllByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => array<Dom.element>

let findByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => Js.Promise.t<Dom.element>

let findAllByTestId: (
  ~matcher: [#Str(string) | #RegExp(Js.Re.t) | #Func((string, Dom.element) => bool)],
  ~options: DomTestingLibrary.ByTestIdQuery.options=?,
  renderResult,
) => Js.Promise.t<array<Dom.element>>

@bs.send.pipe(: renderResult)
external rerender: React.element => unit = "rerender"

let render: (
  ~baseElement: Dom.element=?,
  ~container: Dom.element=?,
  ~hydrate: bool=?,
  ~wrapper: Dom.element=?,
  ~queries: queries=?,
  React.element,
) => renderResult

let debug: (~el: Dom.element=?, ~maxLengthToPrint: int=?, unit, renderResult) => unit
