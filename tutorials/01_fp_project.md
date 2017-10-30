# FP and first Haskell app

## Functional programming concepts

## Haskell - the programming language

[Haskell] is pure functional programming language with strong static typing and non-strict evaluation. It is also standardized (actual standard is [Haskell 2010] and 2020 is under development). Although it is language with academic and strong math background, it is being used in [research][haskell_research], [education][haskell_education] as well as in [industry][haskell_industry] for various projects. It was created as one common language based on many previous functional languages during 1990s. Main language implementation is [Glasgow Haskell Compiler (GHC)][GHC], which we will use intesively in this course.

[haskell_research]: https://wiki.haskell.org/Haskell_in_research
[haskell_education]: https://wiki.haskell.org/Haskell_in_education
[haskell_industry]: https://wiki.haskell.org/Haskell_in_industry

## Tools we use

1. [GHC] = the compiler. There are some more (Hugs, NHC, JHC, UHC, etc.), but this is classified as most widely used.
2. [Cabal] = system for building and packaging.
3. [Stack] = managing Haskell projects, works with [Cabal] for you.

:point_right: Please now install these (follow instructions at official sites or your OS/distribution).

### Sites for searing

1. [Hoogle] = "Google" for Haskell world
2. [Hayoo!] = "Yahoo" for Haskell world
3. [Hackage] = package archive, here are packages which can you install and use standalone or as modules for your projects (similar to PyPI for Python, RubyGems for Ruby, etc.)
4. [Stackage] = package archive, alternative to [Hackage], only stable packages

:point_right: Take a look at them...

### Haskell and JavaScript

If you like to build (frontend/backend) JavaScript applications you can do that nicely with Haskell. There are multiple options, most known are:

1. [GHCJS]
2. [Haste]
3. [PureScript]

This is nice example for practical usage of Haskell for web projects! It is so much easier (and safer) to write JavaScript in Haskell than just plain JavaScript...

## Try to be interactive

Now you should have [GHC] installed, you can test it out with

```
$ ghc --version

```

First, let's try the interactive environment and evaluate some basic expression.

```
$ ghci

```

### Basic math

### Types

### Variables

### Source file

## First project

We tried some basic work with the interactive environment which is nice but how is it related to real world application? As you know from other programming languages the code should be places in source files and those should be compiled to executable (or to JavaScript as we mentioned before).

### Source file and compilation

Let's try a classic way with compilation via plain [GHC].

### Stack project instead

Compiling many related files could get complicated but luckily we have [Stack].

## Task assignment

## Further reading




[Cabal]: https://www.haskell.org/cabal/
[GHC]: https://www.haskell.org/ghc/
[GHCJS]: https://github.com/ghcjs/ghcjs
[Hackage]: https://hackage.haskell.org
[Haskell]: https://www.haskell.org
[Haskell 2010]: https://www.haskell.org/onlinereport/haskell2010/
[Haste]: https://haste-lang.org
[Hayoo!]: https://hayoo.fh-wedel.de
[Hoogle]: https://www.haskell.org/hoogle/
[PureScript]: http://www.purescript.org
[Stack]: https://docs.haskellstack.org
[Stackage]: https://www.stackage.org