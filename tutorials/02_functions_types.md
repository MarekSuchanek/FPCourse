# Functions and basic data types

## General summary of syntax

### Haskell keywords

There are some [reserved keywords/operators] which have some special meaning in Haskell:

1. operator-like: `!`, `'`, `"`, `-`, `--`, `-<`, `-<<`, `->`, `::`, `;`, `<-`, `,`, `=`, `=>`, `>`, `?`, `#`, `*`, `@`, `\`, `_`, `` ` ``, `|`, `~`
2. brackets-like: `[| |]`, `{ }`, `{- -}`
3. keywords (common): `as`, `case of`, `class`, `data`, `deriving`, `do`, `hiding`, `if then else`, `import`, `infix infixr infixl`, `instance`, `let in`, `module`, `newtype`, `qualified`, `type`, `where`
4. keywords (not so common): `data family`, `data instance`, `default`, `deriving instance`, `forall`, `foreign`, `mdo`, `proc`, `rec`, `type family`, `type instance`

[reserved keywords/operators]: https://wiki.haskell.org/Keywords

### Type signature

### Function declaration

### Type declaration

```haskell
data TypeConstr typeparams = DataConstr params
```


## Data types

Haskell has strong static type system which is one of the things making it so great. As we already saw, every expression in Haskell has some type and the type cannot change during runtime (that is the difference with dynamic typing). As in other programming languages can use predefined data types, get more from some libraries or introduce your own.

### Basic Data Types

* `Int` = A fixed-precision integer type with at least the range `[-2^29 .. 2^29-1]` (exact range can vary based on implementation, it can be check with `minBound` and `maxBound`)
* `Integer` = Arbitrary-precision integers (e.g. theoretically unlimited)
* `Float` = Single-precision floating point numbers
* `Double` = Double-precision floating point numbers
* `Word` = Unsigned integral number (same size as `Int`)
* `Char` = Unicode character (ISO/IEC 10646)
* `Bool` = truth value, only `True` or `False`
* `String` = literally list of characters

### Type and data constructor

### Type variable

### Algebraic Data Types (ADTs)

### Polymorphism

## List and tuple

### Tuple

### List

### String

## Simple functions

### Basic list functions

### Intro to patterns

### Recursion

## Task assignment

## Further reading
