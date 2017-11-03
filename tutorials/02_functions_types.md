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

As was in the previous lesson, you can specify type of any expression directly or by it's name via `::` operator-like keyword "has-type". It is mandatory only in case of ambiguity because Haskell's type system has type inference (it can analyze what type the expression should have). Type of expression cannot change - it is static typing.

```haskell
a :: Integer
b :: String

a = 42
b = a
c = (a + 7) :: Double
```

Haskell does not have implicit conversion and if you do something like it is in example above, you will get an error during compilation. Type system is very strict and helps programmers to find more bugs during compile time and not during runtime (where is more problematic to find it).

```
    Couldn`t match type ‘Integer’ with ‘[Char]’
    Expected type: String
      Actual type: Integer
    In the expression: a
    In an equation for ‘b’: b = a
```

In some cases (function type and others) you can see typeclass constraints like here:

```haskell
next :: Num a => a -> a
next x = x + 1
```

It says `next` has a type `a` to `a` where `a` is "from" typeclass `Num` (typeclasses will be covered later, for now it is just class or types). Such type signature can be even more complex.

```haskell
foo :: (Show a, Eq a, Read b) => a -> b -> a
```

### Function declaration

Although type can be in most cases inferred automatically by compiler, it is good practice to write it down at least in case of functions as part of code documentation. Functions can be complicated and by reading its type signature you know immediately what arguments it expects and what it returns.

Declaration of function is simple, just use the prefix notation as you would call the function and then describe what is it equal to.

```haskell
fibonacci   :: Word -> Integer
fibonacci 0 = 1
fibonacci 1 = 1
fibonacci n = (fibonacci n-1) + (fibonacci n-2)
```

### Type declaration

There are three basic way how to introduce your own data type:

1. type synonym = you just use different name for some existing type (for example `String` is type synonym for `[Char]` = list of `Char`)
2. new data type = declare type with type constructor (before `=`) and one ore more data constructors (after `=`, separated by `|`), you may use typeclass constraints, type variables and recursion
3. newtype = new data type with exactly one data constructor with one parameter (new type is isomorphic with the "wrapped" type and compiler can do optimizations, can be used also in other way in more advanced code)

```haskell
type String = [Char]

data Bool = True | False
data Tree a = Leaf a | Branch (Tree a) (Tree a)
            deriving (Show, Read)

newtype Age = Age Int

myTree :: Tree Int
myTree = Branch (Leaf -7) (Branch (Leaf 7) (Leaf 10))

myAge :: Age
myAge = Age 20
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

### Type variable

### Type and data constructor

Get back to creating own data types with the `data` keyword.

### Algebraic Data Types (ADTs)

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
