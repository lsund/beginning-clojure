---
title:      Clojure and haskell
subtitle:   The dynamic vs the static world
author:     Ludvig Sundström
date:       November 2017, Bonn
colorlinks: true
linkcolor: black
classoption:
- dvipsnames

---
# Introduction

## What is this talk?

- Who am I

- Motivation

<!---

I'm a Computer Science student at Bonn University. I've just had an internship
here at doctronic and seen how fast and relatively painless you can develop
functioning systems with Clojure. However, I'm one of those who've found the
love for strong, static types and how easy they can make life for you.

During Rich hickeys talk at clojureconj 2017, he said quite a few controversial
statements about static typing. Given that I like working in both dynamic and
static languages, it felt natural sharing my experience in the clash between the
two worlds. I'm going to use haskell and clojure as representatives here,
talking on a meta-level rather than the specefics of the languages.

I'm relatively new to programming, so stop me if I say something wrong. I'm just
speaking my mind to the best of my knowledge. I'm not attempting any concrete
solutions to any of the problems I'll discuss. For some people this might seem
basic, but hopefully I'll convey some interesting things to think about.

-->
## Contents

- Clojure and Haskell Origins and Creators

- Clojure and Haskell Design Goals and Use cases

- The dynamic vs the static world

# Part 1: Origins and Creators

## Clojure

- Rich Hickey gets an idea...

- Quickly spawned a large community around the language

- Cognitect now maintains the langauge and related technologies

<!---
Rich hickey had had enough with writing concurrent programs in object oriented
languages for 18 years. He had an idea for a better way to write programs which
later became clojure, a clean, concurrent, hosted lisp.

He quickly realized the value of this idea and decided to make it his
life-project. However, the goals of the language was not extraordinal.
At clojureconj 2017 he opened his keynote with saying that: "10 years ago,
clojure was released. ... I told my wife: If a hundred people used this , that'd
be ridiculously outrageous. And that's not what happened."

Rich independenly worked on clojure for a couple of years before he decided to
publish the language, and started traveling around talking publicly about
clojure. Being a lisp, clojure was extreamly well recieved. It seems like even
Rich did not foresee clojures success.

I'll argue that part of clojures great success, especially the first years is
attributed to Rich Hickeys excellent public spaking skills. Also, the initial
stage of clojure was around 2010, when FP was gaining interest in many areas,
and especially it was around this time that FP hit the JS word.

-->

## Haskell

<!---

Haskell is a completely different story, starting in 1985 following the release
of the programming language Miranda. At this time, an interest in strongly typed
lazy functional languages were growing. By 1987 more than a dozen such languages
existed. These kind of languages were mainly used for exactly the same thing,
to serve as a medium in research papers. As a result, almost all articles used
a different language, and needed to define the syntax in the first sections of
the article.

To solve this "problem", a commettee were formed at the conference on Functional
Programming Languages and Computer Architecture. More specifically, the purpose
was to create a unified language that would serve as a tool for future research.
This language became Haskell. Haskell was thus a collaberative effort among many
people over an extended amount of time. Some names Kevin Hammond, John Hughes,
Simon Peyton Jones, Erik Meijer and Philip Wadler.

Today, Haskell is widely accepted to be the de-facto standard for strong/static
functional programming languages, and we see many modern languages such as Idris
or purescript drawing all basic ideas from haskell, both syntax and semanics.

However, on initiative of the language mentainers, haskell remains a
experimental language. An infamous slogan which is often cited in haskell
contexts reads 'Avoid success at all costs'.

-->

- Miranda ('85) large influence of lazy purely functional languages.

- at FPCA '87, a commettee was formed in attempt to create a unified language.

- Committee's efforts result in haskell ('90)

- Avoid success at all costs

# Part 2: Design Philosophy and Usage

## Clojure

### Simple made easy

- Targets real world, "useful" programs

- Information vs Logic driven programs

### Hosted language

- clj/cljs/cljc

### Code is Data

<!---

Clojure is based on a couple of ideas.

The core idea of clojure is simplicity. The idea is to leave out the elements in
programming that are complex, and replace them with simple things. Essentially,
it comes down the idea that data itself is simple, and that OO and staic types
are examples of things that we humans have wrapped data in to make not-simple.
Ideomatic clojure uses constructs that deal directly with data, like pure
functions and immutable key-value maps.

But clojure won't force you to only write pure functions or use mathematical
abstractions. A clojure programmer just wants to get his job done, without
enforced restrictions. That doesn't mean that you just can jump in and code.
Clojure encourages the thinking and process, and lays the responsibility on the
programmer to chose when it's suitable to the right thing.

For example, you can opt-in to using type contracts with Clojure.Spec whenever
you feel it's necessary. If you want to use monads as a concept -
fine, just implement that interface.

Why is this good to not enforce things? Because in the real world real world, or
at least the kind of programs which clojure targets are:

Non-elegant.
Run continuously.
Deal with real world irregularity.
Interact with other systems.
Interact with humans.
Remain in use for a long time.

I'll return to this in a while.

Another idea clojure is based on is simplicity, which
I think is a great idea. If clojure had it's own runtime, clojurescript probably
wouldn't be a thing, and we wouldn't get the feel for how awesome clojurescript
is on developing UI's. But the central thing in this is the .cljc. For anyone
that doesn't know, the cljc extension allows you to write a single source file
that acts like clojure or clojurescript code, depending on the context it was
run. This is how I think programming will be done in the future. Write once, run
on any host. This concept is also a great thing for the FP community because it
allows you to "sneak" clojure(script) code into production with less problems.

The third clojure idea is that it is a lisp. Code is data, or more conceptually
easy to understand (I think) data is code. There is little distinction. The
simplest way to describe my experince with this was the realization that there
is no syntax. You don't edit lines of code in some ascii-textfile that
magically gets compiled and run depending on semantics you can't influence.
You edit things inside brackets, which denote real datastructures. There is
nothing to learn. No special JSX syntax, no magic. Just you and your data.


-->

- JSX is something you have to learn, hiccup is just a clojure datastructure.

``` {.js include=src/listings/sample.js snippet=jsx}
```
``` {.clj include=src/listings/sample.clj snippet=hiccup}
```

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

## Haskell

- Core ideas from Category theory

- Type systems knows you

- Some problems with adaption

<!---

Haskell has a strong static type-system which means it's harder to get runtime-
errors than to not get runtime errors. To obtain freedom and elegance while
maintaining this safety, haskell makes use of very few, but very powerful
abstractions, that gets used everywhere. Many of Haskells abstractions comes
from category theory, a branch of mathematics that abstracts mathematics.
Category theory is based on composition.  Naturally, haskellers are good at
composing things. Not only composing functions but promises, [TODO ... (and when
is it useful)]. And since programming is about dividing problems into smaller
parts and then composing them together, many of these abstractions can be
invaluable.

Haskell programmers model their problem domain in terms of types and pure
functions based on those types. Applying type driven development in this way,
you're often doing a lot of thinking up-front just like clojurians, the
difference being that haskellers are forced to it or the program wont compile.

Since you model your problem in types, the type checker is helping you, not
working against you. This is in contrast to many imperative programmers in
static languages like Java which feel relieved when going to dynamic languages.
The haskell type checker can infer the most generic type of every value of your
program, which means that it in some sense understands the semantics of your
program. That means, when you get a type error, its probably something wrong in
your thinking.

Naturally, haskell excels in error-prone applications where it's easy to make
mistakes such compilers or parsers, but gets used in all kind of applications.
However, industrial use is limited. We do not have a rails framework, or any
significant funding.  Many libraries are experimental or undocumented. If you
need to connect to Microsoft SQL server, it can be difficult. It often comes
down to: if you're not going to write that library, no one else will.

There are many reasons why haskell adoption is low. Things that have been
discussed involve:
- Lack of IDE
- Memory usage difficult to reason about due to lazyness
- Bindings to commercial libraries non-existent
- Lack of documentation because of the fact that we have types.

But theh most interesting reason, involves Elm the programming language. Elm is
a haskell-like language, its syntax is almost indistinguishable with
haskells. However, Elm misses some important parts, for example higher kinded
types. With no higher kinded types, you can't define a common interface for
mappable types in statically typed languages. In haskell, all things that can be
mapped over is a Functor and you just call map interchangebly. In elm you can't
do this, and as a result, you have to do List.Map, Map.Map, Array.Map etc...

Does this stop people from using from using Elm? No. Elm is probably more widely
adopted than stronger languages such as purescript anyways. The consensus?
People don't want to know what a functor is.
Or: people feel that in order to use haskell, you have to learn what a functor
is, then applicative, then monoid until you finally climb the mountain and
understand monads. And since nobody wants to climb a mountain, haskell does not
get adopted. You can of course use haskell without knowing anything about these
abstractions, but its kind of off-putting using a language in which you only
understand the basics.

Just as an exemple on why you don't need to climb the monad mountain. Take
monoid. It is a laughable simple concept. It is the class of all types which
fulfill the idea that you can append together. It would not be very misleading
to rename monoid to appendable. There is one more important thing to it: the
append needs to be accociative. That means if you have three appendable items
after eachother, it does not matter in which order you append them to
eachother. As a result, when we are talking about monoids, we know that we are
talking about data , which you safely can parellalize, or recursively descend
into.

-->

# Part 3: The static vs the dynamic world

## Haskell vs Clojure

- Some concrete implications of the type checker

- Some real problems in software development the type checker does not solve

1. Misconception of problem domain
2. Communicating with other systems of different constraints

- Use the right tool for the job <- Zero information statement

<!---

Ok, so your'e sitting with your logfile and your runtime error and tracking
the bug through the application and wondering if you should learn haskell.

I've compiled a list of features of the type checker. Good or bad?

* Being forced to handle all possible values (and thus know that you have handled them all).
* Being forced to think more up front about your design.
* Refactoring out a piece of your code, and easily detect if something broke (maintainability).
* Discovering a library function without having to write it yourself (hoogle).
* Know what a function does by only reading the type signature.
  (How many ways can foo :: (a, b) -> a be implemented?)
* Diving into a big program and better understanding whats going on.
* Know what a function does only by reading the well-defined name and type
  signature. (List.Split.chunksOf :: Int -> [a] -> [[a]]) vs
  (defn chunks-of [n xs] ...)
* Knowing when side effects occur and what kind
  fetch :: URL -> AJAX String

People with experiece in haskell-like languages will not deny that these are
nice things to have. But on the flip side it can be argued that these things are
very small compared to the real problems in applications.

For example: You might connect to a database of a certain configuration, or
using a specific library and suddenly all your constraints are working against
you, or not at all.

And now to the biggest one: misconception of problem domain. This one can of
course not be type checked.  It might not even be feasable to try to fix this
problem in terms of language constructs. We know that there are some
computations that are impossible to explain, or at least nobody knows how. Think
about some of the most interesting applications today. You can't explain how to
drive a car or how to play go. We use information driven methods such as ML in
order to solve them.

No matter how you take your stand in this question it seems to exist some
fundamental disconnect between static/dynamic people. There is no middle ground.
Why? As craftmen, we are really proud on our knowledge and our way to do
things. The difficulty always comes in accepting that we might have been doing things
wrong in certain contexts and letting go of the things we already know.

"Use the right tool for the job" is a popular zero information statement in our
community. How do we know when we are wrong?

I'd like to start devoloping a small framework for choosing the right tool for
the job. I'd start by looking at the data. Rich Hickey tells us that in the real
world, data is fluid and unpredictable. In order to deal with that, your program
should be dynamically extensible, which means no static types. There is one
problem though:

If you have a really open system you have to define a well-defined interface to be
able to do something useful. Otherwise you just know one single thing about your
data: it's existence. At this point you're gradually turning your program static,
and less flexible for changes. This turns into a paradox.

-->








<!---

  NOT YET USED

  When I talk about flaws, I'm talking about design decicions that almost
  everyone agrees are bad or non-optimal, but has to stay in the language for
  legacy support reasons.

  As for incompleteness, I think the configuration part could be
  improved. If Clojure(script) targets real-world applications (and being an
  opinionated langage), there should be more frameworks to help setup and
  configure your project. The number one thing for me personnally that was
  off-putting learning clojure was the configuration stuff. For experienced
  developers, that might seem trivial but can be very scary for new developers.


Haskell Flaws
**** String

he default string as a list of chars is broken and should be
	avoided whenever possible Unfortunately for historical reasons
	large portions of GHC and Base depend
	on String
text: used for unicode data
bytestring: used for ascii data needed for C code or network protocols

both can be lazy + strict -> 4 string types!!
playing type-tetris between string types can be made easier using
Data.String.Conv

Haskell Records

``` {.hs include=src/listings/Sample.hs snippet=unsafe-records}
```
Haskell Records: Purescript solution

``` {.hs include=src/listings/Sample.hs snippet=safe-records}
```
Discussion about problemms

Coupling of classes and types

- Coupling
  Type information is coupling in programs
  Pattern matching: Positional sementics
  only care about what you want to know

- Language Model Complexity

Having fix ideas of how things should be

- Problem of having ideas of what you should used
  Inheritance, ADT. Smash against database and other programs because
  you have your own view on things.

- creating a language with the system in mind and creating a language in academia

Domoin complexity/misconception

inpossible to fix by a language by logic
maybe with learning

Developing style

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


``` {.hs include=src/listings/Sample.hs snippet=type-driven-development}
```

Clojure Spec is a la carte, depending on where you need it and what you want to
adress.

Data-driven development
- Homoiconic (program by assembling lisp data structures)
- Might seem like a syntax curiosity, but has huge implications.
- Think about code differently
- Rainbow delemiters

Interactive Programming

- ghci

- lein repl. More than just trying things out:
* R: Read human writable -> data structures
* E: Data -> executable code
* P: Print: data -> Text
-->

## Links

http://www.stephendiehl.com/posts/production.html
http://ingesolvoll.github.io/2017/06/22/plain-react-vs-reagent.html
https://en.wikipedia.org/wiki/Haskell_(programming_language)#History
https://www.youtube.com/watch?v=2V1FtfBDsLU
http://dev.stephendiehl.com/hask/#string
https://github.com/Gabriel439/post-rfc/blob/master/sotu.md
http://tech.frontrowed.com/2017/11/01/rhetoric-of-clojure-and-haskell/
http://www.lispcast.com/clojure-and-types
