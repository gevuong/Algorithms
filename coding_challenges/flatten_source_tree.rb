Imagine you’re building a tool which flattens a large number of source files into a single file to make it more portable.

Write a function, `sortedImports` , which takes a single file path( `./main.x` ) as input and returns the order in which that file,
and the others it imports, should be concatenated together to create the portable output file.

A convenience function `importsForFile(path)` returns the list of imports which are listed at the top of the given source file.
To make testing your solution easy, you can use this definition of `importsForFile` (or its equivalent in your programming language of choice):

    function importsForFile(path) {
      return {
        "main.x": ["thread.x", "message.x"],
        "thread.x": ["message.x", "contact.x"],
        "message.x": ["contact.x"],
        "contact.x": [],
      }[path];
    }

    function sortedImports(root = 'main.x') {
      // return the order in which files should be concatenated together
    }

    output: [contact.x, message.x, thread.x, main.x]



    {
        "main.x": ["thread.x", "message.x"],
        "thread.x": ["message.x", "contact.x"],
        "message.x": ["contact.x"],
        "contact.x": [],
    }
    