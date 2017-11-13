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
## About this talk

- Who am I?

- Why do I want to talk about this?

## Structure

- Clojure and Haskell: Origins and Creators

- Clojure and Haskell: Design Goals and Use cases

- Clojure and Haskell: Which one to pick?

# Part 1: Origins and Creators

## Clojure

- Rich Hickey gets an idea...

- Aspirations were small at first

- The recipe for success

## Haskell

- Miranda ('85) influences new set of languages

- FPCA '87, a commettee was formed in attempt to create a unified language

- Committee's efforts result in haskell ('90)

- *"Avoid success at all costs"*

# Part 2: Design Philosophy and Usage

## Clojure

*"A language that doesn't affect the way you think about programming is
not worth knowing.”* - Alan Perlis

- Removing accidental complexity

- Programmer responsibility to think about program and do whats right

## Clojure

- A hosted language: "Just a java library"

- .cljc extension for platform independent programming

## Clojure

- Code is data: No syntax

- JSX is something you have to learn, hiccup is just a clojure datastructure.

## Clojure

``` {.js include=src/listings/sample.js snippet=jsx}
```
``` {.clj include=src/listings/sample.clj snippet=hiccup}
```

## Haskell

- Safe from runtime exceptions

- Core abstractions from category theory.

- Type systems knows you

- Some problems with adaption

# Part 3: Which language to choose?

## The type checker: Implications

1. You are forced to handle all possible values.
2. You are forced to think more up front about your design.
3. You can refactoring out a piece of your code, and easily detect if something broke.
4. Diving into a big program and better understanding whats going on.
5. Discovering a library function without having to write it yourself.
7. Know what a function does only by reading the well-defined name and type

## The type checker: Implications

``` {.hs include=src/listings/Sample.hs snippet=type-signatures}
```

## The real world: Implications

Real programs are non elegant:

1. Run continuously over an extended period of time.
2. Deal with real world irregularity.
3. Interact with other systems.
4. Interact with humans.

- And the biggest problem in software development: Your inability to understand the
problem/program.

## Your options

- Open vs Closed paradox

## The practical approach: Other peoples view of the world

*"Use the right tool for the job"* - Practictioner of best

- Zero information statement

## The philosophical approach: Your view of the world

- platonism
- formalism

# Questions/Comments?

## Links

<http://www.stephendiehl.com/posts/production.html>

<http://ingesolvoll.github.io/2017/06/22/plain-react-vs-reagent.html>

<https://en.wikipedia.org/wiki/Haskell_(programming_language)#History>

<https://www.youtube.com/watch?v=2V1FtfBDsLU>

<http://dev.stephendiehl.com/hask/#string>

<https://github.com/Gabriel439/post-rfc/blob/master/sotu.md>

<http://tech.frontrowed.com/2017/11/01/rhetoric-of-clojure-and-haskell/>

<http://www.lispcast.com/clojure-and-types>
