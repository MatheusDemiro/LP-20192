import Data.List

fib :: Integer -> Integer -> [Integer]
fib n x = n:fib x (n+x)

fibonacciList :: Int -> [Integer]
fibonacciList n 
    | n < 0 = error "Não é permitido número negativo"
    | n > 0 = take n (fib 0 1)

fibonacci :: Int -> Integer
fibonacci n
    | n < 0 = error "Não é permitido número negativo"
    | n > 0 = fibonacciList n !! (n-1)

factorial :: Integer -> Integer
factorial n
  | n < 0 = -1
  | n > 0 = n * factorial (n-1)
  | n == 0 = 1

add :: [a] -> ([a],[a]) -> [a]
add n a = fst a ++ n ++ snd a

remove :: ([a],[a]) -> [a]
remove a = fst a ++ snd a

evenListNumbers :: [Integer] -> [Integer]
isEven n = n `mod` 2 == 0
evenListNumbers xs = quicksort(filter isEven xs)

oddListNumbers :: [Integer] -> [Integer]
isOdd n = n `mod` 2 == 1
oddListNumbers xs = quicksort(filter isOdd xs)

insertAt :: Integer -> Int -> [Integer] -> [Integer] 
insertAt x n xs = add [x] (splitAt (n-1) xs)

removeIndex :: Int -> [a] -> [a]
removeIndex n xs = remove a
    where a = (take (n-1) xs, drop n xs)

quicksort :: [Integer] -> [Integer]
quicksort [] = []
quicksort (e:xs) = quicksort lesser ++ [e] ++ quicksort greater
    where
        lesser  = filter (< e) xs
        greater = filter (>= e) xs

separateOddEven :: [Integer] -> ([Integer],[Integer])
separateOddEven xs = (oddListNumbers xs, evenListNumbers xs)

ordenateOddEven :: [Integer] -> [Integer]
ordenateOddEven xs = oddListNumbers xs ++ evenListNumbers xs

main = do
    print(fibonacci 4)
    print(factorial 4)
    print(fibonacciList 4)
    print(removeIndex 1 [5,4,3,2,1])
    print (insertAt 0 3 [5,4,3,2,1])    
    print(separateOddEven [8,7,6,5,1,2,3,4])
    print(ordenateOddEven [8,7,6,5,1,2,3,4])