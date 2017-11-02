---
title:      From Haskell to Clojure
subtitle:   a discussion about programming
author:     Ludvig Sundström
date:       November 2017, Bonn
colorlinks: true
linkcolor: black
classoption:
- dvipsnames
---

## Contents

- Why talk about languages?
- Origins and Creators
- Design Goals and Use cases
- Programming problems
- Environment

<!---
Links
http://tech.frontrowed.com/2017/11/01/rhetoric-of-clojure-and-haskell/
http://www.lispcast.com/clojure-and-types
-->

## Why talk about languages?

<!---
http://dev.stephendiehl.com/nearfuture.pdf

* The economic support of a language.
* The community around a language
* The front end and syntax
* The implementation of the compiler

It just feels readable.         -> It looks like this other language I know.
It’s like X but more practical. -> “There’s a library for my domain”.
It’s designed for humans .      ->  The example code masks vast complexity
“It’s a modern language”.       ->  “I saw it on HN last week”
It’s lightweight                -> I was able to install the compiler
-->


# Origins and Creators

## Haskell

<!--- Following the release of miranda in 1985, an interest in lazy functional
languages grew. By 1987 more than a dozen lazy purely functional languages existed.
At the conference on Functional Programming Languages and Computer Architecture,
a commettee was formed in attempt to create a unified language as a basis for future
research.

Just to mention some names (far from complete)
Kevin Hammond, John Hughes, Simon Peyton Jones, Erik Meijer and Philip Wadler.

Haskell grew as a active merge of several languages, by many people over a long time.
Different haskell versions differ alot.

Haskell motto (that haskell proponents like to cite) 'Avoid success at all costs'
-->

- Miranda ('85) large influence of lazy purely functional languages.

- at FPCA '87, a commettee was formed in attempt to create a unified language.

- Committee's efforts result in haskell ('90)

## Clojure

<!--- Rich hickey had an idea for a better way to write programs, after he'd had
it with writing concurrent programs in object oriented languages for 18 years.

At clojurec conj 2017 he opened his keynote with saying that:
"10 years ago, clojure was released. ... I told my wife: If a hundred people used this
, that'd be ridiculously outrageous. And that's not what happened."

Riding the wave of functional programming hype?

Rich hickey great at giving talks...

-->

- Rich Hickey gets an idea...

- Quickly spawned a large community to help out with the language

- Cognitect now maintains the langauge and related technologies

# Design Philosophy and Use cases

## Clojure
<!---

Clojure emphesizes pure functions and immutable data. And being a lisp,
metaprogramming and viewing code as data is a big part. Clojure is not only a
modern, clean lisp, it also carries some new ideas. Everything is not a list,
clojure programmers make heavy use of maps and vectors.

For being a functional language, clojure is in heavy use in the industry.
But the reason clojure is popular is not only attributed its "cleanness".
Clojure was designed, like most new programming languages to solve a specific
set of problems in a better way. The main goal was making programming in real
business applications easier.

The typical clojure programmer just wants to get his job done. He is pretty
indifferent to advanced mathematical concepts, not because he hates mathematics,
but because he doesn't believe they'll help him finish his job at the end of the
day.

Why? Because he realizes that in the real world, informatino processing
dominates logic. In addition to this real programs have a database, libraries
and other programs they talk to. Even the most interesting
applications from a modern technological standpoint
are information driven. You can't explain how to drive a car
or how to play go using only logic.

Typical, real-world, useful programs are:

Non-elegant.
Run continuously.
Deal with real world irregularity.
Interact with other systems.
Interact with humans.
Remain in use for a long time.

Summarized as: Information driven situated programs. Clojure are designed for
these kind of programs.

<!---
TODO
- clj/cljs/cljs

- The future of programming?

- Webassembly (clojure head start with cljc)

- Prefix notation allows for naturally variable number of arguments

- hosted language (sneak clojure into production by saying it's just a java library)

- Drawback: configuration difficult

- Datomic
-->

## Haskell

Even though an (old) experimental language with many practical flaws, haskell is
often seen as the most elegant, state-of-the-art language we have in FP. It
makes heavy use of mathematical abstractions and other concepts, not the least
from category theory, the branch of mathematics describing abstraction of
abstractions.

Haskell is pure, with strong types and global type inference. Haskell
programmers are expected to be able to model their problem domain in terms
of types. Applying type driven development in this way, you're often forced
to do alot of thinking up-front, and sometimes forced to approach the problem
in different ways than what you initially thought.

Haskell excels in error-prone applications where it's easy to make mistakes such
compilers or parsers. The point of the type system is not to work against the
programmer, but to catch illegal state. It gives you free tests, but that's not
the only thing. I'll come back to types later.

As a development platform, haskell is not java/python. It does not have a
rails framework, and many libraries are experimental or undocumented. It can be
more difficult you need to connect to Microsoft SQL server. It often comes
down to: if you're not going to write that library, no one else will.

Especially in the last 5 years, haskell and haskell-like languages have hit the
industry, the most famous example being facebooks anti-spam engine. However,
most haskell usage in the real world stems from hobbyists or academics that
use haskell as a vehicle for parts of their work.

Reasons why haskell adoption is low:

IDE
Commercial databases bindingsn (Microsoft SQL, Oracle)
Memory usage difficult to reason about (lazyness)

TODO Particularly Good

- Type classes
- Laziness
* Single machine concurrency

-->

## Haskell vs Clojure
<!---
There is a common idea that type chackers arn't catching the big problems that
really matter. This is true. But the main advantage of typed is to be able to
develop dynamically. To maintain clojure code one has to spend time tracing back
to the source of the error.

Some fundamental disconnect between static/dynamic people.
It boils down to this: The time of defining a static interface vs the time you
have to spend tracing errors when typos/inconsistencies occur (on change for examle).

False sense of security? On types

type systems are testing. But as with all tests, they are not exhaustive that catches
all the bugs.

Some things to consider with dynamic programs
1. Modelling the domain
2. Knowing you address all cases when handling a value
3. Diving into a big program and understanding what's going on
4. Discovering a library function so you don't have to write it yourself (Hoogle)
   (How many implementations does this function have (a, b) -> a
-->

# Flaws
## Clojure

<!---

Inconsistency, Typos (you can do that in clojure pretty easily)

-->

## Haskell
<!---
TODO Haskell flaws

**** String

he default string as a list of chars is broken and should be
	avoided whenever possible Unfortunately for historical reasons
	large portions of GHC and Base depend
	on String
text: used for unicode data
bytestring: used for ascii data needed for C code or network protocols

both can be lazy + strict -> 4 string types!!
playing type-tetris between string types can be made easier using Data.String.Conv

**** Records

### Haskell Records

``` {.hs include=src/listings/Sample.hs snippet=unsafe-records}
```
### Haskell Records: Purescript solution

``` {.hs include=src/listings/Sample.hs snippet=safe-records}
```

 It is a quite big problem to not have a open, extensible clojure-like map in haskell.
 Records are as shown unsafe and Map is a flat data-structure.

- Efforts are being made to replace the old haskell records.

-->

## Syntax

<!--- People that are used to some tool often that they like often
don't think about that theonce had to learn the rule/philosophy of
this tool.
-->

- Clojure has no syntax, no indentation, no magic

- JSX is something you have to learn, hiccup is just a clojure datastructure.

``` {.js include=src/listings/sample.js snippet=jsx}
```
``` {.clj include=src/listings/sample.clj snippet=hiccup}
```

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

# Programming Problems

## Place oriented programming

<!---
- Place oriented programming (FP immutable data structures default)
-->

## Positional semantics/Information programming

<!---
- Information programming (sparse, open, incremental, composable) Good with dynamics
  keywords as names are first class. Just use maps.
  Types are like classes?

  (paradoxical? If you don't know enough about the shape of your data
  you can't write a program that deals with it, dynamic or not. If you know enough,
  you can also write a static program that deals with it and takes into account the
  fluidity of data.)

  (paradoxical? Even if you have a really open system you have to define a common
  interface to be able to do something useful. Otherwise all values are equivalent
  with the unit value, which bears no information except its existence. I can easily
  get better safety in haskell than in clojure because I can only pass in values for
  which the interface is well-defined.)

- Keys are independent on the program language, need no special construct like pattern
  matching

-->

## Coupling of classes and types

<!---
- Coupling
  Type information is coupling in programs
  Pattern matching: Positional sementics
  only care about what you want to know
-->

- Language Model Complexity

## Having fix ideas of how things should be
<!---

- Problem of having ideas of what you should used
  Inheritance, ADT. Smash against database and other programs because
  you have your own view on things.

- creating a language with the system in mind and creating a language in academia
-->

## Domoin complexity/misconception
<!---

inpossible to fix by a language by logic
maybe with learning
-->

## Developing style

<!---
Clojure is small, haskell is big

Clojure is opinienated, haskell is not.
Clojure has only a few strongly supported idiom and a lot of support for them.
There isn't a global consensus how to write haskell. No two developers will
probably agree on which subset on the language to use.

Clojure was designed with simplicity in mind. It's a small language with as simple
ideas as possble. Therefore, there are very few legacy concerns while haskell has many.


- Haskell types are like sets, except that they contain 'bottom'
- Integer like N and bottom which represents
- Typical to start a program by laying out the types for the program

-->

``` {.hs include=src/listings/Sample.hs snippet=type-driven-development}
```

<!---
Clojure Spec is a la carte, depending on where you need it and what you want to
adress.
-->


<!---
Data-driven development
- Homoiconic (program by assembling lisp data structures)
- Might seem like a syntax curiosity, but has huge implications.
- Think about code differently
- Rainbow delemiters
-->

## Maintenence in haskell

## Interactive Programming

- ghci

- lein repl. More than just trying things out:
* R: Read human writable -> data structures
* E: Data -> executable code
* P: Print: data -> Text


## Links

http://www.stephendiehl.com/posts/production.html
http://ingesolvoll.github.io/2017/06/22/plain-react-vs-reagent.html
https://en.wikipedia.org/wiki/Haskell_(programming_language)#History
https://www.youtube.com/watch?v=2V1FtfBDsLU
http://dev.stephendiehl.com/hask/#string
https://github.com/Gabriel439/post-rfc/blob/master/sotu.md
