-- [contest]  ABC 100
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc100/tasks/abc100_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc100/submissions/6636591 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger'    = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
readListInteger = Prelude.map readInteger' . Data.ByteString.Char8.words

getInteger     = readInteger'    <$> Data.ByteString.Char8.getLine
getListInteger = readListInteger <$> Data.ByteString.Char8.getLine

task_A :: Integer -> Integer -> Data.ByteString.Char8.ByteString
task_A num_piece_a num_piece_b = Data.ByteString.Char8.pack $ if (stat_a && stat_b) then "Yay!" else ":("
        where
                stat_a = num_piece_a <= (8 :: Integer)
                stat_b = num_piece_b <= (8 :: Integer)

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        [num_piece_a, num_piece_b] <- getListInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Data.ByteString.Char8.putStrLn $ task_A (num_piece_a) (num_piece_b)

-- EOF --
