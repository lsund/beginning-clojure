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

## Clojure

- Rich Hickey gets an idea...

- Quickly spawned a large community around the language

- Cognitect now maintains the langauge and related technologies

<!---

Rich hickey had an idea for a better way to write programs, after he'd had
enough with writing concurrent programs in object oriented languages for 18.

He decided to make clojure his life-project and worked independently on clojure
for a couple of years until he decided to open up the code and travel around
talking publicly about clojure. Being a lisp, clojure was extreamly well
recieved. It seems like even Rich did not foresee clojures success.

At clojureconj 2017 he opened his keynote with saying that:
"10 years ago, clojure was released. ... I told my wife: If a hundred people used this
, that'd be ridiculously outrageous. And that's not what happened."

I'll have to attribute part of clojures success to Rich Hickeys excellent
abilities to sell his ideas in public speaking and to give talks in general.


TODO
Riding the wave of functional programming hype?

-->

## Haskell

<!---

Haskell is a completely different story.
Following the release of miranda in 1985, an interest in strongly typed lazy
functional languages grew. By 1987 more than a dozen such languages existed,
and basically everyone that wanted to write an article needed to first define
the programming language he or she were using.

In reaction to this, a commettee were formed at the conference on Functional
Programming Languages and Computer Architecture. The purpose of this commetee
was to create a unified language that would serve as a tool for future research.
This language became Haskell.

Many scienctists and practicioners such as Kevin Hammond, John Hughes, Simon
Peyton Jones, Erik Meijer and Philip Wadler contributed ideas from their
respective fields and work.

With time, haskell was more widely adopted by the masses and is accepted
the de-facto standard language for FP as whole. However, the languages
experimental status remains. 'Avoid success at all costs' is a motto that
is cited alot in haskell [sammanhang].
-->

- Miranda ('85) large influence of lazy purely functional languages.

- at FPCA '87, a commettee was formed in attempt to create a unified language.

- Committee's efforts result in haskell ('90)

- Avoid success at all costs

# Design Philosophy and Usage in the real world

## Clojure
<!---

The core idea of clojure is simplicity. The idea is to pick out the elements in
programming that are complex, and replace them with simple things. Essentially,
it comes down the idea that data itself is simple. Ideomatic clojure uses
constructs that deal with data, without wrappers and indirections. Constructs
like pure functions and immutable data-structures.

Clojure on the other hand won't force you to do anything. A clojure programmer
just wants to get his job done. He has the opinion that enforcing a type
strong type system and advanced abstraction techniques with it will just slow
him down. In clojure, you can opt-in to type contracts at any point you want to.
In clojure, you can implemnet an interface called appendable. You can even call
it monoid, and get the same advantages that a haskell programmer would get
from the monoid typeclass. But you don't have to, and nobody is going to tell
you that you need to.

Why is this good? Because in the real world real world, information processing
dominates logic. The actual part of your program that you can control with
static compile-time checks is thus uninportant next to the other problems you'll
face when developing a real system.

Typical, real-world, useful programs are:

Non-elegant.
Run continuously.
Deal with real world irregularity.
Interact with other systems.
Interact with humans.
Remain in use for a long time.

Arguably even the most interesting modern applications from a research are
information, not logic driven. You can't explain how to drive a car or how to
play go using only logic.

TODO
metaprogramming and viewing code as data is a big part. Clojure is not only a
modern, clean lisp, it also carries some new ideas. Everything is not a list,
clojure programmers make heavy use of maps and vectors.
-->

## Haskell

- Strong, static type system

- Good at composing things

- Not trying to be java/python

<!---

Haskell has a strong static type-system which means it's harder to get runtime-
errors than to not get runtime errors. To obtain freedom and elegance while
maintaining this safety, haskell makes use of very few, but very powerful
abstractions, that gets used everywhere. Many of haskells abstractions comes
from category theory, a branch of mathematics looking at the world using only
compositions. Naturally, haskellers are good at composing things. Not only
functions but promises, ..., ..., (and when is it useful). And since
composition is the only thing we do all day, many of these constructs can
be invaluable.

Haskell programmers model their problem domain in terms of types. Applying type
driven development in this way, you're often forced to do alot of thinking
up-front, and sometimes forced to approach the problem in different ways than
what you initially thought.

Haskell excels in error-prone applications where it's easy to make mistakes such
compilers or parsers. The point of the type system is not to work against the
programmer, but to catch illegal state. It gives you free tests, but that's not
the only thing. I'll come back to types later.

As already discussed, haskell is experimental. That means that it does not have
a rails framework, or huge corperations pouring money into the language.
Naturally, many libraries are experimental or undocumented. If you need to
connect to Microsoft SQL server, it can be difficult. It often comes down to: if
you're not going to write that library, no one else will.

However, in the last 5 years haskell has hit the industry, the most famous
example being facebooks anti-spam engine. However, most haskell usage in the
real world stems from hobbyists or academics that use haskell as a vehicle for
parts of their work.

Reasons why haskell adoption is low:

IDE
Memory usage difficult to reason about (lazyness, problem in real-world applications)
Commercial database bindings (Microsoft SQL, Oracle)
Idea that when we have types we don't need documentation.

-->

# Haskell vs Clojure
## Haskell vs Clojure

- More about the type system and its benefits

- What about the real problems in software development?

<!---

Now to something really easy to do in clojure: Inconcistencies and Typos.
This leads to debugging. All those times you have to sit with your log-file
tracking the bug through the application is because you had a runtime-error and
this could've been prevented using a type checker.
Here is some additional things you get using a type checker. Good or bad?
* Knowledge of handling all possible values
* Being forced to think more up front about your design.
* Refactoring out a piece of your code (maintainability)
* Discovering a library function without having to write it yourself (hoogle)
* Know what a function does by only reading the type signature.
  (How many ways can foo :: (a, b) -> a be implemented?)
* Diving into a big program and better understanding whats going on.
* Know what a function does only by reading the well-defined name and type
  signature. (List.Split.chunksOf :: Int -> [a] -> [[a]]) vs
  (defn chunks-of [n xs] ...)
* Knowing when side effects occur and what kind
  fetch :: URL -> AJAX String

These are nice things sure, and they might make some things easier. But on the
flip side it can be argued that these things are very small compared to the
real problems in real business applications. Things such as
<!--misconception of problem domain and communication between external
libraries/database etc. And of course, a haskell-like typechecker could not
catch all of those. In addition, types can give you a false sense of security:
If it compiles it works.

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
