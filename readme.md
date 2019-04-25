# bs-react-testing-library &middot; [![Build Status][circleci-image]][circleci-url] [![npm][npm-image]][npm-url] [![Coveralls][coveralls-image]][coveralls-url]

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

### [v0.5.0](https://github.com/wyze/bs-react-testing-library/releases/tag/v0.5.0) (2019-04-24)

* Meta file updates ([@wyze](https://github.com/wyze) in [9e91c93](https://github.com/wyze/bs-react-testing-library/commit/9e91c93))
* Fix `FireEvent` module ([@wyze](https://github.com/wyze) in [2e709fd](https://github.com/wyze/bs-react-testing-library/commit/2e709fd))
* Upgrade dependencies ([@wyze](https://github.com/wyze) in [cd924da](https://github.com/wyze/bs-react-testing-library/commit/cd924da))
* Improve readme example ([@benadamstyles](https://github.com/benadamstyles) in [#2](https://github.com/wyze/bs-react-testing-library/pull/2))

## License

MIT © [Neil Kistner](https://neilkistner.com)

[circleci-image]: https://img.shields.io/circleci/project/github/wyze/bs-react-testing-library.svg?style=flat-square
[circleci-url]: https://circleci.com/gh/wyze/bs-react-testing-library

[npm-image]: https://img.shields.io/npm/v/bs-react-testing-library.svg?style=flat-square
[npm-url]: https://npm.im/bs-react-testing-library

[coveralls-image]: https://img.shields.io/coveralls/github/wyze/bs-react-testing-library.svg?style=flat-square
[coveralls-url]: https://coveralls.io/github/wyze/bs-react-testing-library
