# Learn Haskell
## Reference
http://learnyouahaskell.com/starting-out
## Compiler
GHC is the haskell compiler and it has an interactive mode GHCI. To start the interactive mode just use `ghci`
## Terminology
- **infix** function - functions that are sandwiched between two arguments
- **prefix** function - functions that are before their arguments
- **definitions** - functions that do not take any arguments
## Operations
- `/=` is for inequality
- `==` is for equality
## Functions
### Defining Functions
```
<func name> <arg1> <arg2> = <func definition>
```
### Calling Functions
```
<func name> <arg1> <arg2> <...>
```
Functions have the highest precendence over any other opertation so the following two operations are the same:
```
max 9 10 + min 2 3
(max 9 10) + (min 2 3)
```
We can call functions that take two params as infix if we use backtics like so:
```
div 92 10 // results in 9
92 `div` 10 // results in 9 as well
```
## `if` statements
- `if` statments are expressions (meaning they return a value)
- `else` part of the statement is mandatory
```
if <condition> then <statement> else <statement>
// example
if x > 100 then x else x*2
```
## Lists
- Lists must be **homogenous** (meaning it must only contain one data type)
- Strings are just lists of characters, so `"hello"` is just syntactic sugar for `['h','e','l','l','o']`
- Concatentation is done with `++` operator
- Prepending (adding to the front of the list) is done with `:`
- Appending has a time complexity of O(n) where n is the size of the first list
- Prepending has a time complexity of O(1)
- Lists are built using prepending meaning `[1,2,3]` is just `1:2:3:[]`
- To get an element at an index use `!!`
```
"abc" !! 2
// 'c'
```
### Operations
- `>`, `<`, `==` - all compare the first element and if they are equal then the next elements and so on
- `head` - returns the first element in the list
- `tail` - returns all elements after the first element in the list
- `last` - returns the last element in the list
- `init` - returns everything except the last element in the list
- `length` - returns the length of the list
- `null` - returns whether or not a list is empty
- `reverse` - returns the reverse of a list
- `take` - returns the first `n` elements in the list where `n` is the first param
- `drop` - returns everything except the first `n` elements in the list where `n` is the first param
- `maximum` - returns max value in the list
- `minimum` - returns min value in the list
- `sum` - returns the sum of the list
- `product` - returns the product of the list
- `elem` - returns whether or not the given element is found in the list
- `cycle` - repeats the same list multiple times
- `repeat` - repeats the same value infinitely
- `replicate` - repeats the same number `n` times where `n` is a given value

### List comprehension
Syntax:
```
list = [operation | selection | predicate]
//example
list = [x*2 | x <- [1..10], x*2 >= 12]
```
- Predicate is used to filter out certain values
- There can be multiple predicates and multiple selections
```
[x*y | x <- [1,2,3], y <- [4,5,6], x /= 1, x /= 4, y/= 4]
```
- Also can be used for strings
```
let nouns = ["hobo","frog","pope"]
let adjectives = ["lazy","grouchy","scheming"]
[adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
// ["lazy hobo","lazy frog","lazy pope","grouchy hobo","grouchy frog",
// "grouchy pope","scheming hobo","scheming frog","scheming pope"]
```
- Since strings are lists, we can use list comprehension to process strings as well
```
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]
```
### Ranges
Syntax:
```
range = [<range_start>,<second_value>..<range_end>]
```
## Tuples
- Doesn't have to be homogenous
- Has a set number of values
- Can be used with list comprehension
```
let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ] // Gets all triangles with all sides being less than 10
let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2] // Gets all right triangles with all sides being less than 10
let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24] // Gets all right triangles with all sides being less than 10 and a perimeter of less than 24
```
### Helper functions
- `fst`: gets first element of a tuple
- `snd`: gets second element of a tuple
- `zip`: takes two lists, of potentially different types, and returns a list of tuples (always of the length of the smaller list)


