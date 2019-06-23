-- [contest]  ABC 101
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc101/tasks/abc101_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc101/submissions/6099349 : WA
--            https://atcoder.jp/contests/abc101/submissions/6099364 : AC

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --

import Data.ByteString.Char8
import Prelude

-- functions for this task --

convert_sign :: ByteString -> Int
convert_sign string_given
        | Data.ByteString.Char8.head string_given == '+' =  1
        | Data.ByteString.Char8.head string_given == '-' = -1

task_A :: ByteString -> Int
task_A string_given
        | Data.ByteString.Char8.length string_given > 0 = (convert_sign $ string_given) + (task_A $ Data.ByteString.Char8.tail $ string_given)
        | otherwise                                     = 0

-- main process is below --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given string
        string_given <- Data.ByteString.Char8.getLine

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ task_A $ string_given

-- End of this source code --
