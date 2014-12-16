
import Data.List
import Data.Tuple

f (p_max, p_count, p_char) c_char = (p_max', p_count', p_char')
  where p_count' = if p_char == c_char then p_count + 1 else 1
        p_max' = max p_count' p_max
        p_char' = c_char

taroGrid xss = maximum $ map (\(m,_,_) -> m) $ map (foldl f (0, 0, ' ')) (transpose xss)

main = do
  print $ taroGrid ["W"]
  print $ taroGrid ["WB", "BW"]
  print $ taroGrid ["BWW", "BBB", "BWB"]
  print $ taroGrid ["BWBW", "BBWB", "WWWB", "BWWW"] 
  print $ taroGrid ["BWB", "BBW", "BWB"]  
  print $ taroGrid ["BBWWBBWW", "BBWWBBWW", "WWBBWWBB", "WWBBWWBB", "BBWWBBWW", "BBWWBBWW", "WWBBWWBB", "WWBBWWBB"] 

