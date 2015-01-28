
h :: ([[a]], [[a]]) -> a -> ([[a]], [[a]])
h (alss,blss) a = (alss',blss')
    where
        alss' = alss++blss
        blss' = [[a]] ++ [bls++[a]| bls <- blss]

findSum :: Integral a => [a] -> a
findSum ls  =
    last $
    map (sum.(map sum)) $
    map (\(alss,blss) -> alss++blss) $
    scanl h ([],[]) ls
   

-- | The main entry point.
main :: IO ()
main = do
    print $ findSum [1,2] -- 6
    print $ findSum [1,1,1] -- 10
    print $ findSum [3,14,15,92,65] -- 1323
    print $ findSum [1,2,3,4,5,6,7,8,9,10] -- 1210
