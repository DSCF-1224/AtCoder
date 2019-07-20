-- [contest]  ABC 002
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc002/tasks/abc002_1
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc002/submissions/6445476 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

tuplify2 (x:y:_) = (x,y)
tuplify2 _       = Prelude.undefined

read_Integer      = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_TupleInteger = tuplify2 . Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer      = read_Integer      <$> Data.ByteString.Char8.getLine
get_TupleInteger = read_TupleInteger <$> Data.ByteString.Char8.getLine

task_A :: (Integer, Integer) -> Integer
task_A (x, y)
        | x > y             = x
        | Prelude.otherwise = y

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        given_data <- get_TupleInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_A $ given_data

-- EOF --
