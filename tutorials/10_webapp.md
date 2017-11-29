# Web application in Haskell

Haskell is possible to use web applications and it has some advantages when compared to others like PHP, Python or Java.

## Frameworks overview

As with other languages, you usually don't want to build web application from scratch which would bind ports, listen and parse requests and compose responses. For better abstraction you want to use a web framework.

### Snap

[Snap](http://snapframework.com) is a simple web development framework for unix systems, written in the Haskell programming language. It consists of:

* A fast HTTP server library
* A sensible and clean monad for web programming
* An HTML-based templating system for generating pages (heist)

Snap also has very nice philosophy in form of an optional system for building reusable pieces web functionality called “snaplets”. Snaplets make it easy to share and reuse common code across multiple web apps. The default snaplets let you get a full-featured web application up and running in no time.

More including examples is in the [documentation](http://snapframework.com/docs).

### Yesod

[Yesod](https://www.yesodweb.com) is a Haskell web framework for productive development of type-safe, RESTful, high performance web applications. It build on Haskell features such as compile-time errors (instead of runtime), seamlessly asynchronous computation, scalability, good performance and light-weight syntax.

Another advantage of Yesod is comprehensive documentation including:

* [quick start guide](https://www.yesodweb.com/page/quickstart),
* [book](https://www.yesodweb.com/book) (O'Reilly),
* [screencasts](https://www.yesodweb.com/page/screencasts),
* and [cookbook](https://github.com/yesodweb/yesod-cookbook).

If that is not enough you can ask the [community](https://www.yesodweb.com/page/community).

### Scotty

[Scotty](https://github.com/scotty-web/scotty) is another Haskell web framework inspired by Ruby's [Sinatra](http://sinatrarb.com), using [WAI](https://hackage.haskell.org/package/wai) and [Warp](https://hackage.haskell.org/package/warp) (a fast, light-weight web server for WAI applications). You can write your own application just with WAI (Web Application Interface), but Scotty provides you better abstractions from low-level communication. Sadly there is not so much documentation about Scotty, everything is just on [GitHub](https://github.com/scotty-web/scotty). Scotty uses [Blaze HTML](https://hackage.haskell.org/package/blaze-html) for HTML "templates".


## Haskell and JavaScript

Haskell tries to solve [The Javascript Problem](https://wiki.haskell.org/The_JavaScript_Problem#The_problem). Basically, the problem is that we want to use JavaScript, but the language has some issues related to weak and dynamic typing, absence of modules, late binding, callback hell, etc. So there are some libraries for compiling from Haskell (which does not have these issues) to JavaScript...

 * [GHCJS](https://github.com/ghcjs/ghcjs) is a Haskell to JavaScript compiler that uses the GHC API.
 * [Haste](https://haste-lang.org) is an implementation of Haskell made specifically for building web applications with JavaScript.
 * [PureScript](http://www.purescript.org) is a strongly-typed functional programming language that compiles to JavaScript. Although you might this it is just the same as Haskell - there are few [differences](https://github.com/purescript/documentation/blob/master/language/Differences-from-Haskell.md) which are good for the to-JavaScript compilation.
 * [Elm](http://elm-lang.org) is with its syntax very similar to Haskell. There are much more differences than with PureScript because it is really different language just highly affected by Haskell. You can compile Elm in your Haskell app with [Language.Elm](https://hackage.haskell.org/package/Elm).

## Example app: Simple blog

//TODO: GitHub link to application

## Task assignment

* Create web application based on your topic with any of mentioned frameworks

## Further reading

* [Haskell web frameworks](https://wiki.haskell.org/Web/Frameworks)
* [The JavaScript problem](https://wiki.haskell.org/The_JavaScript_Problem)
* [Reddit: Web development using Haskell](https://www.reddit.com/r/haskell/comments/2wfap0/web_development_using_haskell/)
* [Is Haskell a Good Choice for Web Applications?](http://jekor.com/article/is-haskell-a-good-choice-for-web-applications)
