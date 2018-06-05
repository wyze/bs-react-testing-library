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

[@bs.get] external firstChild : Dom.element => Dom.node = "";
[@bs.get] external innerHTML : Dom.node => string = "";

describe("ReactTestingLibrary", () => {
  open ReactTestingLibrary;
  open Expect;

  let element = (
    <div style=ReactDOMRe.Style.make(~color="rebeccapurple", ())>
      <h1> {ReasonReact.string("Heading")} </h1>
    </div>
  );

  test("render works", () => {
    element
      |> render
      |> expect
      |> toMatchSnapshot;
  });

  describe("debug", () => {
    open JestJs;

    beforeEach(() => {
      [%raw {|jest.spyOn(console, 'log').mockImplementation(() => {})|}];
    });

    afterEach(() => {
      [%raw {|console.log.mockRestore()|}];
    });

    test("works", () => {
      let _ = element |> render |> debug;

      let _ = [%raw {|expect(console.log).toHaveBeenCalledTimes(1)|}];
      let _ = [%raw {|
        expect(console.log).toHaveBeenCalledWith(
          expect.stringContaining('Heading')
        )
      |}];

      pass;
    });
  });

  describe("renderIntoDocument", () => {
    open JestJs;

    afterEach(cleanup);

    test("works", () => {
      let mock = JestJs.fn(() => ());
      let spy = mock |> MockJs.fn;

      let _ = renderIntoDocument(<Test spy />);

      cleanup();

      let html = [%raw {|document.body.innerHTML|}];

      html |> expect |> toBe("") |> ignore;
      mock |> MockJs.calls |> Array.length |> expect |> toBe(1);
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
});
