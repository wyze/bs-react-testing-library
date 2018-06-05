# bs-react-testing-library

[![Build Status][travis-image]][travis-url]
[![npm][npm-image]][npm-url]

> [BuckleScript](//github.com/BuckleScript/bucklescript) bindings for [react-testing-library](//github.com/kentcdodds/react-testing-library).

## Installation

```sh
$ yarn add --dev bs-react-testing-library

# or..

$ npm install --save-dev bs-react-testing-library
```

## Usage

#### Add to `bsconfig.json`

```json
{
  "bs-dev-dependencies": [
    "bs-react-testing-library"
  ]
}
```

#### With [`bs-jest`](//github.com/reasonml-community/bs-jest)

```ocaml
/* Component_test.re */

open Jest;

describe("Component", () => {
  open Expect;

  test("renders", () => {
    (
      <div style=ReactDOMRe.Style.make(~color="rebeccapurple", ())>
        <h1> {ReasonReact.string("Heading")} </h1>
      </div>
    )
      |> render
      |> expect
      |> toMatchSnapshot;
  });
});
```

## Examples

See [`src/__tests__`](src/__tests__) for some examples.

## Development

```sh
$ git clone https://github.com/wyze/bs-react-testing-library.git
$ cd bs-react-testing-library
$ yarn # or `npm install`
```

## Build

```sh
$ yarn build
```

## Test

```sh
$ yarn test
```

## Change Log

> [Full Change Log](changelog.md)

### [v0.1.0](https://github.com/wyze/bs-react-testing-library/releases/tag/v0.1.0) (2018-06-05)

* [[`7dd8119705`](https://github.com/wyze/bs-react-testing-library/commit/7dd8119705)] - Initial commit (Neil Kistner)

## License

MIT © [Neil Kistner](https://neilkistner.com)

[travis-image]: https://img.shields.io/travis/wyze/bs-react-testing-library.svg?style=flat-square
[travis-url]: https://travis-ci.org/wyze/bs-react-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-react-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-react-testing-library
