# Functional reactive programming

Functional reactive programming (FRP) is a programming paradigm for reactive programming (asynchronous dataflow programming) using the building blocks of functional programming (e.g. map, reduce, filter). FRP has been used for programming graphical user interfaces (GUIs), robotics, and music, aiming to simplify these problems by explicitly modeling time. (by wikipedia)

## Basic concepts

For better understanding what is FRP about and what are the basic concepts, please read https://gist.github.com/staltz/868e7e9bc2a7b8c1f754...

## Haskell ways of FRP

There are several libraries for working with the FRP in Haskell with slightly different approaches. You can see the list [here](https://wiki.haskell.org/Functional_Reactive_Programming#Libraries).

### Reactive

[Reactive](https://hackage.haskell.org/package/reactive) is a simple foundation for programming reactive systems functionally. Like Fran/FRP, it has a notions of (reactive) behaviors and events. Unlike most previous FRP implementations, Reactive has a hybrid demand/data-driven implementation, as described in the paper "Push-pull functional reactive programming", http://conal.net/papers/push-pull-frp/.

Sadly the documentation, tutorials and examples are not currently in a good condition.

### Reactive-banana

[Reactive-banana](https://wiki.haskell.org/Reactive-banana) is meant to be used in conjunction with existing libraries that are specific to your problem domain. For instance, you can hook it into any event-based GUI framework, like wxHaskell or Gtk2Hs. Several helper packages like reactive-banana-wx provide a small amount of glue code that can make life easier.

The goal of the library is to provide a solid foundation.

* Programmers interested implementing FRP will have a reference for a simple semantics with a working implementation. The library stays close to the semantics pioneered by Conal Elliott.
* The library features an efficient implementation. No more spooky time leaks, predicting space & time usage should be straightforward.
* A plethora of [example code](https://wiki.haskell.org/Reactive-banana/Examples) helps with getting started.

### Yampa

[Yampa](https://wiki.haskell.org/Yampa) is a domain-specific embedded language for the programming of hybrid (discrete and continuous time) systems using the concepts of Functional Reactive Programming (FRP). Yampa is structured using Arrows, which greatly reduce the chance of introducing space- and time-leaks into reactive, time-varying systems.

![Signals in Yampa](https://wiki.haskell.org/wikiupload/thumb/1/10/Yampa_signal_functions.svg/624px-Yampa_signal_functions.svg.png)

## Example app

//TODO: GitHub link to application

## Task assignment

* Think about use of reactive programming in some of your previous projects and implement it with Haskell.

## Further reading

* [Reactive Programming](https://en.wikipedia.org/wiki/Reactive_programming)
* [Haskell: Functional Reactive Programming](https://wiki.haskell.org/Functional_Reactive_Programming)
