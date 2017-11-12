# Typeclasses

## What is typeclass?

Typeclass is class of types with definition of common functions for all instances of that class. It is allowing polymorphism and you can imagine it as interfaces in other languages.

### Kinds

In type theory, a kind is the type of a type constructor or, less commonly, the type of a higher-order type operator. A kind system is essentially a simply typed lambda calculus 'one level up,' endowed with a primitive type, denoted * and called 'type', which is the kind of any (monomorphic) data type. Simply you can observe this with GHCi and `:kind` command on various types. For example kind `* -> *` tells that you need to specify one type argument to create type with kind `*` so you can have values of it.

```
Prelude> :kind Integer
Integer :: *
Prelude> :kind Maybe
Maybe :: * -> *
Prelude> :kind Either
Either :: * -> * -> *
Prelude> :kind (Either Integer)
(Either Integer) :: * -> *
Prelude> :kind (Either Integer String)
(Either Integer String) :: *

```

### Polymorfism

https://en.wikibooks.org/wiki/Haskell/Polymorphism

### Own typeclass and instance

There are many defined typeclasses and basic types which are instances of those classes. You can create your own on top of it if you need more.

```haskell
class CSVExportable a where
    headings :: a -> [String]
    toList :: a -> String
    toCSV :: a -> String
    headingsCSV :: a -> String
```

*TODO example*

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
Prelude> data Tree a = Leaf a | Node (Tree a) (Tree a) deriving (Show, Read)
Prelude>
Prelude> myTree = Node (Leaf 8) (Node (Leaf 70) (Leaf 15))
Prelude> show myTree
"Node (Leaf 8) (Node (Leaf 70) (Leaf 15))"
Prelude> read "Node (Leaf 5) (Leaf 100)"
*** Exception: Prelude.read: no parse
Prelude> (read "Node (Leaf 5) (Leaf 100)") :: Tree Int
Node (Leaf 5) (Leaf 100)

Prelude> :info Show
class Show a where
  showsPrec :: Int -> a -> ShowS
  show :: a -> String
  showList :: [a] -> ShowS
  {-# MINIMAL showsPrec | show #-}
  	-- Defined in ‘GHC.Show’

...
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
Prelude> :info Eq
class Eq a where
  (==) :: a -> a -> Bool
  (/=) :: a -> a -> Bool
  {-# MINIMAL (==) | (/=) #-}
  	-- Defined in ‘GHC.Classes’
...

Prelude> :info Ord
class Eq a => Ord a where
  compare :: a -> a -> Ordering
  (<) :: a -> a -> Bool
  (<=) :: a -> a -> Bool
  (>) :: a -> a -> Bool
  (>=) :: a -> a -> Bool
  max :: a -> a -> a
  min :: a -> a -> a
  {-# MINIMAL compare | (<=) #-}
  	-- Defined in ‘GHC.Classes’
...
```

## Task assignment

## Further reading

* [Learn You a Haskell for Great Good](http://learnyouahaskell.com) (chapters 3 and 8)
* [Typeclassopedia](https://wiki.haskell.org/Typeclassopedia)
* [Haskell - OOP vs type classes](https://wiki.haskell.org/OOP_vs_type_classes)
* [WikiBooks - Haskell: Classes and types](https://en.wikibooks.org/wiki/Haskell/Classes_and_types)

