# Interesting stuff around Haskell

## Debugging

You should already know how to use GHC and GHCi to compile, link and examine Haskell programs. The simplest tool to use for debugging is the `trace` from [Debug.Trace](https://hackage.haskell.org/package/base.0/docs/Debug-Trace.html) which outputs the trace message given as its first argument, before returning the second argument as its result.

For example:

```haskell
func a b = trace ("func " ++ show a ++ " " ++ show b) undefined
```

If you need more than just that, you can use [GHCi debugger](https://downloads.haskell.org/~ghc/7.4.1/docs/html/users_guide/ghci-debugger.html) (other compilers, such as Hugs, have some different), which allows:

* setting breakpoints and stepping,
* inspecting variables,
* tracing,
* working with exceptions,
* and so on.

## Concurrency and optimizations

Just like with GCC, you can use optimization flags with GHC. You can also drill deeper in your source code and optimize it by hand, use FFI, parallelism or concurrency, and so on in order to achieve faster computation. Good resource for that is [wiki.haskell.org/Performance](https://wiki.haskell.org/Performance) where you can look up hints for specific parts of you app and/or your compiler.

For parallelism and concurrency visit [wiki.haskell.org/Parallel](https://wiki.haskell.org/Parallel). You can both:

* run parallel threads with Control.Parallel,
* run simultaneous IO actions with forks.

It is also possible to do distributed computations on clusters but it is far beyond the scope of this course.

```haskell
--TODO: Control.Parallel simple example
```

## Benchmarking with Criterion

If you are interested in such optimizations and improving your application or comparing various algorithms or their implementations, then you might find interesting to use benchmarking library. In Haskell is the most used one called [Criterion](http://www.serpentine.com/criterion/). It provides a powerful but simple way to measure software performance. It provides both a framework for executing and analysing benchmarks and a set of driver functions that makes it easy to build and run benchmarks, and to analyse their results.

For simple usage, you just need to work with the `defaultMain` from [Criterion.Main](https://hackage.haskell.org/package/criterion/docs/Criterion-Main.html) as they show in their example:

```haskell
import Criterion.Main

fib m | m < 0     = error "negative!"
      | otherwise = go m
  where go 0 = 0
        go 1 = 1
        go n = go (n-1) + go (n-2)

main = defaultMain [
  bgroup "fib" [ bench "1"  $ whnf fib 1
               , bench "5"  $ whnf fib 5
               , bench "11" $ whnf fib 11
               ]
  ]
```

It has very nice outputs with form of interactive HTML pages with charts and comparisons and have many options to use.

## Dependent types

A dependent type is a type whose definition depends on a value. Such types can be for example:

* pair of integers where the second is greater than the first,
* people with age between 18 and 65,
* string in email format (matches given regex).

Dependent types add complexity to a type system. Deciding the equality of dependent types in a program may require computations. If arbitrary values are allowed in dependent types, then deciding type equality may involve deciding whether two arbitrary programs produce the same result; hence type checking may become undecidable.

### Agda

[Agda](http://wiki.portal.chalmers.se/agda/pmwiki.php) is a dependently typed functional programming language originally developed by Ulf Norell at Chalmers University of Technology with implementation described in his PhD thesis. But current version, Agda 2, is completely rewritten previous Agda from 1999.

Visit https://github.com/agda/agda where are some examples as well!

### Idris

[Idris](https://www.idris-lang.org) is a general-purpose purely functional programming language with dependent types, strict or optional lazy evaluation and features such as a totality checker. Idris is highly affected by Haskell and Agda which is also possible to see in the syntax.

Its features are influenced by Haskell and ML, and include:

* Full dependent types with dependent pattern matching
* Simple foreign function interface (to C)
* Compiler-supported interactive editing: the compiler helps you write code using the types
where clauses, with rule, simple case expressions, pattern matching let and lambda bindings
* Dependent records with projection and update
* Interfaces (similar to type classes in Haskell)
* Type-driven overloading resolution
* `do` notation and idiom brackets
* Indentation significant syntax
* Extensible syntax
* Cumulative universes
* Totality checking
* Hugs style interactive environment

On their website you can find a documentation with [examples](https://www.idris-lang.org/example/) such as Vectors:

```idris
infixr 5 ::

data Vect : Nat -> Type -> Type where
    Nil  : Vect Z a
    (::) : a -> Vect k a -> Vect (S k) a

app : Vect n a -> Vect m a -> Vect (n + m) a
app Nil       ys = ys
app (x :: xs) ys = x :: app xs ys
```

## Further reading

* [Haskell - Debugging](https://wiki.haskell.org/Debugging)
* [Haskell - Performance](https://wiki.haskell.org/Performance)
* [Haskell - Concurrency](https://wiki.haskell.org/Concurrency)
* [GHC - Concurrent and Parallel Haskell](https://downloads.haskell.org/~ghc/7.0.3/docs/html/users_guide/lang-parallel.html)
* [Dependent type](https://en.wikipedia.org/wiki/Dependent_type)

