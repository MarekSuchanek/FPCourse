# Advanced functions

## More about functions

Creating new own functions or using the predefined from libraries is quite simple. But there are more interesting things you can do with functions. This is functional programming and all is about functions!

### Currying

When we talk about "currying" in Haskell it has (almost) nothing to do with dishes or spices. Famous mathematician and logician [Haskell Curry](https://en.wikipedia.org/wiki/Haskell_Curry) (the language is named after him) developed with others technique called currying: translating the evaluation of a function that takes multiple arguments (or a tuple of arguments) into evaluating a sequence of functions, each with a single argument. To better understand this, let's focus how we parenthesise function types:

```haskell
myFunc1 :: a ->  b -> c
myFunc1 :: a -> (b -> c)
```

We see that `myFunc1` takes value of `a` and returns a function that takes value of `b` and result is a value of `c`. It is possible to apply value of `a` and "store" the function `b -> c` for later application or reuse:

```

```

In Haskell there are two basic functions called `curry` and `uncurry` which work with functions:

```

```

### Function composition

Just as in math, it is possible to compose functions in Haskell. With having two functions, one with type `a -> b` and second with type `b -> c` you can create composed one with type `a -> c`. All you need is the dot `(.)` operator. It can make your code more readable and easier to understand. It also provides a way how to build more complex functions from simpler parts (functions or partially applied functions).

```

```

Other operator which you now might want to know is `($)` called "application". Which can help you with getting rid of parentheses for applying arguments to right function.

```

```

### Pointfree style

It is very common in FP to write functions as a composition of other functions without mentioning the actual arguments they will be applied to. Consider following two examples and notice that although the result is the same, the first one is way cleaner and more readable.

```haskell
sumA = foldr (+) 0
sumB xs = foldr (+) 0 xs
```

Those are very simple examples but you can build more complex with function composition `(.)` and more partially applied or plain functions.

```haskell

```

Now you might ask why we call this pointfree style when there are actually more points. A 'points-free' definition originates in math (not a suprise!) of a function is one which does not explicitly mention the points (values) of the space on which the function acts.

### Own operators

### Anonymous functions

An anonymous function is a function without a name. It is a Lambda abstraction and might look like this: `\x -> x + 1`. Sometimes it is more convenient to use a lambda expression rather than giving a function a name. You should use anonymous functions only for very simple functions because it decreases readability of the code.

```haskell
myFunc1 = (\x y z -> x * y + z)
myFunc2 x y z = x * y + z
mapFunc1 = map myFunc1
mapAFunc1 = map (\x y z -> x * y + z)
```

## Higher order functions

As is visible from previous example, anonymous functions are sometimes good to use with combination of higher order functions. Higher order function is a function that takes function as argument and/or returns function as result. In this course there were already many of them: `(.)`, `curry`, `uncurry`, `map`, etc. We will now looks at those more used for structures...

### Map, reduce, filter

```

```

### Folds and scans

```

```

## FP in other languages

Functional programming concepts that you learn in pure functional language are applicable in other non-functional languages as well. Simply because those languages adopt some principles which make them more useful (or not so useless).

### C/C++

C++ is general purpose object oriented programming language based on C which is imperative procedural language. In both is possible to create functions (and procedures). There is no control if function is pure or not (if it is makind side effects). And in C/C++ you need to deal with mutability, pointers and working with memory on low level (de/allocation). But typing is strict and you can make higher order functions with "function pointer" types.

```cpp
int calculate(int(*binOperation)(const int, const int), const int operandA, const int operandB){
    return binOperation(operandA, operandB);
}
```

If you are normal person and not bighead you will most probably use `typedef` to name the type of such functions so the code is more readable and understandable. In newer versions of C++ there are also anonymous functions, combinators (`for_each`, `transform`, `filter`, ...), functors. Then you can of course use simpler functional concepts such as closures or recursion.

### Java

In Java 8 were added many functional programming concepts *TODO*

### Python

http://www.oreilly.com/programming/free/functional-programming-python.csp
https://docs.python.org/3/howto/functional.html
https://docs.python.org/3/library/typing.html

### Smalltalk and Ruby

## Task assignment

## Further reading
