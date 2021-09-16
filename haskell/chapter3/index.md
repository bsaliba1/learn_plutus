# Chapter 3 - Function Syntax
[⬅︎ Back to Homepage](../../index.md)

## Pattern Matching
- When defining functions, you can define separate function bodies for different patterns.
- Ordering **matters**
- For example if line 7 of the following code was moved to the top then this function would always return "Not between 1 and 5"
```haskell
sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"
```

- When making patterns, we should always include a catch-all pattern so that our program doesn't crash if we get some unexpected input.
```haskell
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"
charName x = error "No corresponsing name found for the given char"
```

- Tuple pattern matching
```haskell
addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)
```

- List pattern matching
```haskell
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y
```

- Patterns
	- Used to alias an entire pattern
	- ex. `all@(x:xs)` this will have `all` be the entire list

## Guards
- Guards are a way of testing whether some property of a value (or several of them) are true or false
- Very similar to `if else` blocks
```haskell
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You're underweight, you emo, you!"
    | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
    | otherwise   = "You're a whale, congratulations!"
```
```haskell
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b     = GT
    | a == b    = EQ
    | otherwise = LT
```

## "Where" Bindings
- Used after function definition (and after guards if they exist) to define several names or functions, that are visible within the function and guards
- `where` bindings are syntactic constructs
```haskell
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell weight height
    | bmi <= skinny = "You're underweight, you emo, you!"
    | bmi <= normal = "You're supposedly normal. Pffft, I bet you're ugly!"
    | bmi <= fat    = "You're fat! Lose some weight, fatty!"
    | otherwise     = "You're a whale, congratulations!"
    where bmi = weight / height ^ 2
          skinny = 18.5
          normal = 25.0
          fat = 30.0
```

- You can also use `where` bindings to pattern match
```haskell
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."
    where (f:_) = firstname
          (l:_) = lastname
```
```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi w h | (w, h) <- xs]
    where bmi weight height = weight / height ^ 2
```

## "Let" Bindings
- Let you bind to variables anywhere and are expressions themselves, but are very local, so they don't span across guards
```haskell
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^2
    in  sideArea + 2 * topArea
```

- `let` bindings are expressions (this can be used almost anywhere)
```haskell
ghci> 4 * (let a = 9 in a + 1) + 2
42
```
```haskell
ghci> [let square x = x * x in (square 5, square 3, square 2)]
[(25,9,4)]
ghci> (let square x = x*x in (square 3, square 4, square 5), let foo = "Hey"; bar = " There!" in foo ++ bar)
((9,16,25),"Hey There!")
```

- Can be used for pattern matching
```haskell
(let (a,b,c) = (1,2,3) in a+b+c) * 100
600
```

- `let`s can be used in place of predicates in a list comprehension
```haskell
calcBmis :: (RealFloat a) => [(a, a)] -> [a]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi >= 25.0]
```

## Case Expressions
- Takes a variable, pattern matching it, evaluating pieces of code based on its value
- These code snippets evaluate to the same thing
```haskell
head' :: [a] -> a
head' [] = error "No head for empty lists!"
head' (x:_) = x
```
```haskell
head' :: [a] -> a
head' xs = case xs of [] -> error "No head for empty lists!"
                      (x:_) -> x
```
- Syntax:
```haskell
case expression of pattern -> result
                   pattern -> result
                   pattern -> result
                   ...
```

