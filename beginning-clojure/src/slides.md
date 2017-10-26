---
title:      Beginning Clojure - A Diary
subtitle:   From Haskell to Clojure
author:     Ludvig Sundström
date:       November 2017, Bonn
colorlinks: true
linkcolor: black
classoption:
- dvipsnames
---

## Contents

- Some haskell things
- Some clojure things
- intersection, union and difference

# Origins and Creators

## Origins and Creators: Haskell

## Origins and Creators: Clojure

# Syntax

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
## Syntax: Clojure

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

``` {.clj include=src/listings/sample.clj snippet=vars dedent=4}
```

## Syntax: Haskell

# Environment

## Environment: Clojure

- clj/cljs/cljs

- The future of programming?

- Webassembly (clojure head start with cljc)

- Prefix notation allows for naturally variable number of arguments

- hosted language

- Drawback: configuration difficult

## Environment: Haskell

## Production

<!--- The joy and agony of haskell in production
-->

## Developing style

### Type driven development

- Haskell types are like sets, except that they contain 'bottom'

- Integer like N and bottom which represents

- Typical to start a program by laying out the types for the program

``` {.hs include=src/listings/Sample.hs snippet=type-driven-development}
```

### Data Driven development

- Homoiconic (program by assembling lisp data structures)

- Might seem like a syntax curiosity, but has huge implications.

- Think about code differently

- Rainbow delemiters

# Refactoring

## Refactoring in haskell

- Pureness

- Type checker tells you when you break something

# Interactive Programming

- ghci

- lein repl

# Argument passing and dispatch

- maps and multimethods

- function application and pattern matching

# Data Transformations

- Thread macros

- Composing functions

## A Graphviz Diagram

![](../diagrams/door.png)

## A PlantUML Diagram

![](../uml/activity.png){width=70%}
