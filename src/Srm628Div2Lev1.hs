
howManyMoves r1 c1 r2 c2
    | diff_x == 0 && diff_y == 0 = 0
    | diff_x == diff_y = 1
    | mod (diff_x - diff_y) 2 == 0 = 2
    | otherwise = -1
    where
        diff_x = abs (r1 - r2)
        diff_y = abs (c1 - c2)
   

-- | The main entry point.
main :: IO ()
main = do
    print $ howManyMoves 4 6 7 3 -- 1
    print $ howManyMoves 2 5 2 5 -- 0
    print $ howManyMoves 1 3 5 5 -- 2
    print $ howManyMoves 4 6 7 4  -- -1
