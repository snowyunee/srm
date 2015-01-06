-- | Main entry point to the application.
-- CandyMaking

module Srm629Div2Lev2 where
 
diff d acc (vi,wi,di)  = acc + abs (wi - (d * vi))

diff_sum l = [foldl (diff d) 0 l| (_,_,d) <- l]

findsuitableDensity containerVolumns desiredWeight
    = minimum $
      diff_sum $
      [(v,w,w/v) | (v,w) <- zip containerVolumns desiredWeight]

   
-- | The main entry point.
main :: IO ()
main = do
    print $ findsuitableDensity [5] [1000] -- 0.0
    print $ findsuitableDensity [10, 10] [1000, 2000] -- 1000
    print $ findsuitableDensity [10, 20, 40] [4000, 2000, 1000] -- 5250.0
    print $ findsuitableDensity [1234, 1541, 3321, 1234, 123, 123, 3414, 123, 12, 2442, 1421, 1223, 3232, 1123, 2121] [3213, 1231, 232143, 44312, 132132, 142424, 123123, 41341, 41244, 21312, 232131, 2312, 2322, 11, 2223] -- 983673.2727272725
    print $ findsuitableDensity [30621, 30620, 2] [1, 1, 1000000]  -- 999999.9999673415
    
