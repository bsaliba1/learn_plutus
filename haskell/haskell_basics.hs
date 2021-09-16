-- Chapter 1
doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleSmallNumber x = if x > 100 then x else x*2
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]
length' xs = sum [1 | x <- xs]
removeOddNumbers xxs = [ [x | x <- xs, even x] | xs <- xxs]
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

-- Chapter 2
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + (sum' xs)

-- Chapter 4
replicate' :: (Num i, Ord i) => a -> i -> [a]
replicate' x y
  | y <= 0 = []
  | otherwise = x:replicate' x (y-1)

take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n lst
  | n <= 0 = []
  | otherwise = x:take' (n-1) xs
  where (x:xs) = lst

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

zip' :: [a] -> [b] -> [(a,b)]
zip' [] _ = []
zip' _ [] = []
zip' lst_x lst_y = (x, y):zip' xs ys
  where (x:xs) = lst_x
        (y:ys) = lst_y

elem' :: (Eq a) => a -> [a] -> Bool
elem' n [] = False
elem' n lst
  | n == x = True
  | otherwise = elem' n xs
  where (x:xs) = lst

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerSorted = quicksort [a | a <- xs, a <= x]
      biggerSorted = quicksort [a | a <- xs, a > x]
  in smallerSorted ++ [x] ++ biggerSorted

-- Chapter 5
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f lst1 lst2 = (f x y):(zipWith' f xs ys)
  where (x:xs) = lst1
        (y:ys) = lst2

flip' :: (a -> b -> c) -> (b -> a -> c)
flip' f = g
  where g x y = f y x

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = f x: map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' p (x:xs)
  | p x = x : filter' p xs
  | otherwise = filter' p xs

collatz :: (Integral a) => a -> [a]
collatz x
  | x == 1 = [1]
  | odd x = x: collatz (x * 3 + 1)
  | otherwise = x: collatz (x `div` 2)

numLongChains :: Int
numLongChains = length (filter isLong collatzedLists)
  where isLong ls = length ls > 15
        collatzedLists = map collatz [1..100]

sum'' :: (Num a) => [a] -> a
sum'' xs = foldl (+) 0 xs

elem'' :: (Eq a) => a -> [a] -> Bool
elem'' n xs = foldl (\acc x -> acc || x == n) False xs

sum''' :: (Num a) => [a] -> a
sum''' = foldl (+) 0

-- Sample Problems
-- Problem 1
-- Get the last element in a list
myLast [x] = x
myLast (x:xs) = myLast xs
myLast' lst = head (reverse lst)

-- Problem 2
-- Get the second to last element in a list
mySecondLast [x,y] = x
mySecondLast (x:xs) = mySecondLast xs
mySecondLast' lst = head (reverse (init lst))

-- Problem 3
-- Get the Kth element of a list
elementAt :: (Num b, Ord b) => [a] -> b -> a
elementAt lst index
  | index == 1 = x
  | index > 1 = elementAt xs (index-1)
  | otherwise = error "'elementAt' cannot take a negative index"
  where (x:xs) = lst

f x = if (mod x 3 == 0) then "Fizz" else ""
b x = if (mod x 5 == 0) then "Buzz" else ""
fb x =  z ++ "\n"
  let y = f x ++ b x
      z = if y == "" then show x else y

main = putStrLn $ foldl (++) "" $ map fb [1..100]
