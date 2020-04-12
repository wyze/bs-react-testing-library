[@coverage exclude_file];

open Jest;

afterAll(Bisect.Runtime.write_coverage_data);

module Greeting = {
  [@react.component]
  let make = (~message) => <div> {ReasonReact.string(message)} </div>;
};

module Counter = {
  type action =
    | Inc
    | Dec;

  [@react.component]
  let make = () => {
    let (state, dispatch) = React.useReducer(
      (state, action) =>
        switch (action) {
        | Inc => state + 1
        | Dec => state - 1
        },
      0
    );

    <div>
      {ReasonReact.string("Count: " ++ string_of_int(state))}
      <button onClick={_event => dispatch(Inc)}>
        {ReasonReact.string("+")}
      </button>
      <button onClick={_event => dispatch(Dec)}>
        {ReasonReact.string("-")}
      </button>
    </div>
  };
};

external unsafeAsElement: Dom.node => Dom.element = "%identity";
[@bs.get] external firstChild: Dom.element => Dom.node = "firstChild";
[@bs.get] external innerHTML: Dom.node => string = "innerHTML";

describe("ReactTestingLibrary", () => {
  open ReactTestingLibrary;
  open Expect;

  let element =
    <div style={ReactDOMRe.Style.make(~color="rebeccapurple", ())}>
      {ReasonReact.cloneElement(
         <h1 />,
         ~props={"data-testid": "h1-heading"},
         [|ReasonReact.string("Heading")|],
       )}
    </div>;

  test("render works", () =>
    element |> render |> expect |> toMatchSnapshot
  );

  // ByLabelText
  describe("ByLabelText", () => {
    let labelText =
      <div>
        <label htmlFor="username-input"> {React.string("Username")} </label>
        <input id="username-input" />
      </div>;

    test("getByLabelText works", () =>
      labelText
      |> render
      |> getByLabelText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByLabelText works", () =>
      labelText
      |> render
      |> getAllByLabelText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByLabelText works", () =>
      labelText
      |> render
      |> queryByLabelText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByLabelText works (element not found)", () =>
      labelText
      |> render
      |> queryByLabelText(~matcher=`Str("!@#$Username!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByLabelText works", () =>
      labelText
      |> render
      |> queryAllByLabelText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByLabelText works", () =>
      labelText
      |> render
      |> findByLabelText(~matcher=`Str("Username"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByLabelText works", () =>
      labelText
      |> render
      |> findAllByLabelText(~matcher=`Str("Username"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByPlaceholderText
  describe("ByPlaceholderText", () => {
    let placeholderText =
      <div>
        <input placeholder="Username" />
        <input placeholder="Password" />
      </div>;

    test("getByPlaceholderText works", () =>
      placeholderText
      |> render
      |> getByPlaceholderText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByPlaceholderText works", () =>
      placeholderText
      |> render
      |> getAllByPlaceholderText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByPlaceholderText works", () =>
      placeholderText
      |> render
      |> queryByPlaceholderText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByPlaceholderText works (element not found)", () =>
      placeholderText
      |> render
      |> queryByPlaceholderText(~matcher=`Str("!@#$Username!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByPlaceholderText works", () =>
      placeholderText
      |> render
      |> queryAllByPlaceholderText(~matcher=`Str("Username"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByPlaceholderText works", () =>
      placeholderText
      |> render
      |> findByPlaceholderText(~matcher=`Str("Username"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByPlaceholderText works", () =>
      placeholderText
      |> render
      |> findAllByPlaceholderText(~matcher=`Str("Username"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByText
  describe("ByText", () => {
    let text =
      <div> <a href="/about"> {React.string({j|About ℹ️|j})} </a> </div>;

    test("getByText works", () =>
      text
      |> render
      |> getByText(~matcher=`Str({j|About ℹ️|j}))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByText works", () =>
      text
      |> render
      |> getAllByText(~matcher=`Str({j|About ℹ️|j}))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByText works", () =>
      text
      |> render
      |> queryByText(~matcher=`Str({j|About ℹ️|j}))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByText works (element not found)", () =>
      text
      |> render
      |> queryByText(~matcher=`Str({j|!@#About ℹ️!@#|j}))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByText works", () =>
      text
      |> render
      |> queryAllByText(~matcher=`Str({j|About ℹ️|j}))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByText works", () =>
      text
      |> render
      |> findByText(~matcher=`Str({j|About ℹ️|j}))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByText works", () =>
      text
      |> render
      |> findAllByText(~matcher=`Str({j|About ℹ️|j}))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByAltText
  describe("ByAltText", () => {
    let altText =
      <div>
        <img alt="Incredibles 1 Poster" src="/incredibles-1.png" />
        <img alt="Incredibles 2 Poster" src="/incredibles-2.png" />
      </div>;

    test("getByAltText works", () =>
      altText
      |> render
      |> getByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByAltText works", () =>
      altText
      |> render
      |> getAllByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByAltText works", () =>
      altText
      |> render
      |> queryByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByAltText works (element not found)", () =>
      altText
      |> render
      |> queryByAltText(~matcher=`Str("!@#$Incredibles 2 Poster!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByAltText works", () =>
      altText
      |> render
      |> queryAllByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByAltText works", () =>
      altText
      |> render
      |> findByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByAltText works", () =>
      altText
      |> render
      |> findAllByAltText(~matcher=`Str("Incredibles 2 Poster"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByTitle
  describe("ByTitle", () => {
    let title =
      <div>
        <span title="Delete" id="2" />
        <svg>
          <title> {React.string("Close")} </title>
          <g> <path /> </g>
        </svg>
      </div>;

    test("getByTitle works", () =>
      title
      |> render
      |> getByTitle(~matcher=`Str("Delete"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByTitle works", () =>
      title
      |> render
      |> getAllByTitle(~matcher=`Str("Delete"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByTitle works", () =>
      title
      |> render
      |> queryByTitle(~matcher=`Str("Delete"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByTitle works (element not found)", () =>
      title
      |> render
      |> queryByTitle(~matcher=`Str("!@#$Delete!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByTitle works", () =>
      title
      |> render
      |> queryAllByTitle(~matcher=`Str("Delete"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByTitle works", () =>
      title
      |> render
      |> findByTitle(~matcher=`Str("Delete"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByTitle works", () =>
      title
      |> render
      |> findAllByTitle(~matcher=`Str("Delete"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByDisplayValue
  describe("ByDisplayValue", () => {
    let title =
      <div>
        <input type_="text" id="lastName" defaultValue="ReasonML" />
      </div>;

    test("getByDisplayValue works", () =>
      title
      |> render
      |> getByDisplayValue(~matcher=`Str("ReasonML"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByDisplayValue works", () =>
      title
      |> render
      |> getAllByDisplayValue(~matcher=`Str("ReasonML"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByDisplayValue works", () =>
      title
      |> render
      |> queryByDisplayValue(~matcher=`Str("ReasonML"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByDisplayValue works (element not found)", () =>
      title
      |> render
      |> queryByDisplayValue(~matcher=`Str("!@#$ReasonML!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByDisplayValue works", () =>
      title
      |> render
      |> queryAllByDisplayValue(~matcher=`Str("ReasonML"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByDisplayValue works", () =>
      title
      |> render
      |> findByDisplayValue(~matcher=`Str("ReasonML"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByDisplayValue works", () =>
      title
      |> render
      |> findAllByDisplayValue(~matcher=`Str("ReasonML"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByRole
  describe("ByRole", () => {
    let role =
      <div role="dialog">
        <img ariaLabel="fancy image" src="fancy.jpg" />
        <button> {React.string("Close dialog")} </button>
      </div>;

    test("getByRole works", () =>
      role
      |> render
      |> getByRole(~matcher=`Str("button"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByRole works", () =>
      role
      |> render
      |> getAllByRole(~matcher=`Str("button"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByRole works", () =>
      role
      |> render
      |> queryByRole(~matcher=`Str("button"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByRole works (element not found)", () =>
      role
      |> render
      |> queryByRole(~matcher=`Str("!@#$button!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByRole works", () =>
      role
      |> render
      |> queryAllByRole(~matcher=`Str("button"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByRole works", () =>
      role
      |> render
      |> findByRole(~matcher=`Str("button"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByRole works", () =>
      role
      |> render
      |> findAllByRole(~matcher=`Str("button"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  // ByTestId
  describe("ByTestId", () => {
    test("getByTestId works", () =>
      element
      |> render
      |> getByTestId(~matcher=`Str("h1-heading"))
      |> expect
      |> toMatchSnapshot
    );

    test("getAllByTestId works", () =>
      element
      |> render
      |> getAllByTestId(~matcher=`Str("h1-heading"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByTestId works", () =>
      element
      |> render
      |> queryByTestId(~matcher=`Str("h1-heading"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryByTestId works (element not found)", () =>
      element
      |> render
      |> queryByTestId(~matcher=`Str("!@#$h1-heading!@#$"))
      |> expect
      |> toMatchSnapshot
    );

    test("queryAllByTestId works", () =>
      element
      |> render
      |> queryAllByTestId(~matcher=`Str("h1-heading"))
      |> expect
      |> toMatchSnapshot
    );

    testPromise("findByTestId works", () =>
      element
      |> render
      |> findByTestId(~matcher=`Str("h1-heading"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );

    testPromise("findAllByTestId works", () =>
      element
      |> render
      |> findAllByTestId(~matcher=`Str("h1-heading"))
      |> Js.Promise.then_(result =>
           result |> expect |> toMatchSnapshot |> Js.Promise.resolve
         )
    );
  });

  describe("debug", () => {
    beforeEach(() => {
      let _ = [%raw
        {|jest.spyOn(console, 'log').mockImplementation(() => {})|}
      ];
      ();
    });

    afterEach(() => {
      let _ = [%raw {|console.log.mockRestore()|}];
      ();
    });

    test("works", () => {
      let _ = element |> render |> debug();

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw
        {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('Heading')
        )
      |}
      ];

      pass;
    });

    test("works with element argument", () => {
      let result = element |> render;
      let el = result |> container |> firstChild |> unsafeAsElement;

      let _ = result |> debug(~el, ());

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw
        {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('Heading')
        )
      |}
      ];

      pass;
    });

    test("works with maxLengthToPrint argument", () => {
      let result = element |> render;
      let el = result |> container |> firstChild |> unsafeAsElement;

      let _ = result |> debug(~el, ~maxLengthToPrint=25, ());

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw
        {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('sty...')
        )
      |}
      ];

      pass;
    });
  });

  test("rerender works", () => {
    let result = render(<Greeting message="hi" />);
    let check = text =>
      result
      |> container
      |> firstChild
      |> innerHTML
      |> expect
      |> toEqual(text);

    check("hi") |> ignore;

    result |> rerender(<Greeting message="hey" />);

    check("hey");
  });

  test("asFragment works", () =>
    element |> render |> asFragment() |> expect |> toMatchSnapshot
  );

  test("act works", () => {
    let result = <Counter /> |> render;

    act(() =>
      result |> getByText(~matcher=`Str("+")) |> FireEvent.click |> ignore
    );

    result
    |> getByText(~matcher=`Str("Count: 1"))
    |> expect
    |> toMatchSnapshot;
  });
});
