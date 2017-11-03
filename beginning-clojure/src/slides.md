---
title:      Clojure and Haskell
subtitle:   A discussion about types
author:     Ludvig Sundström
date:       November 2017, Bonn
colorlinks: true
linkcolor: black
classoption:
- dvipsnames
---
# Introduction

<!---

I'm just going to talk about my ideas. My ideas are based on my experience and
influenced by a number of blog-posts and talks. The point of the talk is to
compare Clojure with Haskell.

During Rich hickeys talk at clojureconj 2017, he said quite a few controversial
statements about static typing. This heated up the classical dynamic vs
static flamewar. Since I'm interested in language design, I'd like to base
this talk on some of the statements made by both parties.

All of this is not necesarily about Clojure and Haskell. It just happens to be
the two languages that I know best, that on the one side represent the
strong/pure/static functional world and on the other side the dynamic hybrid
functional world. Thus, at times when I speak about Haskell and Clojure I'm
talking about the static and dynamic respective collection of language and
communities.

-->
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

## Haskell

<!---
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
Commercial databases bindings (Microsoft SQL, Oracle)
Memory usage difficult to reason about (lazyness)

TODO Particularly Good

- Type classes
- Laziness
* Single machine concurrency

-->

## Haskell vs Clojure

- Inconsistencies and Typos in Clojure

- What about the real problems in software development?

<!---

Now to something really easy to do in clojure: Inconcistencies and Typos.
This leads to debugging. All those times you have to sit with your log-file
tracking the bug through the application could be avoided having some simple
types checked before you ran the program. In general, strong static typing exist
because the designers thought that it promotes best-practices. Some things you
get, directly or indirectly are:
1. Possibly a clearer model of your domain.
2. Knowing you address all cases when handling a value.
3. Refactoring out a piece of your code (maintainability)
3. Discovering a library function without having to write it yourself
4. Diving into a big program and better understanding whats going on.
5. Know what a function does by only reading the type signature.
   (How many ways can foo :: (a, b) -> a be implemented?)
7. Know what a function does only by reading the well-defined name and type
   signature. (List.Split.chunksOf :: Int -> [a] -> [[a]]) vs
   (defn chunks-of [n xs] ...)
8. Knowing when side effects occur and what kind
   fetch :: URL -> AJAX String

On the flip side it can be argued that all of these things solve rather small
problems in relation to the big problems in software engineering. Things such as
<!--misconception of problem domain and communication between
external libraries/database etc. And of course, a
haskell-like typechecker could not catch all of those. In addition, types can
give you a false sense of security: If it compiles it works.

So practically, it comes down to
* time/effort it takes playing type-tetris
* time/effort it takes tracking down type-related bugs, fixing runtime errors.

There is also discussion on whether modelling system using types is hindering
you or helping you. For which problems is one the better? According to rich
hickey, an enforced type system is always bad for the interesting problems,
which he likes to solve. That is real-world "situated" problems.

Rich hickey is one of the most influential persons in software development
today and many of his ideas are kind of revelutionary. He's a very opinionated
person, for good and bad. But after he started on Clojure.Spec he seem to have
taken very strong stance on that Types a' la carte is the one and only true way
to go.

It seem to exist some fundamental disconnect between static/dynamic people. As
craftmen, we are really proud on our knowledge and our way to do things. Just
like with going from imperative to functional programming, the difficulty of
accepting the paradigm doesn't go into the complexity of the other paradigm but
rather letting go of our proudness of what we already know.

Some things to consider with dynamic programs
1. Modelling the domain
2. Knowing you address all cases when handling a value
3. Diving into a big program and understanding what's going on
4. Discovering a library function so you don't have to write it yourself (Hoogle)
   (How many implementations does this function have (a, b) -> a

-->

# Other features
## Clojure
### Metaprogramming
<!---
- clj/cljs/cljs, webassembly, the future of programming?

- hosted language (sneak clojure into production by saying it's just a java
  library)
-->
### Syntax

<!--- People that are used to some tool often that they like often
don't think about that theonce had to learn the rule/philosophy of
this tool.
- Prefix notation allows for naturally variable number of arguments
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

### Data driven programming (Information programming)

- Data is simple. Don't make it more complex

- Positional semantics

- Open vs Closed program paradox

<!---

  When talking about data-driven programming, we should talk about positional
  semantics. Positional semantics means that order matters, for example in an
  argument list. Most programmers agree that positional semantics are bad,
  including haskell programmers allthough we make heavy use of it in our ADT's
  and pattern matching. Allthough positional semantics exist in clojure, we
  don't need to use them.
  Everything is data, and data is just key-value pairs. So we just use maps. We
  iterate over them, merge them and select subsets of their arguments, because
  the keys are first-class. Data is simple, we don't need to wrap, twist or
  label it. Just. Use. Maps.

  Since we are all functional programmers, I don't think we need to discuss the
  benefits of leaving the objects out.

  As with the positional semantics, I think rich makes a great point. It's a
  quite big problem that we don't have an open-extensible clojure-like
  map. Records are both unsafe and clumsy. Details about how purescript solves
  this problem in a while.

  As with the extensibility, I think its much harder to say what's right or
  wrong (or it depends). Rich tells us that in the real world, data is fluid and
  unpredictable. Enforcing a typed model on how we think our problem will be a
  pain once the requirements or the data-source changes. Then only problem is
  the paradox that this statement spawns:

  Even if you have a really open system you have to define a common interface to
  be able to do something useful. Otherwise you just know one single thing about
  your data: it's existence. At this point it does not matter if your program is
  dynamic or not. If you know enough about your data, you can also write a
  static program that takes into account the fluidity of your data, and at the
  same time get more type safety.

-->

## Haskell
# Flaws
## Clojure

- Flaws

- Incomplete parts

<!---

  When I talk about flaws, I'm talking about design decicions that almost
  everyone agrees are bad or non-optimal, but has to stay in the language for
  legacy support reasons.

  One reason why clojure is so popular is because it has very few (or no?) such
  flaws. It's a very modern "clean" language. Perhaps not the most controversial
  statement, but rich has said most of clojure design was about deciding what to
  leave out.

  As for incompleteness, I think the configuration part could be
  improved. If Clojure(script) targets real-world applications (and being an
  opinionated langage), there should be more frameworks to help setup and
  configure your project. The number one thing for me personnally that was
  off-putting learning clojure was the configuration stuff. For experienced
  developers, that might seem trivial but can be very scary for new developers.


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
playing type-tetris between string types can be made easier using -->
<!--Data.String.Conv
-->

### Haskell Records

``` {.hs include=src/listings/Sample.hs snippet=unsafe-records}
```
### Haskell Records: Purescript solution

``` {.hs include=src/listings/Sample.hs snippet=safe-records}
```
# Discussion about problemms

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
http://tech.frontrowed.com/2017/11/01/rhetoric-of-clojure-and-haskell/
http://www.lispcast.com/clojure-and-types
