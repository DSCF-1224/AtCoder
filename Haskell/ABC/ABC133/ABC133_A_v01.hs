-- [contest]  ABC 133
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc133/tasks/abc133_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc133/submissions/6538151 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger'    = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
readListInteger = Prelude.map readInteger' . Data.ByteString.Char8.words

getInteger     = readInteger'    <$> Data.ByteString.Char8.getLine
getListInteger = readListInteger <$> Data.ByteString.Char8.getLine

task_A :: Integer -> Integer -> Integer -> Integer
task_A numPeople costTrain costTaxi
        | costTrainAll < costTaxi = costTrainAll
        | Prelude.otherwise       = costTaxi
        where
                costTrainAll = costTrain * numPeople

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        [n, a, b] <- getListInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_A (n) (a) (b) 

-- EOF --
