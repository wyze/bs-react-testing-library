open Jest;

module Test = {
  let component = ReasonReact.statelessComponent("Test");

  let make = (~spy, _) => {
    ...component,
    willUnmount: (_) => { spy(); },
    render: (_) => <div />,
  };
};

module Greeting = {
  let component = ReasonReact.statelessComponent("Greeting");

  let make = (~message, _) => {
    ...component,
    render: (_) => <div>{ReasonReact.string(message)}</div>,
  };
};

external unsafeAsElement : Dom.node => Dom.element = "%identity";
[@bs.get] external firstChild : Dom.element => Dom.node = "firstChild";
[@bs.get] external innerHTML : Dom.node => string = "innerHTML";

describe("ReactTestingLibrary", () => {
  open ReactTestingLibrary;
  open Expect;

  let element = (
    <div style=ReactDOMRe.Style.make(~color="rebeccapurple", ())>
      (
        ReasonReact.cloneElement(
          <h1 />,
          ~props={"data-testid": "h1-heading"},
          [|ReasonReact.string("Heading")|]
        )
      )
    </div>
  );

  test("render works", () => {
    element
      |> render
      |> expect
      |> toMatchSnapshot;
  });

  test("getByTestId works", () => {
    element
      |> render
      |> getByTestId("h1-heading")
      |> expect
      |> toMatchSnapshot;
  });

  describe("debug", () => {
    beforeEach(() => {
      [%raw {|jest.spyOn(console, 'log').mockImplementation(() => {})|}];
    });

    afterEach(() => {
      [%raw {|console.log.mockRestore()|}];
    });

    test("works", () => {
      let _ = element |> render |> debug();

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('Heading')
        )
      |}];

      pass;
    });

    test("works with element argument", () => {
      let result = element |> render;
      let el = result |> container |> firstChild |> unsafeAsElement;

      let _ = result |> debug(~el, ());

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('Heading')
        )
      |}];

      pass;
    });

    test("works with maxLengthToPrint argument", () => {
      let result = element |> render;
      let el = result |> container |> firstChild |> unsafeAsElement;

      let _ = result |> debug(~el, ~maxLengthToPrint=10, ());

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('<div>...')
        )
      |}];

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

  test("asFragment works", () => {
    element
      |> render
      |> asFragment()
      |> expect
      |> toMatchSnapshot;
  });
});
