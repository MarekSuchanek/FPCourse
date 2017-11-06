# Typeclasses

## What is typeclass?

Typeclass is class of types with definition of common functions for all instances of that class. It is allowing polymorphism and you can imagine it as interfaces in other languages.

### Kinds

### Polymorfism

### Type constraints

### Own typeclass and instance

## Basic typeclasses

### Deriving

We have already used the keyword `deriving` many times. It is kind of magic which will automatically derive instance of desired typeclass(es) so you don't have to write functions on your own.

You can derive only built-in typeclasses:

* `Eq` = (in)equality based on arguments
* `Ord` = `compare`, `min`, `max` and comparison operators
* `Show` = to `String` conversion
* `Read` = from `String` conversion
* `Enum` = enumerations only (no arguments), list `..` syntax
* `Bounded` = only for enumerations or just one arguments, `minBound` and `maxBound`

### Read and Show

If you derive default implementation of instance for `Show` and `Read` the string representing the data is actually the same as you would write it in Haskell code:

```
-- TODO: show/read in GHCI
```

You can of course make your own instance of those classes where would be representation different but why would you do that - you already like Haskell! When you make own `read` and `show`, you should ensure that after using `read` on string produced by `show` you will get the same data.

```haskell
-- TODO: Read, Show custom instance
```

### Numerics

For numbers there are several builtin typeclasses making the computation more flexible:

* `Num`
  * `Real`
    * `Integral`
    * `RealFrac`
  * `Fractional`
    * `Floating`
    * `RealFloat` (subclass of `Floating` and `RealFrac`)

### Comparison

For comparison there are two basic typeclasses - `Eq` and its subclass `Ord`:

```
-- ord, eq in GHCi
```

You can again implement your own instances of those classes:

```haskell

```

## Task assignment

## Further reading
