-- [contest]  ABC 001
-- [task]     C
-- [URL]      https://atcoder.jp/contests/abc001/tasks/abc001_3
-- [compiler] Haskell (GHC 7.10.3)
-- [status]   NOT Submitted

-- modules to import --

import qualified Data.ByteString.Char8
import qualified Data.Maybe
import qualified Text.Printf
import           Prelude

-- functions for this task --

tuplify2 (x:y:_) = (x,y)
tuplify2 _       = Prelude.undefined

read_Integer      = Prelude.fst . Data.Maybe.fromJust . Data.ByteString.Char8.readInteger
read_TupleInteger = tuplify2 . Prelude.map read_Integer . Data.ByteString.Char8.words

get_Integer      = read_Integer      <$> Data.ByteString.Char8.getLine
get_TupleInteger = read_TupleInteger <$> Data.ByteString.Char8.getLine

wind_Direction :: Integer -> Data.ByteString.Char8.ByteString
wind_Direction degree
        | degree >=  1125 && degree <=  3374 = Data.ByteString.Char8.pack $ "NNE"
        | degree >=  3375 && degree <=  5624 = Data.ByteString.Char8.pack $ "NE"
        | degree >=  5625 && degree <=  7874 = Data.ByteString.Char8.pack $ "ENE"
        | degree >=  7875 && degree <= 10124 = Data.ByteString.Char8.pack $ "E"
        | degree >= 10125 && degree <= 12374 = Data.ByteString.Char8.pack $ "ESE"
        | degree >= 12375 && degree <= 14624 = Data.ByteString.Char8.pack $ "SE"
        | degree >= 14625 && degree <= 16874 = Data.ByteString.Char8.pack $ "SSE"
        | degree >= 16875 && degree <= 19124 = Data.ByteString.Char8.pack $ "S"
        | degree >= 19125 && degree <= 21374 = Data.ByteString.Char8.pack $ "SSW"
        | degree >= 21375 && degree <= 23624 = Data.ByteString.Char8.pack $ "SW"
        | degree >= 23625 && degree <= 25874 = Data.ByteString.Char8.pack $ "WSW"
        | degree >= 25875 && degree <= 28124 = Data.ByteString.Char8.pack $ "W"
        | degree >= 28125 && degree <= 30374 = Data.ByteString.Char8.pack $ "WNW"
        | degree >= 30375 && degree <= 32624 = Data.ByteString.Char8.pack $ "NW"
        | degree >= 32625 && degree <= 34874 = Data.ByteString.Char8.pack $ "NNW"
        | Prelude.otherwise                  = Data.ByteString.Char8.pack $ "N"


-- the main process is as follows --

main :: IO ()
main = do

        -- STEP.01
        -- read out the given data
        given_data <- get_TupleInteger

        -- STEP.02
        -- calculate & output the answer of this task
        Prelude.print $                  Prelude.fst $ given_data
        Prelude.print $ wind_Direction $ Prelude.fst $ given_data
        Prelude.print $ Prelude.snd $ given_data

-- EOF --
