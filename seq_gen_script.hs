import Data.List (intercalate)
import GHC.Float (powerDouble)
import System.Process (readProcess, callCommand)

whichDifferent :: String -> String -> [Bool]
whichDifferent = zipWith (==)

hammingDistance a b = foldl (\acc (x,y) -> if x /=y then acc + 1 else acc) 0 $ zip a b

closeToZero = take 100 $ map (\x -> 1 / powerDouble 10 x) [1.0 ..]

closeToDoubleLimit = [maxBound - 99 .. maxBound] :: [Int]

turnToDouble x = read (filter (/= '\n') x) :: Double

getRuntime dir val = do
  let str_val = show val
  let str = intercalate "," $ replicate 5 str_val
  let runs = replicate 1000 $ readProcess "./sgt.bash" [str,dir,str_val] [] >>= \x -> return $ turnToDouble x
  x <- sequence runs
  let avg = sum x / 1000
  return $ str_val ++ "," ++ show avg ++ "\n"

main = do
  let header = "val,time\n"
  writeFile "control_group.csv" header
  writeFile "close_to_zero.csv" header
  writeFile "close_to_double_limit.csv" header
  ctz <- mapM (getRuntime "ctz") closeToZero
  ctd <- mapM (getRuntime "ctd") closeToDoubleLimit
  gc <- mapM (getRuntime "cg") $ replicate 100 0.5
  let ctz_str = concat ctz
  let ctd_str = concat ctd
  let gc_str = concat gc
  appendFile "close_to_zero.csv" ctz_str
  appendFile "close_to_double_limit.csv" ctd_str
  appendFile "control_group.csv" gc_str
  callCommand "rm temp.txt"
