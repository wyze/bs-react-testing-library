open Jest;

module Test = {
  let component = ReasonReact.statelessComponent("Test");

  let make = (~spy, _) => {
    ...component,
    willUnmount: _ => {
      spy();
    },
    render: _ => <div />,
  };
};

module Greeting = {
  let component = ReasonReact.statelessComponent("Greeting");

  let make = (~message, _) => {
    ...component,
    render: _ => <div> {ReasonReact.string(message)} </div>,
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
  });

  // ByTestId
  describe("ByTestId", () => {
    let _ = ();

    test("getByTestId works", () =>
      element
      |> render
      |> getByTestId(~matcher=`Str("h1-heading"))
      |> expect
      |> toMatchSnapshot
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

      let _ = result |> debug(~el, ~maxLengthToPrint=10, ());

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw
        {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('<div>...')
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
});
