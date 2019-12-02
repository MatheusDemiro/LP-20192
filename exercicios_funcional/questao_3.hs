listStr :: String -> [String]
listStr []  = []
listStr xxs@(x:xs)  | x == '\n' = listStr xs
                    | otherwise = ys : listStr rest
                      where (ys, rest) = break (== '\n') xxs

reverseListStr :: [a] -> [a]  
reverseListStr [] = []  
reverseListStr (x:xs) = reverseListStr xs ++ [x]

reversePoem :: String -> [String]
reversePoem x = reverseListStr . listStr $ x

main = do
  mapM_ putStrLn(reversePoem "Nao te amo mais.\nEstarei mentindo dizendo que\nAinda te quero como sempre quis.\nTenho certeza que\nNada foi em vao.\nSinto dentro de mim que\nVoce nao significa nada.\nNao poderia dizer jamais que\nAlimento um grande amor.\nSinto cada vez mais que\nJa te esqueci!\nE jamais usarei a frase:\nEU TE AMO!\nSinto, mas tenho que dizer a verdade\nE tarde demais...")
