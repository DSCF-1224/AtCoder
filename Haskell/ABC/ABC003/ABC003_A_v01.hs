-- [contest]  ABC 003
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc003/tasks/abc003_1
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc003/submissions/6607929 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger' = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
getInteger   = readInteger' <$> Data.ByteString.Char8.getLine

task_A :: Integer -> Integer -> Double
task_A num_task_total num_task
        | num_task > 0      = (1.0e+004 :: Double) / (Prelude.fromIntegral $ num_task_total) * (Prelude.fromIntegral $ num_task) + task_A (num_task_total) (num_task - 1)
        | Prelude.otherwise = 0.0e+000

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        num_task_total <- getInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_A (num_task_total) (num_task_total)

-- EOF --
