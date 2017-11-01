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

Haskell motto 'Avoid success at all costs'
-->

- Miranda ('85) large influence of lazy purely functional languages.

- at FPCA '87, a commettee was formed in attempt to create a unified language.

- Committee's efforts result in haskell ('90)

## Origins and Creators: Clojure

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

- Cognitect now maintains the langauge

# Design Philosophy and Use cases

## Clojure
<!---

Clojure emphesizes pure functions and immutable data. And being a lisp,
metaprogramming and viewing code as data is a big part. Clojure is not only a
modern, clean lisp, it also carries some new ideas. Everything is not a list,
clojure programmers make heavy use of maps and vectors. But more importantly,
clojure

What is clojure good at?

In clojure, programming has nothing to do with mathematics. In haskell,
it has everything to do with mathematics.

Information processing dominates logic
Programs have a database, libraries and other programs they talk to.

information vs logic. Can't explain how to drive a car or play go
Information dominates logic.

Typical programs they deal with:
Real world is never elegant. Clojure designed to
deal with information,
run continously,
deal with real-world irregularity.
Interact with other systems,
interact with humans,
remain in use for a long time

Everything can be summerized as information driven situated programs.
Clojure targets theses kinds of programs.

What is haskell good at?

Many not so good use-cases stems for immaturity, libraries missing

Particularly Good

* Compilers: Huge marigin for error in everything a compiler does, from
type-checking to ioptimization, code generation. Haskell powerful type
system helps here.
* (meta) Maintenence.
- Strong types
- Purity
- Global type inference
- Type classes
- Laziness
* Single machine concurrency
* (meta) Type-driven development
* Parsing

Particurlarly Immature

* Distributed programming,
* standalone GUI applications
* Game programming (GC)
* Systems/embedded programming (speed, memory, latency really matter)
- GC
- Executable sizes large
- Memory usage difficult to constrain
* (maybe) Databases/store (lack to commercial databases like Microsoft SQL, Oracle)
* IDE (!)
* Hot code loading (some support but nothing near clojure)
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

# Environment

## Environment: Clojure

<!---
- clj/cljs/cljs

- The future of programming?

- Webassembly (clojure head start with cljc)

- Prefix notation allows for naturally variable number of arguments

- hosted language (sneak clojure into production by saying it's just a java library)

- Drawback: configuration difficult

- Datomic
-->

## Environment: Haskell

<!--- The joy and agony of haskell in production

- easy to install and get started with

- Haskell has good libraries but Knowing where to start can be difficult
- Haskell is not java/python. If we need to connect to Microsoft SQL server or
  SOAP
- If you're not going to write that library, noone else will

- most haskell usage in industry stems from hobbyists and academics that use haskell
  as a vehicle for their work.

-string: The default string as a list of chars is broken and should be
	avoided whenever possible Unfortunately for historical reasons
	large portions of GHC and Base depend
	on String

text: used for unicode data
bytestring: used for ascii data needed for C code or network protocols

both can be lazy + strict -> 4 string types!!

playing type-tetris between string types can be made easier using Data.String.Conv

Facebook anti-spam using haskell

haskell pitfalls: string, records
-->

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

### Haskell Records

``` {.hs include=src/listings/Sample.hs snippet=unsafe-records}
```
### Haskell Records: Purescript solution

``` {.hs include=src/listings/Sample.hs snippet=safe-records}
```

<!---
 It is a quite big problem to not have a open, extensible clojure-like map in haskell.
 Records are as shown unsafe and Map is a flat data-structure.

- Efforts are being made to replace the old haskell records.

-->

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

## Clojure pitfalls

<!---

Inconsistency, Typos (you can do that in clojure pretty easily)

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

## The Maintainance problem

## Maintenence in haskell

<!---
Maintenence in haskell:
Proponents of dynamic languages (read rich hickey) says that type checkers artnt
catching the big problems that really matter. This is true. But the main advantage
of typed is to be able to develop dynamically. To maintain clojure code one has to
spend time tracing back to the source of the error.

Some fundamental disconnect between static/dynamic people.
It boils down to this: The time of defining a static interface vs the time you
have to spend tracing errors when typos/inconsistencies occur (on change for examle).

False sense of security? On types

type systems are testing. But as with all tests, they are not exhaustive that catches
all the bugs.

-->

<!---
Some things to consider with dynamic programs
1. Modelling the domain
2. Knowing you address all cases when handling a value
3. Diving into a big program and understanding what's going on
4. Discovering a library function so you don't have to write it yourself (Hoogle)
   (How many implementations does this function have (a, b) -> a
-->

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
