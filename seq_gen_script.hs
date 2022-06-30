import Data.List (intercalate)
import GHC.Float (powerDouble)
import System.Process (readProcess)

closeToZero = take 100 $ map (\x -> 1 / powerDouble 10 x) [1.0 ..]

closeToDoubleLimit = [maxBound - 99 .. maxBound] :: [Int]

turnToDouble x = read (filter (/= '\n') x) :: Double

getRuntime val = do
  let str_val = show val
  let str = intercalate "," $ replicate 5 str_val
  let runs = replicate 100 $ readProcess "./sgt.bash" (return str) [] >>= \x -> return $ turnToDouble x
  x <- sequence runs
  let avg = sum x / 100
  return $ str_val ++ "," ++ show avg ++ "\n"

main = do
  let header = "val,time\n"
  writeFile "control_group.csv" header
  writeFile "close_to_zero.csv" header
  writeFile "close_to_double_limit.csv" header
  ctz <- mapM getRuntime closeToZero
  ctd <- mapM getRuntime closeToDoubleLimit
  gc <- getRuntime 0.5
  let ctz_str = concat ctz
  let ctd_str = concat ctd
  appendFile "close_to_zero.csv" ctz_str
  appendFile "close_to_double_limit.csv" ctd_str
  appendFile "control_group.csv" gc
