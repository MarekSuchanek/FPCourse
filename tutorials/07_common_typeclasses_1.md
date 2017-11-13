# Common typeclasses I

Now we are going to spend some with predefined and important typeclasses which capture some important concepts in Haskell that are widely used in any types of projects. Typeclass always say something about the structure of type and what can you do with that. Also there are some laws and it is very tightly related to math and specifically with algebra and theory of categories.

After learning common typeclasses it is not just easier to use them and understand code written by other developer but it also helps with designing own custom typeclasses. You can always find more about typeclass and instances with GHCi `:info` command.

## Monoid (and others from basic algebra)

Monoid is the most simple typeclass we will learn. You can recall the [monoid](https://en.wikipedia.org/wiki/Monoid) them from algebra - it is algebraic structure with one binary operation which is associate and there is also one identity element. Same goes for Haskell - the operation is called `mappend` and identity is `mempty` (first letter `m` if for **m**onoid).

```haskell
class Monoid m where
  mempty  :: m
  mappend :: m -> m -> m
  mconcat :: [m] -> m
  mconcat = foldr mappend mempty
```

The law of monoid says that `mappend` must be associative and `mempty` is real identity when working with `mappend`:

```haskell
mappend x (mappend y z) == mappend (mappend x y) z
-- the same in infix:
x `mappend` (y `mappend` z) == (x `mappend` y) `mappend` z

mappend x mempty == x
mappend mempty x == x
```

If you take a look at the documentation of [Data.Monoid](https://hackage.haskell.org/package/base/docs/Data-Monoid.html), you might notice few more things:

* synonym for `mappend` is `(<>)` so you can simply use it as operator `x <> b` (notice that it is not the same as not-equals in other languages),
* multiple newtypes for specifying monoid for basic type, like `Sum` and `Product` for numeric types, `All` and `Any` for booleans, `First` and `Last` for maybes and few more.

```haskell
-- TODO: Sum & Product
-- TODO: First & Last
```

Of course there are not just `Monoid` from basic algebra. You might find interesting to learn more about:

* [Data.Semigroup](https://hackage.haskell.org/package/base/docs/Data-Semigroup.html) (no identity as is in Monoid),
* [Data.Group, Data.Abelian](https://hackage.haskell.org/package/groups-0.4.0.0/docs/Data-Group.html) (inversions and commutative operation).

It is possible to write own instances of `Monoid` or other typeclasses. Problem is that compiler won't check if laws are valid in your instance. For such checks you can use testing frameworks (esp. property testing) which will be covered later on.

## Functor

A functor is a way to apply a function on values inside some structure that we don’t want to change. For example if you want to change the values in the list, tree or in either without dealing with complexity and internal structure.

```haskell
class Functor f where
  fmap :: (a -> b) -> f a -> f b
```

The definition says that there is a function `fmap` which applies a function of type `a -> b` on elements in functor `f` with inner type `a` and result will be functor `f` with inner type `b`. Moreover there are two laws:

```haskell
-- identity (fmap doesn't do nothing more than applying given function)
fmap id == id
-- composition
fmap (f . g) == fmap f . fmap g
```

Let's try it:

```
-- TODO play with functors
```

Just as with Monoid, you can take a look at the documentation of [Data.Functor](https://hackage.haskell.org/package/base/docs/Data-Functor.html). Again, there is operator alias, in this case `(<$>)` for `fmap`. There are two more similar - `<$` and `$>` (just flipped `<$`).

```
-- TODO play with functors and operators
```

*TODO*: IO Functor, lifting, forall

## Applicative

## Monad

## IO Monad

## Task assignment

## Further reading
