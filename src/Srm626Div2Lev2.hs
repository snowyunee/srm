
getExceptions :: Integral a => a -> a -> Double
getExceptions a b  =
    (\ls -> (fromIntegral (sum ls)) / (fromIntegral (length ls))) $
    [x| x <- [1,2..a], y <- [1,2..b], x > y]
   

-- | The main entry point.
main :: IO ()
main = do
    print $ getExceptions 2 2 -- 2.0
    print $ getExceptions 4 2 -- 3.2
    print $ getExceptions 3 3 -- 2.66666..
    print $ getExceptions 11 13 -- 7.99999..
