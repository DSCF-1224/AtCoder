-- [contest]  ABC 134
-- [task]     A
-- [URL]      https://atcoder.jp/contests/abc134/tasks/abc134_a
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   https://atcoder.jp/contests/abc134/submissions/6482825 : AC

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions for this task --

readInteger' = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
getInteger   = readInteger' <$> Data.ByteString.Char8.getLine

task_A :: Integer -> Integer
task_A radius = (3 :: Integer) * radius * radius

-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        radius <- getInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $ task_A $ radius

-- EOF --
