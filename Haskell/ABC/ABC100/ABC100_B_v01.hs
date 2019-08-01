-- [contest]  ABC 100
-- [task]     B
-- [URL]      https://atcoder.jp/contests/abc100/tasks/abc100_b
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc100/submissions/6637576 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger'    = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
readListInteger = Prelude.map readInteger'          . Data.ByteString.Char8.words

getInteger     = readInteger'    <$> Data.ByteString.Char8.getLine
getListInteger = readListInteger <$> Data.ByteString.Char8.getLine

countNumOperations :: Integer -> Integer -> Integer
countNumOperations itr x
        | val_mod == (0 :: Integer) = countNumOperations (itr + (1 :: Integer)) (val_div)
        | Prelude.otherwise         = itr
        where
                (val_div, val_mod) = Prelude.divMod (x) (100 :: Integer)

calculateAnswer :: Integer -> Integer -> Integer -> Integer -> Integer
calculateAnswer data_d data_n counter val_answer
        | counter < data_n  = calculateAnswer (data_d) (data_n) (counter_updated) (val_answer_updated)
        | Prelude.otherwise = val_answer
        where
                val_answer_updated = val_answer + (1 :: Integer)
                numOperations      = countNumOperations (0 :: Integer) (val_answer_updated)
                counter_updated    = if (numOperations == data_d) then (counter + (1 :: Integer)) else counter

task_B :: Integer -> Integer -> Integer
task_B data_d data_n = calculateAnswer (data_d) (data_n) (0 :: Integer) (0 :: Integer)

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        [d, n] <- getListInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_B (d) (n)

-- EOF --
