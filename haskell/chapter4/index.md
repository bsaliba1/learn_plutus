# Chapter 4
[<- Back to Homepage](../../index.md)

## Recursion
- Calling a function within a function
- All recursive functions have a function definition which does not recurse (known as the **edge condition** or **base case**)
- ex. using recursion to determine the largest element in a list
```haskell
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list"
maximum' [x] = x
maximum' (x:xs)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs
```
