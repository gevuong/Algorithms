* NodeJS runtime may not support ES 2015 modules, only commonJS modules. So on server side we're going to be using commonJS modules: (const express = require('express').
* But on the front-end, we can use ES 2015 modules (i.e. import express from 'express'). 


# Learn and Understand NodeJS


## V8: The Javascript Engine
* The heart of NodeJS lies within the V8 JavaScript Engine

### Processors
* Microprocessors accepts instructions in particular language it understands, and carries them out. Microprocessors will likely speak one of these different machine languages such as: IA-32, x86-64, ARM, MIPS.

### Machine Code (aka Machine Language)
* Programming languages spoken by computer processors. Every program you run on your computer has been converted (or compiled) into machine code that your computer processor speaks.

* All code eventually becomes machine code.

* We've gone further and further abstracted away from lower-level code, and more into higher-level languages.

* Levels of Abstraction: Machine Language -> Assembly Language -> C/C++ -> Javascript (very high level, don't deal with where memory is and what it's doing, we have an engine that takes care of that for you)

### IMPORTANT: Node itself is written in C++. It's a C++ program because V8, which converts Javascript to machine code, is written in C++. V8 sits at the core of NodeJS.


### What is a Javascript Engine?
* A program that converts JS code into something the computer processor can understand. And it should follow the ECMAScript standard on how the language should work and what features it should have. There are many JS engines out there.

* V8 is Google's open-source JS engine, and was originally built to be used inside Chrome's browser.

### Adding Features to JS
* C++ has more features than Javascript as a programming language. JS was designed to be in the browser, not dealing with lower level operations like connecting to DB or dealing with files or folders in hard drive.



## The Node Core
### Servers and Clients
* NodeJS is a server technology, allowing you to use JS to write server code.

#### Client-Server Model of Computing
* Server performs services, client asks for services. The Client makes a HTTP request for a service for some work to be performed, and server HTTP responds with verification, error message, or data.

### What does JS need to manage a server?
* Better ways to organize code into reusable pieces
* Ways to deal with files (zip files, images)
* Ways to deal with databases (its the web server that talks to DB)

### C++ and JS core
* C++ core is a core of features and utilities built in C++, made available to JS via the hooks of v8 engine. NodeJS provides features for JS, to make available for JS. NodeJS allows us to have more features than normal.

### When writing JS in node:
* JS got passed into Node, Node passed it through the embedded V8 engine, and got a response back from code being executed.



## Modules
* A reusable block of code whose existence does not accidentally impact other code. JS did not have this before.  

* CommonJS Modules: An agreed upon standard for how code modules should be structured

* First-class Functions: Everything you can do with other types (i.e. strings, numbers), you can do with functions. Functions in JS are first-class, you can assign them to variables, and put them in arrays.
* Functions in JS are first-class, that means we can pass them around.

* Expression: A block of code that results in a value. Like setting a variable to a value.
