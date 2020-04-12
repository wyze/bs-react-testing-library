# bs-react-testing-library &middot; [![Build Status][actions-image]][actions-url] [![npm][npm-image]][npm-url] [![Codecov][codecov-image]][codecov-url]

> [BuckleScript](//github.com/BuckleScript/bucklescript) bindings for [react-testing-library](//github.com/kentcdodds/react-testing-library).

## Documentation

[**Read the docs**](//testing-library.com/docs/bs-react-testing-library/intro) | [Edit the docs](//github.com/alexkrolick/testing-library-docs)

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

#### With [`bs-jest`](//github.com/glennsl/bs-jest)

```ocaml
/* Component_test.re */

open Jest;
open Expect;
open ReactTestingLibrary;

test("Component renders", () =>
  <div style=ReactDOMRe.Style.make(~color="rebeccapurple", ())>
    <h1> {ReasonReact.string("Heading")} </h1>
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

### [v0.7.0](https://github.com/wyze/bs-react-testing-library/releases/tag/v0.7.0) (2020-04-10)

* Fix linguist to map files to Reason ([@wyze](https://github.com/wyze) in [ef9fb26](https://github.com/wyze/bs-react-testing-library/commit/ef9fb26))
* Upgrade devDependencies to latest versions ([@wyze](https://github.com/wyze) in [b4705a9](https://github.com/wyze/bs-react-testing-library/commit/b4705a9))
* Upgrade underlaying library ([@jihchi](https://github.com/jihchi) in [#13](https://github.com/wyze/bs-react-testing-library/pull/13))
* Remove warnings for implicit external names ([@justinba1010](https://github.com/justinba1010) in [#9](https://github.com/wyze/bs-react-testing-library/pull/9))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[actions-image]: https://img.shields.io/github/workflow/status/wyze/bs-react-testing-library/CI.svg?style=flat-square
[actions-url]: https://github.com/wyze/bs-react-testing-library/actions

[npm-image]: https://img.shields.io/npm/v/bs-react-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-react-testing-library

[codecov-image]: https://img.shields.io/codecov/c/github/wyze/bs-react-testing-library.svg?style=flat-square
[codecov-url]: https://codecov.io/github/wyze/bs-react-testing-library
