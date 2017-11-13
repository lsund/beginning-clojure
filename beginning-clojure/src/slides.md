---
title:      The dynamic vs the static world
subtitle:   Are types evil?
author:     Ludvig Sundström
date:       November 2017, Bonn
colorlinks: true
linkcolor: black
classoption:
- dvipsnames

---
# Introduction

## This talk

- Who am I

- Why am I talking about discussing this?

## Structure

- Clojure and Haskell: Origins and Creators

- Clojure and Haskell: Design Goals and Use cases

- Clojure and Haskell: Which one to pick?

<!---

Hi everyone. This talk is called The dynamic vs the static world: Are types
evil?  and is going to be a language meta-discussion for anyone interested in
languages and our ways of expressing computation.

For those who don't know me, I'm a Computer Science student at Bonn
University.

Apart from that, I've just had an internship here at doctronic and
through that I've seen how fast and painless you can develop systems with
Clojure, that works and does what the customer want.

This was the first time I was actually writing lisp for real. I'd like to
intersect this experience with my background and my love for strongly typed,
static languages.

At clojureconj 2017, Rich Hickey (the creator of clojure) said quite a few
controversial statements about static typing. This kind of blew up the classical
debate which involves static vs dynamic typing. A clash between the two
worlds.

Basically, static typing is when types of data is checked at compile
time, and dynamic typing the types are checked at runtime. Whichever you chose for
your language has huge implications in other areas. To illustrate this, I'm going
to talk about clojure which is a dynamically typed language, and haskell which
is a statically typed language. I'm going to use these two representatives to
show my take on the entire debate.

A lot of what I'm going to say is just opinionated,
or based on other peeoples opinions. Also, I'm pretty new to programming, and
especially business applacitions. So don't hesitate to stop me if you'd like to
discuss something.

-->
# Part 1: Origins and Creators

## Clojure

- Rich Hickey gets an idea...

- Aspirations small at first, but later blew up

- Why did clojure become successful?

<!---

So lets talk about clojure. How did it all begin?

The answer is, of course: Rich Hickey. He'd had enough with writing concurrent
programs in object oriented languages for 18 years. He had an idea for a better
way to write programs which later became clojure, a clean, concurrent, hosted
lisp.

The aspirations at first were not spectacular. During the keynote I mentioned
before, he started with saying that: "10 years ago, clojure was released. ... I
told my wife: If a hundred people used this , that'd be ridiculously
outrageous. And that's not what happened."

However, after working on clojure on a while, Rich quickly realized that Clojure
was the idea of his life. A couple of years after the initial idea, Rich made
the language public domain and started traveling around talking about clojure.

There are many things that can be attributed clojures success. Clojure is based
on a few distinct, clear ideas which I"ll talk more about later. But no piece of
technology will get adopted if nobody knows about it. I'd argue that part of
clojures success is Rich Hickeys excellent public speaking skills.

-->

## Haskell

- Miranda ('85) influences new iteration of lazy purely functional languages.

- at FPCA '87, a commettee was formed in attempt to create a unified language.

- Committee's efforts result in haskell ('90)

- Avoid success at all costs

<!---

So lets talk about Haskell.

This is a completely different story, whose starting point is more debatable.
But lets discuss year 1985 when the computer scientist and language designer
David Turners research had resulted in a language called Miranda.

At this time, an interest in strongly typed lazy functional languages were
growing in general. In 1987 we had more than a dozen Miranda-like languages, and
these mainly used for exactly the same thing, namely to serve as a medium in
research papers.

As a result, almost all articles used a different language, and hence needed to
spend the first paragraphs just defining the language that were being used.

To solve this "problem", a commettee were formed at the conference on Functional
Programming Languages and Computer Architecture to create a unified language
that would serve as a tool for future research.

This language became Haskell. Haskell was thus a collaberative effort among many
people over an extended amount of time. Ther are many names that has to be
mentioned when talking about designing haskell. If you're interested in this,
I'll link to [TODO]

Today, Haskell is commonly accepted to be the de-facto standard for
strong/static functional programming languages, and we see many modern languages
such as Elm, Idris or purescript drawing all basic ideas from haskell, both syntax
and semanics.

But officially haskell remains a experimental research language . An infamous
slogan which is often cited in haskell contexts reads 'Avoid success at all
costs'.

-->

# Part 2: Design Philosophy and Usage

## Clojure

"A language that doesn't affect the way you think about programming is not worth knowing.”
- Alan Perlis

### Simple made easy

- Simplicity

- Programmer responsibility

- Clojure targets:

1. Non-elegant.
2. Run continuously over an extended period of time.
3. Deal with real world irregularity.
4. Interact with other systems.
5. Interact with humans.
6. Remain in use for a long time.

### Hosted language

- "Just a java library"

- clj/cljs/cljc

### Code is Data

- If you know something, you forget that you had to learn it in the first place.

<!---

Why do we have clojure?

The core idea of clojure is simplicity, and that a lot of the complexity that we
have in modern software development is kind of accidental and a product of our
own disability to understand the world. Hence, Clojure is here to rescue.

The idea is to leave out the elements in programming that are complex, and
replace them with simple things. Without being very specific, it comes down the
idea that data itself is simple, and any kind of wrappers around data is not simple.
Ideomatic clojure uses constructs that deal directly with data, like pure
functions and immutable key-value maps.

But clojure won't force you to only write pure functions or use mathematical
abstractions. A clojure programmer has a different degree of freedom in comparison to a
haskell programmer. Clojure is opinionated sure, but the language itself does
not force you to design your interfaces in any particular way. This freedom
usually means that you have to do some planning up front, and can't jump in and
code directly. Clojure encourages thinking and responsibility on the individual
programmer.

For example, clojure does not have types, but you can use Clojure.Spec to opt in
to a type contract at any point you feel like. If you really want to use monads in
clojure - sure. You just have to implement that interface. However, nobody is
going to tell you to learn monads in order to use clojure to its full magnitude.

TODO MOVE DOWN
Rich Hickey speaks about why enforcing things on a language level is a bad
idea. In the real world, he says, programs are:

1. Non-elegant.
2. Run continuously over an extended period of time.
3. Deal with real world irregularity.
4. Interact with other systems.
5. Interact with humans.

I'll return to this in a while. For now, lets cover the other ideas on which
clojure is built on.

The second idea is that clojure is a hosted language, meaning it does not have
it's own runtime. Who knows how many clojure-variants have existed that never
got to see the light of day because their creators couldn't create efficient
compilers. Due to the fact that clojure is a hosted language, the creators of
clojure(script) basically just had to write a library for the respective
environments.

A practical implication of this is the .cljc extension. For anyone that doesn't
know, the cljc extension allows you to write a single source file that acts like
any clojure code independent on the runtime environment. You can thus reuse all
your sources for clojure in clojurescript for example.  This is how I think
programming will be done in the future. Write once, run on any compiler.

A third clojure idea is that it is a lisp. Code is data, or more conceptually
easy to understand (I think) data is code. No distinction. When this clicked for
me was when I understood that clojure doesn't have syntax.  You don't edit lines
of code in some ascii-textfile that magically gets compiled and run depending on
semantics you can't influence.  You edit things inside brackets, which denote
real datastructures. There is nothing to learn. No special JSX syntax, no
magic. Just you and your data. There is obviously more to this but let's talk a
little bit about haskell.

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

- Safe from runtime exceptions

- Core abstractions from category theory.

- Type systems knows you

- Some problems with adaption

<!---

Haskell has a strong static type-system which means it's harder to get runtime-
errors than to not get runtime errors.

To obtain freedom and elegance while maintaining this safety, haskell makes use
of very few, but very powerful abstractions, that gets used everywhere. Many of
Haskells abstractions comes from category theory, a branch of mathematics that
abstracts mathematics through composition.  Naturally, haskellers are good at
composing things. Not only composing functions but promises, and all kinds of
self-defined datatypes.  Since programming is about dividing problems into
smaller parts and then composing them together, many of these abstractions can
be invaluable.

Haskell programmers model their problem domain in terms of types and pure
functions based on those types. Applying type driven development in this way,
you're often doing a lot of thinking up-front just like clojurians, the
difference being that haskellers are forced to it or the program wont compile.

Since you model your problem in types, the type checker is helping you, not
working against you. This is in contrast to many imperative programmers in
static languages like Java which feel that the compiler is working against them.
The haskell type checker can infer the most generic type of every value of your
program, without you having to specify it. Since you model your problem in types
it means that the haskell compiler "understands" your program. Using this logic,
a compile time error usually means something wrong in your thinking.

Obviously, haskell excels in error-prone applications where it's easy to make
mistakes. Common examples are compilers and parsers, but gets used in all kind
of applications. However, haskell industrial use is limited. Haskellers do not
have a rails framework, or large coorperation funding. Many libraries are
experimental or undocumented. If you need to connect to Microsoft SQL server, it
can be difficult. It often comes down to: if you're not going to write that
library, no one else will.

Some specific reasons haskell adoption is low are the following:
- Lack of IDE
- Memory usage difficult to reason about due to lazyness
- Bindings to commercial libraries often non-existent
- Lack of documentation because of the fact that we have types.

But I think the most interesting reason, is illustraded through the Elm
programming language. Elm is on first glance a very haskell-like language, its
syntax is practically indistinguishable with haskells. However, Elm misses some
important design ideas, for example higher kinded types. With no higher kinded types,
you can't define a common interface for mappable types in statically typed
languages. In haskell, all things that can be mapped over is a Functor and you
just call map interchangebly. In elm you can't do this, and as a result, you
have to do List.Map, Map.Map, Array.Map etc...

Does this (and other things) stop people from using from using Elm? No. Elm is
probably more widely adopted than "better" languages such as purescript
anyways. The consensus?  People don't want to know what a functor is.  Or:
people feel that in order to use haskell, you have to learn what a functor is,
then applicative, then monoid until you finally climb the mountain and
understand monads. And since nobody wants to climb a mountain, hence haskell
does not get adopted. You can of course use haskell without knowing anything
about these abstractions, but its clearly disencouraging using a language in
which you only understand the basics.

Of course, you don't have have to climb a mountain in order to use mathematical
abstractions. Take monoid. It is a laughable simple concept. It is the class of
all types which fulfill the idea that you can append data together.  There is
one more important thing to it: the append needs to be accociative. That means
if you have three appendable items after eachother, it does not matter in which
order you append them to eachother. As a result, when we are talking about
monoids, we know that we are talking about data , which you safely can
parellalize, or recursively descend into.

It would not be very misleading to rename monoid to appendable. But then, would
you at the same time rename Integer to addable? A monoid is a monoid, an integer
is an integer.

-->

# Part 3: The static vs the dynamic world

## Haskell vs Clojure

- Some concrete implications of the type checker

1. Being forced to handle all possible values (and thus know that you have
  handled them all).
2. Being forced to think more up front about your design.
3. Refactoring out a piece of your code, and easily detect if something broke
  (maintainability).
4. Discovering a library function without having to write it yourself (hoogle).
6. Diving into a big program and better understanding whats going on.
7. Know what a function does only by reading the well-defined name and type
  (How many ways can foo :: (a, b) -> a be implemented?)
  signature. (List.Split.chunksOf :: Int -> [a] -> [[a]]) vs
  (defn list.split/chunks-of [n xs] ...)
8. Knowing when side effects occur and what kind
  fetch :: URL -> AJAX String

- Some real problems in software development the type checker does not solve

1. Misconception of problem domain
2. Communicating with other systems of different constraints

<!---

Typos and inconsistencies are easy to do in clojure. The type checker removes
this. Lets start part 3 with discussing some other things you get with the
static type checker.

I've compiled a list of features of the type checker. Good or bad?

* Being forced to handle all possible values (and thus know that you have
  handled them all).
* Being forced to think more up front about your design.
* Refactoring out a piece of your code, and easily detect if something broke
  (maintainability).
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

In the real world, information dominates logic. Data is fluid and
unpredictable. In order to deal with that, you could go two separate ways.

1. Make your program should be dynamically extensible, and open, and let the data
come to you.
2. Try to understand your data and model your problem depending on that.

But the fact of the matter is, we have both and we'll always have both. The
question is only where you draw the line. Consider:

If you have a really open system you still have to define a well-defined
interface to be able to do something useful. Otherwise you just know one single
thing about your data: it's existence. At this point you're gradually turning
your program static, and less flexible for changes. This turns into a paradox.

Because of this paradox, we have the clash between the static and the dynamic
world. So how do we choose?

First attempt: "Use the right tool for the job"

this is a popular saying in the community. The problem with this is a
zero-information statement. To use this advice you'd have to know every tool and
all potential solutions to this problems. Also, what we really don't want our
languages restricted to a specific use-case. We create general-purpose languages
because we just want to solve problems, any problem.

Finally: Your view on the world

I'd like to end this in a more philosophical manner. There is a theory called
platonism, allthough unclear if it originated from Plato, states that there is
some universal truth behind all of mathematics. If I draw a circle on a piece of
paper thats not a circle but merely a projection of the circle in the physical
world. A circle is something abstract that does not originates from the physical
world. It's also not a mental thing originating from our mind. It exists in a third
world, disconnected from the mental and physical world.

The other stance known as formalism is that you can sit down with a pen and
paper and write down a number of axioms. Then you can derive all of mathematics
from this. Gödel showed that there are some things in mathematics that cannot be
derived like this. On the other hand, the curry-howard-lambek isomorphism states
that different fields in mathematics have a one-to-one correspondance, ie they
are the same.

This of course has a lot more to it, but I think everyone could form an idea on
this matter. What do you think?

1. You're a platonist. You believe that mathematics and the universe has some
universal truth disjoint from our (current) understanding. You shouldn't try to
set up your own rules and enforce theories of understanding the world. Use clojure
as your tool as it helps you describe the world without restrictions.

2. You're a formalist. You believe that the fact that the "same" math was discovered
at different places at different times shows that there is som inherent structure in
our understanding and that we can control our own mind. We make our own mental models
and we change them as needed. Use haskell as your tool since the language lets you
describe structure better.

No matter in how you take your stand and what technologies you use: Remember to
stay open.  As craftsmen, we are really proud on our knowledge and our craft and
usually have big difficulties adopting to new paradigms.

As a conclusion: be open, try new ideas (even philosophical) and try to find the
middle ground!

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
