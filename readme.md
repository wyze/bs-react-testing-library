# rescript-react-testing-library &middot; [![Build Status][actions-image]][actions-url] [![npm][npm-image]][npm-url] [![Codecov][codecov-image]][codecov-url]

> [ReScript](//github.com/rescript-lang/rescript-compiler) bindings for [react-testing-library](//github.com/testing-library/react-testing-library).

## Documentation

[**Read the docs**](//testing-library.com/docs/rescript-react-testing-library/intro) | [Edit the docs](//github.com/testing-library/testing-library-docs/tree/master/docs/bs-react-testing-library)

## Installation

```sh
$ yarn add --dev rescript-react-testing-library

# or..

$ npm install --save-dev rescript-react-testing-library
```

## Usage

#### Add to `bsconfig.json`

```json
{
  "bs-dev-dependencies": [
    "rescript-react-testing-library"
  ]
}
```

#### With [`bs-jest`](//github.com/glennsl/bs-jest)

```ocaml
/* Component_test.re */

open Jest;
open Expect;
open ReactTestingLibrary;

test("Component renders", () =>
  <div style=ReactDOM.Style.make(~color="rebeccapurple", ())>
    <h1> {React.string("Heading")} </h1>
  </div>
  |> render
  |> container
  |> expect
  |> toMatchSnapshot
);
```

## Examples

See [`src/__tests__`](src/__tests__) for some examples.

## Development

```sh
$ git clone https://github.com/tomvardasca/rescript-react-testing-library.git
$ cd rescript-react-testing-library
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

### [v0.9.0](https://github.com/tomvardasca/rescript-react-testing-library/releases/tag/v0.9.0) (2021-02-16)

* Upgrade to latest dependencies and upgrade to `@rescript/react`
* Change repo and package name from `bs-react-testing-library` to `rescript-react-testing-library`

## License

MIT © [Neil Kistner](https://neilkistner.com) and Tomé Vardasca

[actions-image]: https://img.shields.io/github/workflow/status/tomvardasca/rescript-react-testing-library/CI.svg?style=flat-square
[actions-url]: https://github.com/tomvardasca/rescript-react-testing-library/actions

[npm-image]: https://img.shields.io/npm/v/rescript-react-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/rescript-react-testing-library

[codecov-image]: https://img.shields.io/codecov/c/github/tomvardasca/rescript-react-testing-library.svg?style=flat-square
[codecov-url]: https://codecov.io/github/tomvardasca/rescript-react-testing-library
