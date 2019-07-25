-- [contest]  ABC 002
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_1
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc002/submissions/6482765 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger'    = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
readListInteger = Prelude.map readInteger' . Data.ByteString.Char8.words

getInteger     = readInteger'    <$> Data.ByteString.Char8.getLine
getListInteger = readListInteger <$> Data.ByteString.Char8.getLine

task_A :: [Integer] -> Integer
task_A list = Prelude.maximum $ list

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        given_data <- getListInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_A $ given_data

-- EOF --
