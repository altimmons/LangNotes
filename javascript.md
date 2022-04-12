# JavaScript

[Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)


[JavaScript reference - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference)


[DOM Standard](https://dom.spec.whatwg.org/)

[ECMA Documentation](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements)

- OVERVIEW
  - Expressions and operators -JavaScript expressions and operators. 
    - Primary expressions
      - this
      - function
      - class
      - function*
      - yield
      - yield*
      - async function
      - await
      - []
      - {}
      - /ab+c/i
      - ( )
      - null
  - Left-hand-side expressions
    - Property accessors
    - new
    - new.target
    - import.meta
    - super
    - ...obj
  - Increment & decrement
    - A++ ,  A--, ++A, --A
  - Unary operators
    - delete
    - void
    - typeof
    - +
    - -
    - ~
    - !
  - Arithmetic operators
    - +,  -,  /,  *,  %,  **
  - Relational operators
    - in
    - instanceof
    - <,  >,  <=, >=
  - Equality operators
    - ==,  !=,  
    - ===,  !==
  - Bitwise shift operators
    - <<
    - >>
    - >>>
  - Binary bitwise operators
    - `&`,  `|`,  `^`
  - Binary logical operators
    - `&&`,  `||`
  - Conditional (ternary) operator
    - `(condition ? ifTrue : ifFalse)`
  - Assignment operators
    - `=`, 
    - `*=`, `/=`, `%=`, `+=`, `-=`
    - `<<=`, `>>=`,  `>>>=`, `&=`, `^=`, `|=`
    - [a, b] = [1, 2]
    - {a, b} = {a:1, b:2}
  - Value properties
    - Infinity
    - NaN
    - undefined
    - globalThis
  - Function properties
    - eval()
    - isFinite()
    - isNaN()
    - parseFloat()
    - parseInt()
    - decodeURI()
    - decodeURIComponent()
    - encodeURI()
    - encodeURIComponent()
  - Fundamental objects
    - Object
    - Function
    - Boolean
    - Symbol
  - Error objects
    - Error
    - AggregateError
    - EvalError
    - InternalError
    - RangeError
    - ReferenceError
    - SyntaxError
    - TypeError
    - URIError
  - Numbers & dates
    - Number
    - BigInt
    - [Math](#math)
    - Date
  - Text processing
    - String
    - RegExp
  - Indexed Collections
    - Array
    - Int8Array
    - Uint8Array
    - Uint8ClampedArray
    - Int16Array
    - Uint16Array
    - Int32Array
    - Uint32Array
    - Float32Array
    - Float64Array
    - BigInt64Array
    - BigUint64Array
  - Keyed collections
    - Map
    - Set
    - WeakMap
    - WeakSet
  - Structured data
    - ArrayBuffer
    - SharedArrayBuffer
    - Atomics
    - DataView
    - JSON
  - Control abstraction
    - GeneratorFunction
    - AsyncGeneratorFunction
    - Generator
    - AsyncGenerator
    - AsyncFunction
    - Promise
  - Reflection
    - Reflect
    - Proxy
  - Internationalization
    - Intl
    - Intl.Collator
    - Intl.DateTimeFormat
    - Intl.DisplayNames
    - Intl.ListFormat
    - Intl.Locale
    - Intl.NumberFormat
    - Intl.PluralRules
    - Intl.RelativeTimeFormat
  - WebAssembly
    - WebAssembly
    - WebAssembly.Module
    - WebAssembly.Instance
    - WebAssembly.Memory
    - WebAssembly.Table
    - WebAssembly.CompileError
    - WebAssembly.LinkError
    - WebAssembly.RuntimeError
- Statements- JavaScript statements and declarations
  - `Block` - A block statement is used to group zero or more statements. The block is delimited by a pair of curly brackets.
  - `break` - Terminates the current loop, switch, or label statement and transfers program control to the statement following the terminated statement.
  - `continue` - Terminates execution of the statements in the current iteration of the current or labeled loop, and continues execution of the loop with the next iteration.
  - `Empty` - An empty statement is used to provide no statement, although the JavaScript syntax would expect one.
  - `if...else` - Executes a statement if a specified condition is true. If the condition is false, another statement can be executed.
  - `switch` - Evaluates an expression, matching the expression's value to a case clause, and executes statements associated with that case.
  - `throw` - Throws a user-defined exception.
  - `try...catch` - Marks a block of statements to try, and specifies a response, should an exception be thrown.
- Declarations
  - `var` - Declares a variable, optionally initializing it to a value.
  - `let` - Declares a block scope local variable, optionally initializing it to a value.
  - `const` - Declares a read-only named constant.
- Functions and classes
  - `function` - Declares a function with the specified parameters.
  - `function*` - Generator Functions enable writing iterators more easily.
  - `async function` - Declares an async function with the specified parameters.
  - `return` - Specifies the value to be returned by a function.
  - `class` - Declares a class.
- Iterations
  - `do...while` - Creates a loop that executes a specified statement until the test condition evaluates to false. The condition is evaluated after executing the statement, resulting in the specified statement executing at least once.
  - `for` - Creates a loop that consists of three optional expressions, enclosed in parentheses and separated by semicolons, followed by a statement executed in the loop.
  - `for each...in ` - Iterates a specified variable over all values of object's properties. For each distinct property, a specified statement is executed. This is deprecated, and you should use for...of instead.
  - `for...in` - Iterates over the enumerable properties of an object, in arbitrary order. For each distinct property, statements can be executed.
  - `for...of` - Iterates over iterable objects (including arrays, array-like objects, iterators and generators), invoking a custom iteration hook with statements to be executed for the value of each distinct property.
  - `for await...of` - Iterates over async iterable objects, array-like objects, iterators and generators, invoking a custom iteration hook with statements to be executed for the value of each distinct property.
  - `while` - Creates a loop that executes a specified statement as long as the test condition evaluates to true. The condition is evaluated before executing the statement.
- Others
  - `debugger` - Invokes any available debugging functionality. If no debugging functionality is available, this statement has no effect.
  - `export` - Used to export functions to make them available for imports in external modules, and other scripts.
  - `import` - Used to import functions exported from an external module, another script.
  - `label` - Provides a statement with an identifier that you can refer to using a break or continue statement.
  - `with ` - Extends the scope chain for a statement.


- Functions and classes
  - function
  - function*
  - async function
  - return
  - class

  - while
  - Other
  - debugger
  - export
  - import
  - label
  - with

## NPM

### Getting Started
   
List everything you have installed in the current directory

      npm ls

Search the registry for packages matching terms

      npm search[search terms]

Install a package

      npm install[<name> [<name> ...]] [--save|--save-dev|--save-optional]

This command installs a package, or packages, and any packages that it depends on in the current directory. If the package has a shrinkwrap file, the installation of dependencies will be driven by that.

If no package.json exists, these options are ignored. If it exists, they'll update them if they are already there.

- `--save`: Package will appear in your depedencies.
- `--save-dev`: Package will appear in your devDependencies.
- `--save-optional`: Package will appear in your optionalDependencies.
- `--global`: Package will be installed globally (if you want to use it as a command line tool for example)

Install a package in the version

            npm install <module-name>@<version-name>

Uninstall a package, completely removing everything npm installed on its behalf
      
      npm uninstall

Update all the packages listed to the latest version (specified by the tag config). Also install missing packages
      
      npm update [<name> [<name> ...]]
Update the global npm version
      
      npm update npm -g

Display the README.md / documentation / npmjs.org page of a give library
      
      npm docs <module-name>
Run package test suite, based on setup in package.json in
            
      "scripts" : {"test" : "node testfile.js"}

List outdated libraries compared to currently installed node_modules
            
      npm outdated

Lock down dependency versions
            
      npm shrinkwrap

### Develop
    
Interactively create a package.json file
            
      npm init
         
Asks you a bunch of questions, and then writes a package.json for you. If you already have a package.json file, it'll read that first, and default to the options in there.
            
Install a git specific release
            
      npm install git://github.com/Marak/colors.js#v0.6.0

Locally edit a dependency
            
      npm edit <module_name>

Setup editor for npm edit
               
      npm config set editor "sublime"

Publish a package not under the default "latest" tag
               
      npm publish --tag beta
      

## VS Code

Install Live server

Open workspace
index.html -> type ! and hit tab

```html

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=.5, initial-scale=1.0">
    <title>TestDoc</title>
    <script src="index.js"></script>
</head>
<body>
    
</body>
</html>
```

create index.js.

Live server is in the bottom, or if ot, select open with liveserver 
on right click.


## Basics

declarations are with `let` and `var`. `const` is an immutable value.

can end in a semicolon or not.

 - ==, !=, >=, <=, >, < 


`===` = strict equality type.  `==` tries to convert both types to a common type.

3 ==  3  T
3 == '3' T
3 === '3' F

`!==` is strict inequality.


### Arrays

Zero indexed, can be mixed, including more arrays.

      var ourArray = ["string", 123];

      var nestedArray = [[2,3] , 4 ,5 ];

      var nestedAccess= nestedArray[0][0] //2

Arrays are mutable (unlike char arrays (strings))

You can append to an array with `push`

      var myArr = [['a', 'b'], ['c', 'd']];
      myArr.push(['e', 'f']);

can also `pop`

      var myArr = [1, 2, 3];
      myArr.pop();

Alternatively, `shift` removes the first element

      var myArr = [1, 2, 3];
      myArr.shift();

The push equivalent of `shift` is `unshift`.  This pushes an element onto the front of the stack.


## Objects

## Math



    var myVar = 87;
    myVar++;
    myVar--;
    myVar+=3;
    myVar-=3;
    myVar/=3;
    var ourDec = 5.7;
    //modulus (remainder)
    myVar = myVar % 3;

[Math Definition](https://tc39.es/ecma262/#sec-math-object)

[Math Summary](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math)


(^.+$)\n(^.*$) - `$1` - $2\n

- **Static Values (Constants)**
  - `Math.E` - Euler's constant and the base of natural logarithms; approximately 2.718.
  - `Math.LN2` - Natural logarithm of 2; approximately 0.693.
  - `Math.LN10` - Natural logarithm of 10; approximately 2.303.
  - `Math.LOG2E` - Base-2 logarithm of E; approximately 1.443.
  - `Math.LOG10E` - Base-10 logarithm of E; approximately 0.434.
  - `Math.PI` - Ratio of the a circle's circumference to its diameter; approximately 3.14159.
  - `Math.SQRT1_2` - Square root of ½ (or equivalently, 1/√2); approximately 0.707.
  - `Math.SQRT2` - Square root of 2; approximately 1.414.
- **Static methods**
  - `Math.abs(x)` - Returns the absolute value of x.
  - `Math.acos(x)` - Returns the arccosine of x.
  - `Math.acosh(x)` - Returns the hyperbolic arccosine of x.
  - `Math.asin(x)` - Returns the arcsine of x.
  - `Math.asinh(x)` - Returns the hyperbolic arcsine of a number.
  - `Math.atan(x)` - Returns the arctangent of x.
  - `Math.atanh(x)` - Returns the hyperbolic arctangent of x.
  - `Math.atan2(y, x)` - Returns the arctangent of the quotient of its arguments.
  - `Math.cbrt(x)` - Returns the cube root of x.
  - `Math.ceil(x)` - Returns the smallest integer greater than or equal to x.
  - `Math.clz32(x)` - Returns the number of leading zeroes of the 32-bit integer x.
  - `Math.cos(x)` - Returns the cosine of x.
  - `Math.cosh(x)` - Returns the hyperbolic cosine of x.
  - `Math.exp(x)` - Returns Ex, where x is the argument, and E is Euler's constant (2.718…, the base of the natural logarithm).
  - `Math.expm1(x)` - Returns subtracting 1 from exp(x).
  - `Math.floor(x)` - Returns the largest integer less than or equal to x.
  - `Math.fround(x)` - Returns the nearest single precision float representation of x.
  - `Math.hypot([x[, y[, …]]])` - Returns the square root of the sum of squares of its arguments.
  - `Math.imul(x, y)` - Returns the result of the 32-bit integer multiplication of x and y.
  - `Math.log(x)` - Returns the natural logarithm (㏒e; also, ㏑) of x.
  - `Math.log1p(x)` - Returns the natural logarithm (㏒e; also ㏑) of 1 + x for the number x.
  - `Math.log10(x)` - Returns the base-10 logarithm of x.
  - `Math.log2(x)` - Returns the base-2 logarithm of x.
  - `Math.max([x[, y[, …]]])` - Returns the largest of zero or more numbers.
  - `Math.min([x[, y[, …]]])` - Returns the smallest of zero or more numbers.
  - `Math.pow(x, y)` - Returns base x to the exponent power y (that is, xy).
  - `Math.random()` - Returns a pseudo-random number between 0 and 1.
  - `Math.round(x)` - Returns the value of the number x rounded to the nearest integer.
  - `Math.sign(x)` - Returns the sign of the x, indicating whether x is positive, negative, or zero.
  - `Math.sin(x)` - Returns the sine of x.
  - `Math.sinh(x)` - Returns the hyperbolic sine of x.
  - `Math.sqrt(x)` - Returns the positive square root of x.
  - `Math.tan(x)` - Returns the tangent of x.
  - `Math.tanh(x)` - Returns the hyperbolic tangent of x.
  - `Math.trunc(x)` - Returns the integer portion of x, removing any fractional digits.


## Strings


Strings are immutable

      var myStr = 'jello';
      myStr[0]='h';
      //error
      mystring = 'hello';

//Strings
var nameVar = 'string'; //quote
nameVar = "String"; //double quotes
nameVar = `String`; //backticks
nameVar = '"String"'; //quote inside a string
nameVar = `'a href=<"some address">'`
var escape = '\'';

string additon

      var str = "hello" + "world";

index strings

      str[0]; 

last letter

      str[str.length - 1];

Vars and strings

      var mystring =  "My name is" + myName

Append 

      myVar += ".";

### String Methods

      myString.length;
      console.log(myStr.length)

### Formatting

The following function returns a string containing the formatted representation of a number padded with leading zeros.

    // This function returns a string padded with leading zeros
    function padZeros(num, totalLen) {
      var numStr = num.toString();             // Initialize return value as string
      var numZeros = totalLen - numStr.length; // Calculate no. of zeros
      for (var i = 1; i <= numZeros; i++) {
          numStr = "0" + numStr;
      }
      return numStr;
    }

The following statements call the padZeros function.

    var result;
    result = padZeros(42,4); // returns "0042"
    result = padZeros(42,2); // returns "42"
    result = padZeros(5,4);  // returns "0005"

### String Formatting

`${var}` will add a variable in place:
  
 ``console.log(`Server running at http://${hostname}:${port}/`);``

!!!Note Note: Substitution uses backticks [[\`]]


## Conditionals

    function isLess(a,b){
      return a < b
    }

    if (val == test) {
      return body
    } else if (val == test2){
      return body2 
    } else {
      return body3
    }


### Case switch


    var val =  0;
    val ans = "";

    switch(val){
      case 1: 
        return;
        break;
      case 2:
        return;
        break;
      default:
        ans =  "";
        break;
    }

## Iterations

- Iterations
  - `do...while` - Creates a loop that executes a specified statement until the test condition evaluates to false. The condition is evaluated after executing the statement, resulting in the specified statement executing at least once.
  - `for` - Creates a loop that consists of three optional expressions, enclosed in parentheses and separated by semicolons, followed by a statement executed in the loop.
  - `for each...in ` - Iterates a specified variable over all values of object's properties. For each distinct property, a specified statement is executed. This is deprecated, and you should use for...of instead.
  - `for...in` - Iterates over the enumerable properties of an object, in arbitrary order. For each distinct property, statements can be executed.
  - `for...of` - Iterates over iterable objects (including arrays, array-like objects, iterators and generators), invoking a custom iteration hook with statements to be executed for the value of each distinct property.
  - `for await...of` - Iterates over async iterable objects, array-like objects, iterators and generators, invoking a custom iteration hook with statements to be executed for the value of each distinct property.
  - `while` - Creates a loop that executes a specified statement as long as the test condition evaluates to true. The condition is evaluated before executing the statement.


## Functions

Every function in JavaScript is a Function object. See Function for information on properties and methods of Function objects.

The this keyword does not refer to the currently executing function, so you must refer to Function objects by name, even within the function body.


[The arguments object - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/arguments)

[Functions - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions)


    function exampleFunc(param) {
      return param - 5;
    }

    console.log(exampleFunc(5));

No returned value is specified. 

    var sum;  // global var

    function undefFunc(num) {
      sum = num + num;
    }
    
    console.log(sum)

To return a value other than the _default,_ a function must have a `return` statement that specifies the value to return. A function without a `return` statement will return a default value. In the case of a constructor called with the `new` keyword, the default value is the value of its `this` parameter. For all other functions, the default return value is `undefined`.

The parameters of a function call are the function's arguments. Arguments are passed to functions by value. If the function changes the value of an argument, this change is not reflected globally or in the calling function. However, object references are values, too, and they are special: if the function changes the referred object's properties, that change is visible outside the function, as shown in the following example:


```js
  /* Declare the function 'myFunc' */
  function myFunc(theObject) {
    theObject.brand = "Toyota";
  }

  /*
  * Declare variable 'mycar';
  * create and initialize a new Object;
  * assign reference to it to 'mycar'
  */
  var mycar = {
    brand: "Honda",
    model: "Accord",
    year: 1998
  };

  /* Logs 'Honda' */
  console.log(mycar.brand);

  /* Pass object reference to the function */
  myFunc(mycar);

  /*
  * Logs 'Toyota' as the value of the 'brand' property
  * of the object, as changed to by the function.
  */
  console.log(mycar.brand);
```

`this` works in objects, but not functions.  In other words- you can't say this:

```js
  /* Declare the function 'myFunc' */
  function myFunc(theObject) {
    // theObject.brand = "Toyota";
    this.brand = "Toyota";
  }
```

[Source](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions)

### Function Declarations

    function name([param[, param[, ... param]]]) {
      statements
    }

### vs Function Expressions

    function [name]([param[, param[, ... param]]]) {
      statements
    }

Name is optional.  I think by expression they mean `f = function(){}` From the MDN Documentation "Statements involving functions which do not start with function are function expressions."

Anonymous Function Expression (Name Omitted)

    var myFunction = function namedFunction(){
        statements
    }


### Generator Functions

[function* - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/function*)

The `function* declaration` (function keyword followed by an asterisk) defines a generator function, which returns a `Generator` object.  You can also define generator functions using the `GeneratorFunction` constructor, or the function expression syntax.

Syntax:

    function* name([param[, param[, ... param]]]) {
      statements
    }


Generators are functions that can be exited and later re-entered. Their context (variable bindings) will be saved across re-entrances.

Generators in JavaScript -- especially when combined with Promises -- are a very powerful tool for asynchronous programming as they mitigate -- if not entirely eliminate -- the problems with callbacks, such as Callback Hell and Inversion of Control. However, an even simpler solution to these problems can be achieved with async functions.

## Dynamicism

### Event Listeners

Implement the eventTarget interface

    obj.addEventListener("load", imgFetched)

    function imgFetched(ev) {
      // great success
      …
    }

Event listeners can be removed by utilizing the `removeEventListener()` method passing the same arguments.

Events themselves are objects, and implement the Event interface.

`ev` is the event. `ev` is passed to the callback as an arg.


`ev` has properties `type` which is what matches it with an event.  `ev.type` above = `"load"`.  `ev.target` is the property to which it was dispatched, in this case its `obj`.

Most are dispatched by the userAgent.  But can also be synthetic.  Dispatching a synthetic event below:

```js
  // add an appropriate event listener
  obj.addEventListener("cat", function(e) { process(e.detail) })

  // create and dispatch the event
  var event = new CustomEvent("cat", {"detail":{"hazcheeseburger":true}})
  obj.dispatchEvent(event)
  
  if(obj.dispatchEvent(event)) {
    // event was not canceled, time for some magic
    …
  }
```

Events percolate through a tree.

```html
<!doctype html>
<html>
 <head>
  <title>Boring example</title>
 </head>
 <body>
  <p>Hello <span id=x>world</span>!</p>
  <script>
   function test(e) {
     //run the debug 
     debug(e.target, e.currentTarget, e.eventPhase)
   }
   document.addEventListener("hey", test, {capture: true})
   document.body.addEventListener("hey", test)

   //create a new event
   var ev = new Event("hey", {bubbles:true})
   //find where to insert the event (span) and dispatch it.
   document.getElementById("x").dispatchEvent(ev)
  </script>
 </body>
</html>


```

so we add a listener to the document.   Then we add another listener to document.body.  the debug line runs twice from the `test` function.  The `test` part is the callback.

in all cases, ev.target == span element.  

ev.currentTarget - though changes from `document` to `document.body`

ev.eventPhase is `CAPTURING_PHASE` when it hits the first listener in the tree.  Then `BUBBLING_PHASE` as it proceeds down the tree.  If the span element has a listener too, it would have been `AT TARGET`

### Callbacks, Async


[Callback Hell](http://callbackhell.com/)

[Inversion of Control](https://frontendmasters.com/courses/rethinking-async-js/callback-problems-inversion-of-control/)

In the context of callbacks, inversion of control is the notion of having code under your control in one part of the program, then handing control over to a callback in another part of the program. 

`Thunk` - a function that already has everything it needs to return a value- e.g. no parameters are needed.

```js

function add(x,y) {
  return x + y;
}

var thunk = function(){
  return add(10,15);
};

thunk();  //25

```

This is a `synchronus thunk`- its a wrapper for a state as an object.  This leads to the underpinning of `promises`.  It can be passed around the program.  

`asynchronous thunks` -  doesnt need anything passed to it but it does need a callback to get the value out.

```js
function addAsync(x,y,callback){
  setTimeout(
      function(){
        callback(x + y);
      },
      1000);
}

var thunk = function(callback) { 
  addAsync(10, 15, callback);
};

thunk(function(sum){
  sum;
});

```

Important because we don't know (nor care) when the value will be returned.  It will just return it when its done.

`Promise` is a time-independent wrapper around a value. `Thunks` are promises without the fancy API.


```js
//generalized utility for making thunks. Used as a (bad?) example?
function makeThunk(fn) {
  var args = [].slice.call(arguments, 1);
  return function(cb) {
      args.push(cb);
      fn.apply(null, args);
  };
}

//another usage- same as the `add async' example above, replacing the last func:

function addAsync(x,y,callback){
  setTimeout(
      function(){
        callback(x + y);
      },
      1000);
}

var thunk = makeThunk( addAsync, 10, 15);

thunk(function(sum){
  console.log(sum);
}); 

```


```js
var get10 = makeThunk(getData, 10); //needs to call getData with value 10
var get30 = makeThunk(getData, 30); //this might be a database query

get10(function(num1){
  var x = 1 + num1;
  get30(function(num2){
    var y = 1 + num2;

    //cant pre-declare this like get10, get30, because its temporally
    //dependent on get10, get30
    var getAnswer = makeThunk( getData, "Meaning of Life" + (x +y)
    );

    getAnswer(function(answer){
      console.log(answer);
    });
  }):
});
```


## Node.js

### Built In Modules

[Source](https://www.w3schools.com/nodejs/ref_modules.asp)



- **assert** -> Provides a set of assertion tests
- **buffer** -> To handle binary data
- **child_process** -> To run a child process
- **cluster** -> To split a single Node process into multiple processes
- **crypto** -> To handle OpenSSL cryptographic functions
- **dgram** -> Provides implementation of UDP datagram sockets
- **dns** -> To do DNS lookups and name resolution functions
- **domain** -> Deprecated. To handle unhandled errors
- **events** -> To handle events
- **fs** -> To handle the file system
- **http** -> To make Node.js act as an HTTP server
- **https** -> To make Node.js act as an HTTPS server.
- **net** -> To create servers and clients
- **os** -> Provides information about the operation system
- **path** -> To handle file paths
- **punycode** -> Deprecated. A character encoding scheme
- **querystring** -> To handle URL query strings
- **readline** -> To handle readable streams one line at the time
- **stream** -> To handle streaming data
- **string_decoder** -> To decode buffer objects into strings
- **timers** -> To execute a function after a given number of milliseconds
- **tls** -> To implement TLS and SSL protocols
- **tty** -> Provides classes used by a text terminal
- **url** -> To parse URL strings
- **util** -> To access utility functions
- **v8** -> To access information about V8 (the JavaScript engine)
- **vm** -> To compile JavaScript code in a virtual machine
- **zlib** -> To compress or decompress files

### Server Example

```js
const http = require('http');
const hostname = '127.0.0.1';
const port = 3000;
const server = http.createServer((req, res) => {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'text/plain');
    //If the response from the HTTP server is supposed to be displayed as HTML, you should include an HTTP header with the correct content type:
    //res.setHeader('Content Type', 'text/plain');
    res.end('Hello World\n'); 
});

server.listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/n`);
});
//or we can append ths to the server declaration
const server = http.createServer((req, res) => {
   ...
}).listen(port, hostname, () => {
    console.log(`Server running at http://${hostname}:${port}/n`);
});

// or simply 
}).listen(8080);
```

```js
const server = http.createServer((req, res) => {
```

The function passed into the `http.createServer()` has a `req` argument that represents the request from the client, as an object (http.IncomingMessage object).

`res` here is the response

#### Header

  ```js
res.setHeader('Content-Type', 'text/html');
   res.setHeader('Content-Type', 'text/plain');

   //or
   res.writeHead(404, {'Content-Type': 'text/html'});
```

alternatively you can say `res.writeHead(404, {'Content-Type': 'text/html'});`

#### getting URL Data

```js
var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  res.write(req.url);
  res.end();
}).listen(8080);
```

This example outputs the address 

e.g. `http://localhost:8080/summer` returns summer and http://localhost:8080/fall returns fall.

This way you can get information on the target. 

#### Spltting the URL

[Source](https://www.w3schools.com/nodejs/nodejs_http.asp)

querying:
`http://localhost:8080/?year=2017&month=July`

```js
var http = require('http');
var url = require('url');

http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/html'});
  var q = url.parse(req.url, true).query;
  var txt = q.year + " " + q.month;
  res.end(txt);
}).listen(8080);
```

Will produce this result:

2017 July
  
summer.html

```html
<!DOCTYPE html>
<html>
<body>
<h1>Summer</h1>
<p>I love the sun!</p>
</body>
</html>

winter.html

```
<!DOCTYPE html>
<html>
<body>
<h1>Winter</h1>
<p>I love the snow!</p>
</body>
</html>
```

```js
var http = require('http');
var url = require('url');
var fs = require('fs');

http.createServer(function (req, res) {
  var q = url.parse(req.url, true);
  var filename = "." + q.pathname;
  fs.readFile(filename, function(err, data) {
    if (err) {
      res.writeHead(404, {'Content-Type': 'text/html'});
      return res.end("404 Not Found");
    } 
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8080);
```

### File Server

`var fs = require('fs');`

Read files
Create files
Update files
Delete files
Rename files

 fs.readFile() method is used to read files on your computer.

 Read Files
The `fs.readFile()` method is used to read files on your computer.

Assume we have the following HTML file (located in the same folder as Node.js):

demofile1.html

```html
<html>
<body>
<h1>My Header</h1>
<p>My paragraph.</p>
</body>
</html>
```

Create a Node.js file that reads the HTML file, and return the content:

```js
var http = require('http');
var fs = require('fs');
http.createServer(function (req, res) {
  fs.readFile('demofile1.html', function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    return res.end();
  });
}).listen(8080);
```

### Creating Files

The File System module has methods for creating new files:

  fs.appendFile()
  fs.open()
  fs.writeFile()

```js
var fs = require('fs');

fs.appendFile('mynewfile1.txt', 'Hello content!', function (err) {
  if (err) throw err;
  console.log('Saved!');
});
```


The fs.open() method takes a "flag" as the second argument, if the flag is "w" for "writing", the specified file is opened for writing. If the file does not exist, an empty file is created:

Create a new, empty file using the open() method:

```js
var fs = require('fs');

fs.open('mynewfile2.txt', 'w', function (err, file) {
  if (err) throw err;
  console.log('Saved!');
});
```
##### Write File

The fs.writeFile() method replaces the specified file and content if it exists. If the file does not exist, a new file, containing the specified content, will be created:

Create a new file using the writeFile() method:

```js
var fs = require('fs');

fs.writeFile('mynewfile3.txt', 'Hello content!', function (err) {
  if (err) throw err;
  console.log('Saved!');
});
```

##### Delete Files

To delete a file with the File System module,  use the fs.unlink() method.

The fs.unlink() method deletes the specified file:

Delete "mynewfile2.txt":

```js
var fs = require('fs');

fs.unlink('mynewfile2.txt', function (err) {
  if (err) throw err;
  console.log('File deleted!');
});
```

### Events

Every action on a computer is an event. Like when a connection is made or a file is opened.

Objects in Node.js can fire events, like the readStream object fires events when opening and closing a file:

```js
var fs = require('fs');
var rs = fs.createReadStream('./demofile.txt');
rs.on('open', function () {
  console.log('The file is open');
});
```

#### EventEmitter

Node.js has a built-in module, called "Events", where you can create-, fire-, and listen for- your own events.

To include the built-in Events module use the require() method. In addition, all event properties and methods are an instance of an EventEmitter object. To be able to access these properties and methods, create an EventEmitter object:

```js
var events = require('events');
var eventEmitter = new events.EventEmitter();
```

You can assign event handlers to your own events with the EventEmitter object.

In the example below we have created a function that will be executed when a "scream" event is fired.

To fire an event, use the `emit()` method.

```js
var events = require('events');
var eventEmitter = new events.EventEmitter();

//Create an event handler:
var myEventHandler = function () {
  console.log('I hear a scream!');
}

//Assign the event handler to an event:
eventEmitter.on('scream', myEventHandler);

//Fire the 'scream' event:
eventEmitter.emit('scream');

```

### Forms

[Source](https://www.w3schools.com/nodejs/nodejs_uploadfiles.asp)


```js
var http = require('http');
var formidable = require('formidable');
var fs = require('fs');

http.createServer(function (req, res) {
  if (req.url == '/fileupload') {
    var form = new formidable.IncomingForm();
    form.parse(req, function (err, fields, files) {
      var oldpath = files.filetoupload.filepath;
      var newpath = 'C:/Users/Your Name/' + files.filetoupload.originalFilename;
      fs.rename(oldpath, newpath, function (err) {
        if (err) throw err;
        res.write('File uploaded and moved!');
        res.end();
      });
 });
  } else {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write('<form action="fileupload" method="post" enctype="multipart/form-data">');
    //the action is here-- in formaction=fileupload opens ./fileupload
    res.write('<input type="file" name="filetoupload"><br>');
    res.write('<input type="submit">');
    res.write('</form>');
    return res.end();
  }
}).listen(8080);
```

#### Send an email

```js
var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    user: 'youremail@gmail.com',
    pass: 'yourpassword'
  }
});

var mailOptions = {
  from: 'youremail@gmail.com',
  to: 'myfriend@yahoo.com',
  subject: 'Sending Email using Node.js',
  text: 'That was easy!'
};

transporter.sendMail(mailOptions, function(error, info){
  if (error) {
    console.log(error);
  } else {
    console.log('Email sent: ' + info.response);
  }
});
```

## NPM


download 'upper-case'

>npm install upper-case

project now has a folder structure like this:

.\node_modules\upper-case

and creats `package-lock.json`:

```json
{
  "requires": true,
  "lockfileVersion": 1,
  "dependencies": {
    "tslib": {
      "version": "2.3.1",
      "resolved": "https://registry.npmjs.org/tslib/-/tslib-2.3.1.tgz",
      "integrity": "sha512-77EbyPPpMz+FRFRuAFlWMtmgUWGe9UOG2Z25NqCwiIjRhOf5iKGuzSe5P2w1laq+FkRy4p+PCuVkJSGkzTEKVw=="
    },
    "upper-case": {
      "version": "2.0.2",
      "resolved": "https://registry.npmjs.org/upper-case/-/upper-case-2.0.2.tgz",
      "integrity": "sha512-KgdgDGJt2TpuwBUIjgG6lzw2GWFRCW9Qkfkiv0DxqHHLYJHmtmdUIKcZd8rHgFSjopVTlw6ggzCm1b8MFQwikg==",
      "requires": {
        "tslib": "^2.0.3"
      }
    }
  }
}
```

just use it with `var uc = require('upper-case');`

### npm install

Without an argument, will install the files in package-lock.

## Starting from a template

[Source](https://morioh.com/p/d5c46313b141)


IN VSCODE open new window-
say create from git.  https://github.com/chriswells0/node-typescript-template.git
then select target,
it will clone and then you can open it.

Then run the commands 3-5

    $ git clone https://github.com/chriswells0/node-typescript-template.git <your project directory>
    $ cd <your project directory>
    $ rm -rf ./.git/
    $ git init
    $ npm install


Author Instructions

  
- Replace my name with yours: Chris Wells
  -   `find . -type f -exec sed -i 's/foo/bar/g' {} +`
If you are using zsh: ` sed -i -- 's/foo/bar/g' **/*(D.)`
[Source](https://unix.stackexchange.com/questions/112023/how-can-i-replace-a-string-in-a-files)
` sed -i -- 's/Chris Wells/Andy Timmons/g' **/*(D.)`

- Replace my website URL with yours: https://chriswells.io
  -
- Replace my GitHub username and project name with yours: chriswells0/node-typescript-template
  -
- Replace my NPM project name with yours: typescript-template
  -
- Update package.json:
  -
- Change description to suit your project.
  -
- Update the keywords list.
  -
- In the author section, add email if you want to include yours.
  -
- If you prefer something other than the BSD 3-Clause License, replace the entire contents of LICENSE as appropriate.
  -
- Update this README.md file to describe your project.
  -

## NPM

`npm init` to start a directory

Follow the commands to generate something like this.  Enter to accept defaults.


    {
      "name": "test_react",
      "version": "1.0.0",
      "description": "tutorial",
      "main": "index.js",
      "dependencies": {
        "create-react-app": "^5.0.0"
      },
      "devDependencies": {},
      "scripts": {
        "test": "echo \"Error: no test specified\" && exit 1"
      },
      "author": "ALT",
      "license": "ISC"
    }

npm install /i [package]


Need to install nodejs - package in Debian is `nodejs`

### Need to add NodeSource PPA
sudo apt-get install curl software-properties-common 
curl -sL https://deb.nodesource.com/setup_17.x | sudo bash - 
sudo apt-get install nodejs 

A more elaborate *package.json*

    {
      "name": "myreactapp",
      "version": "0.1.0",
      "private": true,
      "dependencies": {
        "@testing-library/jest-dom": "^5.16.3",
        "@testing-library/react": "^12.1.4",
        "@testing-library/user-event": "^13.5.0",
        "react": "^18.0.0",
        "react-dom": "^18.0.0",
        "react-scripts": "5.0.0",
        "web-vitals": "^2.1.4"
      },
      "scripts": {
        "start": "react-scripts start",
        "build": "react-scripts build",
        "test": "react-scripts test",
        "eject": "react-scripts eject"
      },
      "eslintConfig": {
        "extends": [
          "react-app",
          "react-app/jest"
        ]
      },
      "browserslist": {
        "production": [
          ">0.2%",
          "not dead",
          "not op_mini all"
        ],
        "development": [
          "last 1 chrome version",
          "last 1 firefox version",
          "last 1 safari version"
        ]
      }
    }


`npm start` runs this app.  this is React.

$ sudo npm install -g bower yarn



### Angular


[angular.io](https://angular.io/guide/setup-local#prerequisites)

    npm install angular
    npm i -g @angular/cli
    npm i angular-seed
    ng new my-app