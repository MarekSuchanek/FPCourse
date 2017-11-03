# Structuration and branching

## If and case

As in other languages, in Haskell you can use `if-then-else` and `case-of` (similar to `switch-case`) expression for branching the computation. But here it is slightly different...

### Own ifThenElse

First, let's try to implement own function realises the `if-then-else` branching. What would be the type of such function? We need the condition which is obviously of type `Bool` and then there are two expressions, one is evaluated if condition is `True` and the other if it is `False`. We can allow any type of such expression by type variable `a` and it will be the return type as well.

```haskell
ifThenElse :: Bool -> a -> a -> a
ifThenElse condition onTrue onFalse = ...
```

But how to implement it without actually using `if-then-else` keywords? Just by definition and expected behavior - when `condition` is `True`, then result is `onTrue` and if it is `False` then `onFalse`.

```haskell
ifThenElse :: Bool -> a -> a -> a
ifThenElse True  onTrue onFalse = onTrue
ifThenElse False onTrue onFalse = onFalse
```

We can even simplify it a bit with ignoring the other argument:

```haskell
ifThenElse :: Bool -> a -> a -> a
ifThenElse True  onTrue  _ = onTrue
ifThenElse False _ onFalse = onFalse
```

We can test our implementation of `ifThenElse` in GHCi and we can see that it works pretty well:

```
*Main> x = 7
*Main> y = 15
*Main> ifThenElse (x < y) (y - x) (x - y)
8
*Main> x = 50
*Main> ifThenElse (x < y) (y - x) (x - y)
35
```

### If, then, else keywords

We can see that we are able to implement very simply our own `ifThenElse` but it is not very readable and using nested ifs would be even worse. So from now on we will use keywords instead:

```
*Main> if (x < y) then (y - x) else (x - y)
35
*Main> if (x < y) then (y - x) else if (x == y) then 0 else (x - y)
35
*Main> y = 50
*Main> if (x < y) then (y - x) else if (x == y) then 0 else (x - y)
0
```

It is good to realize that nested `if` is not a magic but just and expression used for `else` branch:

```
*Main> if (x < y) then (y - x) else (if (x == y) then 0 else (x - y))
0
```

### Case of

Instead of `switch-case` Haskell offers `case-of` expression:

```haskell
data Color = Black | White | RGB Int Int Int

badDescribeBW :: Color -> String
badDescribeBW c = case c of
       Black           -> "black"
       White           -> "white"

describeBW :: Color -> String
describeBW c = case c of
       Black           -> "black"
       White           -> "white"
       RGB 0 0 0       -> "black"
       RGB 255 255 255 -> "white"
       _               -> "unknown"  -- "default" match
```

You need to be careful that you cover all the cases with `case-of`. If you hit some case which is not covered an exception will come up in runtime:

```
*Main> badDescribeBW (RGB 0 0 0)
"*** Exception: files/03_caseColors.hs:(4,19)-(6,33): Non-exhaustive patterns in case
```

For that you can use underscore `_` which will act as default case matching everything:

```
*Main> describeBW (RGB 0 0 0)
"black"
*Main> describeBW (RGB 7 7 7)
"unknown"
```

## Guards and patterns

Another widely used way how create branches is by guards in function declarations. That allows you much more than matching shown in `ifThenElse`. Then you can also use patterns to easily work with some structures in branching.

### Guards

Guards are done by `|` operator-like keyword after introducing a function name and arguments as in following example. Then you can write boolean expressions instead of nested ifs and what should be the result in such case. The `otherwise` is the same meaning as `True` and so as `_` in `case-of` expression, you can notice the similarity with mathematical definitions of some functions.

```
myMax :: (Ord a) => a -> a -> a
myMax a b
    | a > b     = a
    | otherwise = b
```

### Wildcards and patterns

### List guards

### Named patterns

## Let in, where

### Let in

### Where

### Where with guards

## Modules and imports

### Module specification

### Import something

### Qualified import

### Hiding import

## Task assignment

## Further reading
