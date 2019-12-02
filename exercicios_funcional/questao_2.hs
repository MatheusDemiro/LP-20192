str_list :: String -> [String]
str_list []  = []
str_list xxs@(x:xs)  | x == ' ' = str_list xs
                    | otherwise = ys : str_list rest
                      where (ys, rest) = break (== ' ') xxs

reverse_list :: [a] -> [a]  
reverse_list [] = []  
reverse_list (x:xs) = reverse_list xs ++ [x]

list_aux :: [String] -> String
list_aux [] = ""
list_aux (x:xs) | xs == [] = x
                    | otherwise = x ++ " " ++ list_aux xs

textInvert :: String -> String
textInvert s = list_aux . reverse_list . str_list $ s

main = do
  print(textInvert "la vou eu")