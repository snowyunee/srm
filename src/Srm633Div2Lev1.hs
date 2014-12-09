Enter file contents here-- | Main entry point to the application.
module Main where
 
-- target_t => [String]
-- row_t => String
-- target_t + target_t => ++
-- map => map
 
-- row_t(n c)  => replicate n c
-- row_t("# ") => "# "
 
next n = n - 4
 
target n
    | n == 1 = [['#']]
    | otherwise = [replicate n '#'] ++
                  ["# " ++ replicate (next n) ' ' ++ " #"] ++
                  map (\xs -> "# " ++ xs ++ " #") (target (next n)) ++
                  ["# " ++ replicate (next n) ' ' ++ " #"] ++
                  [replicate n '#']
 
print_target [x] = do
    print x
print_target (x:xs) = do
    print x
    print_target xs
   
-- | The main entry point.
main :: IO ()
main = do
    print_target $ target 1
    print_target $ target 5
    print_target $ target 9
