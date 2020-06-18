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

### [v0.7.3](https://github.com/wyze/bs-react-testing-library/releases/tag/v0.7.3) (2020-06-18)

* Fix test command ([@wyze](https://github.com/wyze) in [f9c5987](https://github.com/wyze/bs-react-testing-library/commit/f9c5987))
* Bump version for bs-dom-testing-library ([@johnridesabike](https://github.com/johnridesabike) in [#24](https://github.com/wyze/bs-react-testing-library/pull/24))
* Change type of cleanup function ([@denis-ok](https://github.com/denis-ok) in [#23](https://github.com/wyze/bs-react-testing-library/pull/23))
* Use denopkg.com ([@wyze](https://github.com/wyze) in [#22](https://github.com/wyze/bs-react-testing-library/pull/22))
* Update CI to try and work better ([@wyze](https://github.com/wyze) in [#21](https://github.com/wyze/bs-react-testing-library/pull/21))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[actions-image]: https://img.shields.io/github/workflow/status/wyze/bs-react-testing-library/CI.svg?style=flat-square
[actions-url]: https://github.com/wyze/bs-react-testing-library/actions

[npm-image]: https://img.shields.io/npm/v/bs-react-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-react-testing-library

[codecov-image]: https://img.shields.io/codecov/c/github/wyze/bs-react-testing-library.svg?style=flat-square
[codecov-url]: https://codecov.io/github/wyze/bs-react-testing-library
