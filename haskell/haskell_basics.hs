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
