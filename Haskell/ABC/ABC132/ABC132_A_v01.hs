-- [contest]  ABC 132
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc132/tasks/abc132_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

-- [reference]
-- http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html
-- https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a
-- https://myuon.github.io/posts/haskell-atcoder/

-- modules to import --

import qualified Data.ByteString.Char8
import           Prelude

-- functions for this task --


-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        given_string <- Data.ByteString.Char8.getLine

        -- STEP.02
        -- output the answer of this task
        Prelude.print $ given_string
        Prelude.print $ Data.ByteString.Char8.take 1 given_string
        Prelude.print $ Data.ByteString.Char8.take 2 given_string

-- End of this source code --
