# Tests and documentation

## Testing

Testing is very important for keeping code on the straight-and-narrow path. The main testing mechanisms in Haskell are traditional unit testing and its more powerful descendant: type-based “property” testing.

### HUnit

### QuickCheck

### HSpecs

## Haddock (documentation)

Haskell projects, as any other project, should have good documentation of source code. In Haskell is the tool for documentation called [Haddock](https://www.haskell.org/haddock/).

```haskell
{-|
Module      : W
Description : Short description
Copyright   : (c) Some Guy, 2013
                  Someone Else, 2014
License     : GPL-3
Maintainer  : sample@email.com
Stability   : experimental
Portability : POSIX

Here is a longer description of this module, containing some
commentary with @some markup@.
-}
module W where

-- |The 'square' function squares an integer.
-- It takes one argument, of type 'Int'.
square :: Int -> Int
square x = x * x

class C a where
   -- | This is the documentation for the 'f' method
   f :: a -> Int
   -- | This is the documentation for the 'g' method
   g :: Int -> a

data R a b =
  C { -- | This is the documentation for the 'a' field
      a :: a,
      -- | This is the documentation for the 'b' field
      b :: b
    }

data R a b =
  C { a :: a  -- ^ This is the documentation for the 'a' field
    , b :: b  -- ^ This is the documentation for the 'b' field
    }
```

For more information about using Haddock and writing the documentation of source code in Haskell check http://haskell-haddock.readthedocs.io/en/latest/index.html (examples above are from this documentation).

## Publish project

If you think that other people might be interested in your project and want to use it standalone or as part of their project (as dependency), you can publish your project on GitHub and also on Hackage! Stack will help you to make nice projects and then just follow:

* [GitHub - create a repo](https://help.github.com/articles/create-a-repo/)
* [Hackage - upload](https://hackage.haskell.org/upload)

Your project should be:
* tested (write tests for your project so you can prove that it is working properly),
* documented (try to describe everything in your code to "strangers" with low Haskell knowledge),
* licensed (pick suitable license - https://choosealicense.com can help you).

Another advantage of publishing is that your project can get attention and community can help you improve it - they will create issues, forks and pull requests!

## Task assignment

## Further reading

* [Real World Haskell - Testing and quality assurance](http://book.realworldhaskell.org/read/testing-and-quality-assurance.html)
* [WikiBooks - Haskell: Testing](https://en.wikibooks.org/wiki/Haskell/Testing)
* [Haddock User Guide](https://www.haskell.org/haddock/doc/html/index.html)
