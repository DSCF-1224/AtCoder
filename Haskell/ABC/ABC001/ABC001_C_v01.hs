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

wind_Direction :: Integer -> Integer -> Data.ByteString.Char8.ByteString
wind_Direction degree wind_force
        | wind_force == 0  = Data.ByteString.Char8.pack $ "C"
        |Prelude.otherwise = wind_Direction_core $ degree
        where
                wind_Direction_core :: Integer -> Data.ByteString.Char8.ByteString
                wind_Direction_core degree
                        | degree_scaled >=  11.25 && degree_scaled <=  33.74 = Data.ByteString.Char8.pack $ "NNE"
                        | degree_scaled >=  33.75 && degree_scaled <=  56.24 = Data.ByteString.Char8.pack $ "NE"
                        | degree_scaled >=  56.25 && degree_scaled <=  78.74 = Data.ByteString.Char8.pack $ "ENE"
                        | degree_scaled >=  78.75 && degree_scaled <= 101.24 = Data.ByteString.Char8.pack $ "E"
                        | degree_scaled >= 101.25 && degree_scaled <= 123.74 = Data.ByteString.Char8.pack $ "ESE"
                        | degree_scaled >= 123.75 && degree_scaled <= 146.24 = Data.ByteString.Char8.pack $ "SE"
                        | degree_scaled >= 146.25 && degree_scaled <= 168.74 = Data.ByteString.Char8.pack $ "SSE"
                        | degree_scaled >= 168.75 && degree_scaled <= 191.24 = Data.ByteString.Char8.pack $ "S"
                        | degree_scaled >= 191.25 && degree_scaled <= 213.74 = Data.ByteString.Char8.pack $ "SSW"
                        | degree_scaled >= 213.75 && degree_scaled <= 236.24 = Data.ByteString.Char8.pack $ "SW"
                        | degree_scaled >= 236.25 && degree_scaled <= 258.74 = Data.ByteString.Char8.pack $ "WSW"
                        | degree_scaled >= 258.75 && degree_scaled <= 281.24 = Data.ByteString.Char8.pack $ "W"
                        | degree_scaled >= 281.25 && degree_scaled <= 303.74 = Data.ByteString.Char8.pack $ "WNW"
                        | degree_scaled >= 303.75 && degree_scaled <= 326.24 = Data.ByteString.Char8.pack $ "NW"
                        | degree_scaled >= 326.25 && degree_scaled <= 348.74 = Data.ByteString.Char8.pack $ "NNW"
                        | Prelude.otherwise                                  = Data.ByteString.Char8.pack $ "N"
                        where
                                degree_scaled = (realToFrac $ degree) / (10.0 :: Double)

wind_force :: Integer -> Integer
wind_force wind_run
        | speed <=   2 =  0
        | speed <=  15 =  1
        | speed <=  33 =  2
        | speed <=  54 =  3
        | speed <=  79 =  4
        | speed <= 107 =  5
        | speed <= 138 =  6
        | speed <= 171 =  7
        | speed <= 207 =  8
        | speed <= 244 =  9
        | speed <= 284 = 10
        | speed <= 326 = 11
        where
                speed = Prelude.truncate $ (realToFrac $ wind_run) / (6.0 :: Double) + (0.5 :: Double)

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
