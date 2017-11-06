# FP and first Haskell app

## Functional programming concepts

Functional programming is a programming paradigm (i.e. a style of building the structure and elements of computer programs) that treats computation as the evaluation of mathematical functions and avoids changing-state and mutable data. FP app is made of expressions or declarations instead of statements. Functional programming has its origins in lambda calculus, a formal system developed in the 1930s.

### Lambda calculus

Lambda calculus is good to understand (at least basics) when you want to start with FP. Actually it is not so complicated and quite straightforward.

* [Lambda calculus (wikipedia)](https://en.wikipedia.org/wiki/Lambda_calculus)

### Function as first class-object

Programming language is said to have [first-class functions](https://en.wikipedia.org/wiki/First-class_function) if it treats functions as first-class citizens or objects. It means that the language support following concepts:

* passing function as argument,
* returning function as result,
* anonymous and nested functions,
* closures (and non-local variables),
* assigning functions to variables,
* and equality of functions.

### FP concepts and dictionary

* **Pure function** = function without side effect, always return the same result for the same input
* **Side effect** = modification of non-local state (global variable, input/output, raising exception, call function causing side effect, etc.)
* **Immutable variables** = after setting (binding) name to expression, you can not modify it
* **Referential transparency** = expression is said to be referentially transparent if it can be replaced with its corresponding value without changing the program's behavior
* **Recursion** = recursion occurs when a thing is defined in terms of itself or of its type (applies for functions, for example factorial, and for types, for example tree structure)

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
% ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.0.2
```

First, let's try the interactive environment and evaluate some basic expression.

```
% ghci
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
Prelude> "Hello, world!"
"Hello, world!"
Prelude> putStrLn "Hello, world!"
Hello, world!
```

In prompt you see (by default) imported modules, in this case just `Prelude` - the most basic one. Then you can write and evaluate Haskell expression. In the example above we wrote a string and result was the string (no surprise), we then used a function `putStrLn` to print a string to output (notice that there are no quotes around).

### Basic math & logics

In Haskell you can use math operators as you are used to.

```
Prelude> 5 + 5
10
Prelude> 5 + 5 * 3
20
Prelude> (5 + 5) * 3
30
Prelude> 2 ^ 8
256
Prelude> 2 / 3
0.6666666666666666
```

Integer division and modulo is done by functions. You can call functions in prefix notation (no brackes and no commas needed):

```
Prelude> div 7 2
3
Prelude> mod 7 2
1
```

Same goes for logics and comparison:

```
Prelude> 5 > 7
False
Prelude> 5 == 7
False
Prelude> 5 /= 7
True
Prelude> not (5 /= 7)
False
Prelude> False || True
True
Prelude> False && True
False
Prelude> not False && True
True
```

### Types

Very useful thing in GHCi is that you can check the type of expression.

```
Prelude> :type 2 ^ 8
2 ^ 8 :: Num a => a
Prelude> :type 2 / 3
2 / 3 :: Fractional a => a
```

The double semicolon `::` means "is of type" and you can use it for explicitly stating type of your expressions.

```
Prelude> (2 / 3) :: Double
0.6666666666666666
Prelude> (2 / 3) :: Float
0.6666667
```

More interesting is to do such thing with functions, because we are in functional language! Function `abs` (absolute value) takes a number and returns a number. That means it doesn't work for strings...

The type signature is very math-like... Type of `Num` is for example `Integer` and you know functions from math which have type `Integer -> Integer` (domain and co-domain).

```
Prelude> :type abs
abs :: Num a => a -> a
Prelude> abs (-5)
5
Prelude> abs (-10.65)
10.65
Prelude> abs "z"

<interactive>:26:1: error:
    • No instance for (Num [Char]) arising from a use of ‘abs’
    • In the expression: abs "z"
      In an equation for ‘it’: it = abs "z"
```

The operators are functions as well - this is functional language. All you need to do is put it in brackets. Plus takes two numbers and returns a number. You can then use `(+)` as a function in prefix notation and not infix.

```
Prelude> :type (+)
(+) :: Num a => a -> a -> a
Prelude> (+) 5 4
9
```

On the other hand you might want to use some functions in infix and you need `` ` `` for that.

```
Prelude> :t div
div :: Integral a => a -> a -> a
Prelude> 5 `div` 3
1
Prelude> 5 `mod` 3
2
```

### Giving name to expression

In GHCi you can name an expression with `let` and assignment.

```
Prelude> let x = 5
Prelude> :type x
x :: Num t => t
Prelude> let x = 5 :: Integer
Prelude> :type x
x :: Integer
```

You can create a functions as well. Notice that the type is automatically inferred. It happens everytime when possible and you don't explicitly state the type.

```
Prelude> let myFunc x y = 2 * x + y
Prelude> :t myFunc
myFunc :: Num a => a -> a -> a
Prelude> myFunc 5 3
13
```

### Source file

OK, but if you close GHCi (CTRL+D/Z or `:quit`/`:q`) then you lost your code. For making it persistent you need a source file. You can name with as you like but in Haskell we use `.hs` file extension (or `.lhs` if code is part of document - [literate Haskell]).

Let's create a simple source file `01_test_haskell.hs` and create two functions there. We can also use comments (

```haskell
{-
   My first Haskell source file to be tested out with GHCi

   BTW This is multiline comment
-}

-- This is single line comment

-- First function: Linear function for Integers
linear :: Integer -> Integer -> Integer -> Integer
linear a b x = a * x + b

-- Second function: check if three lenghts form triangle
isTriangle :: Double -> Double -> Double -> Bool
isTriangle a b c = (a + b > c) && (a + c > b) && (b + c > a)
```

Now we can load it with `:load` to GHCi:

```
Prelude> :load FPCourse/files/01_test_haskell.hs
[1 of 1] Compiling Main             ( 01_test_haskell.hs, interpreted )
Ok, modules loaded: Main.
```

You can see that file is being compiled, imported as `Main` and then if everything is OK, you can use it in GHCi. Another useful command in GHCi is `:info` which can tell you where is definition located.

```
*Main> linear 5 3 7
38
*Main> 5 * 7 + 3
38
*Main> :type linear
linear :: Integer -> Integer -> Integer -> Integer
*Main> :info linear
linear :: Integer -> Integer -> Integer -> Integer
  	-- Defined at 01_test_haskell.hs:10:1
```

For browsing content of actual module (in our case `Main`) is great command `:browse` and you can specify which module you want to browse if not just the actual.

```
*Main> :browse
linear :: Integer -> Integer -> Integer -> Integer
isTriangle :: Double -> Double -> Double -> Bool
*Main> :browse Prelude
...
```

Now we can add another function to the file:

```
-- Added function
-- . is function composition (as in math)
isntTriangle = not . isTriangle
```

But you need to recompile the file in GHCi so the change can take effect. You can use `:load` again, but if you don't want to write the filename (and path), you can use `:reload`.

```
*Main> :reload
[1 of 1] Compiling Main             ( 01_test_haskell.hs, interpreted )
Ok, modules loaded: Main.
*Main> :browse
linear :: Integer -> Integer -> Integer -> Integer
isTriangle :: Double -> Double -> Double -> Bool
isntTriangle :: Double -> Double -> Double -> Bool
```

## First project

We tried some basic work with the interactive environment which is nice and useful but how is it related to real world application? As you know from other programming languages the code should be places in source files and those should be compiled to executable (or to JavaScript as we mentioned before).

### Source file and compilation

Let's try a classic way with compilation via plain [GHC]. We can do the most basic program - the "Hello, world!". Create a file `01_hw.hs` just with function `main` as follows:

```haskell
main = putStrLn "Hello, world!"
```

Now use `ghc` compiler to compile the file:

```
% ghc 01_hw.hs
[1 of 1] Compiling Main             ( 01_hw.hs, 01_hw.o )
Linking 01_hw ...
```

You can see some similar output as when you were loading a file in GHCi just here is not interpreting, but linking and `01_hw.o`. If you list your directory, there are now these files:

* `01_hw.hs` = source file
* `01_hw.hi` = interface file (compilation info)
* `01_hw.o` = object file (compiled file before linking)
* `01_hw` = executable (linked)

And you can run the executable:

```
% ./01_hw
Hello, world!
```

Now, let's say we want to have logics in different source file (module). Create a file `01_hw/HWLib.hs` with:

```haskell
module HWLib where

greet :: String -> String
greet x = "Hello, " ++ x ++ "!"
```

And appropriate `01_hw/Main.hs`:

```haskell
import HWLib

main = do
    putStrLn "Enter your name:"
    name <- getLine
    putStrLn (greet name)
```

Now how to make it work together? Do you know `Makefile`s from `C/C++`? Don't worry... GHC is great tool and does such painful work for you (reads imports and looking up the files - you just need to have good naming of modules/files):

```
% ghc --make Main.hs
[1 of 2] Compiling HWLib            ( HWLib.hs, HWLib.o )
[2 of 2] Compiling Main             ( Main.hs, Main.o )
Linking Main ...
% ./Main
Enter your name:
Marek
Hello, Marek!
```

### Stack project instead

Compiling application made from multiple source codes is not so complicated in the end. But still for project management, having project structure nice and especially simple management of dependencies (it can be real pain to get it working with some specific versions) we will use [Stack].

Let's do the *Hello, world!* app with [Stack]. First verify that you have it installed.

```
% stack --version
Version 1.4.0, Git revision e714f1dd3fade19496d91bd6a017e435a96a6bcd (4640 commits) x86_64 hpack-0.17.0
```

Then you can create new project with default template:

```
% stack new HelloWorld
Downloading template "new-template" to create project "HelloWorld" in HelloWorld/ ...

...

Looking for .cabal or package.yaml files to use to init the project.
Using cabal packages:
- HelloWorld/HelloWorld.cabal

Selecting the best among 11 snapshots...

Downloaded lts-9.11 build plan.
Missing some cabal revision files, updating indices
Selected mirror https://s3.amazonaws.com/hackage.fpcomplete.com/
Downloading timestamp
Downloading snapshot
Updating index
Updated package list downloaded
Populated index cache.
* Matches lts-9.11

Selected resolver: lts-9.11
Initialising configuration using resolver: lts-9.11
Total number of user packages considered: 1
Writing configuration to file: HelloWorld/stack.yaml
All done.
```

Now whole project has been created for you. You should edit `HelloWorld.cabal` file which specifies the project (author, email, url, etc.). Then use the same code from previous example to `app/Main.hs` and `src/Lib.hs`.

```haskell
-- src/Lib.hs
module Lib
    ( greet
    ) where

greet :: String -> String
greet x = "Hello, " ++ x ++ "!"
```

```haskell
-- app/Main.hs
module Main where

import Lib

main :: IO ()
main = do
    putStrLn "Enter your name:"
    name <- getLine
    putStrLn (greet name)
```

Now you don't use GHC directly, but call it via `stack build`:

```
% stack build
No compiler found, expected minor version match with ghc-8.0.2 (x86_64) (based on resolver setting in /home/user/.stack/global-project/stack.yaml).
To install the correct GHC into /home/user/.stack/programs/x86_64-linux/, try running "stack setup" or use the "--install-ghc" flag. To use your system GHC installation, run "stack config set system-ghc --global true", or use the "--system-ghc" flag.
```

As you see `stack` doesn't want to use system wide installation of `ghc` but local instead by default. Just run `stack setup` so `stack` will prepare local `ghc` (it will take some time) and then try to build.

```
% stack setup
Preparing to install GHC to an isolated location.
This will not interfere with any system-level installation.
Downloaded ghc-8.0.2.
Installed GHC.
stack will use a sandboxed GHC it installed
For more information on paths, see 'stack path' and 'stack exec env'
To use this GHC and packages outside of a project, consider using:
stack ghc, stack ghci, stack runghc, or stack exec

% stack init
Looking for .cabal or package.yaml files to use to init the project.
Using cabal packages:
- HelloWorld/HelloWorld.cabal

Selecting the best among 11 snapshots...

* Matches lts-9.11

Selected resolver: lts-9.11
Initialising configuration using resolver: lts-9.11
Total number of user packages considered: 1
Writing configuration to file: stack.yaml
All done.

% stack build
Linking /home/user/.stack/setup-exe-cache/x86_64-linux/tmp-Cabal-simple_mPHDZzAJ_1.24.2.0_ghc-8.0.2 ...
HelloWorld-0.1.0.0: configure (lib + exe)
Configuring HelloWorld-0.1.0.0...
HelloWorld-0.1.0.0: build (lib + exe)
Preprocessing library HelloWorld-0.1.0.0...
[1 of 1] Compiling Lib              ( src/Lib.hs, .stack-work/dist/x86_64-linux/Cabal-1.24.2.0/build/Lib.o )
Preprocessing executable 'HelloWorld-exe' for HelloWorld-0.1.0.0...
[1 of 1] Compiling Main             ( app/Main.hs, .stack-work/dist/x86_64-linux/Cabal-1.24.2.0/build/HelloWorld-exe/HelloWorld-exe-tmp/Main.o )
Linking .stack-work/dist/x86_64-linux/Cabal-1.24.2.0/build/HelloWorld-exe/HelloWorld-exe ...
HelloWorld-0.1.0.0: copy/register
Installing library in
/home/user/Projects/CTU/FPCourse/files/01_hw_stack/.stack-work/install/x86_64-linux/lts-9.11/8.0.2/lib/x86_64-linux-ghc-8.0.2/HelloWorld-0.1.0.0-GwaTuTuS4ojL8nYytSjUL5
Installing executable(s) in
/home/user/Projects/CTU/FPCourse/files/01_hw_stack/.stack-work/install/x86_64-linux/lts-9.11/8.0.2/bin
Registering HelloWorld-0.1.0.0...
```

Everything ended up OK and you are finally able to run the application (`HelloWorld-exe` is defined in `HelloWorld.cabal` and you may change it):

```
% stack exec HelloWorld-exe
Enter your name:
Marek
Hello, Marek!
```

For debugging you can run `ghci` with preloaded project:

```
% stack ghci
The following GHC options are incompatible with GHCi and have not been passed to it: -threaded
Configuring GHCi with the following packages: HelloWorld
Using main module: 1. Package `HelloWorld' component exe:HelloWorld-exe with main-is file: /home/user/Projects/CTU/FPCourse/files/01_hw_stack/HelloWorld/app/Main.hs
GHCi, version 8.0.2: http://www.haskell.org/ghc/  :? for help
[1 of 1] Compiling Lib              ( /home/user/Projects/CTU/FPCourse/files/01_hw_stack/HelloWorld/src/Lib.hs, interpreted )
Ok, modules loaded: Lib.
[2 of 2] Compiling Main             ( /home/user/Projects/CTU/FPCourse/files/01_hw_stack/HelloWorld/app/Main.hs, interpreted )
Ok, modules loaded: Lib, Main.
Loaded GHCi configuration from /tmp/ghci18580/ghci-script
*Main Lib> :browse
main :: IO ()
*Main Lib> :browse Lib
greet :: String -> String
```

[Stack] is really powerful tool, you can find more by reading documentation or just with `stack --help`.

## Task assignment

Create new project with `stack` and publish it on the GitHub. Try on your own developing the projects and basic `git` commands.

## Further reading

* [Why Functional Programming Matters](https://wiki.ccmi.fit.cvut.cz/_media/programming:why_functional_programming_matters.pdf)
* [Why Haskell Matters](https://dzone.com/articles/why-haskell-matters)
* [Learn You a Haskell for Great Good](http://learnyouahaskell.com)
* [School of Haskell](https://www.schoolofhaskell.com/school/starting-with-haskell/introduction-to-haskell)
* [Stack User Guide](https://docs.haskellstack.org/en/stable/GUIDE/)
* [GHC User Guide](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/)

[Cabal]: https://www.haskell.org/cabal/
[GHC]: https://www.haskell.org/ghc/
[GHCJS]: https://github.com/ghcjs/ghcjs
[Hackage]: https://hackage.haskell.org
[Haskell]: https://www.haskell.org
[Haskell 2010]: https://www.haskell.org/onlinereport/haskell2010/
[Haste]: https://haste-lang.org
[Hayoo!]: https://hayoo.fh-wedel.de
[Hoogle]: https://www.haskell.org/hoogle/
[literate Haskell]: https://wiki.haskell.org/Literate_programming
[PureScript]: http://www.purescript.org
[Stack]: https://docs.haskellstack.org
[Stackage]: https://www.stackage.org