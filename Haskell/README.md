# AtCoder by Haskell (GHC 7.10.3) #

## 目次 ##

* [AtCoder Beginner Contest](#AtCoder-Beginner-Contest)
* [テンプレート](#テンプレート)
* [参考サイト](#参考サイト)

|記号|意味|
|:-:|:-|
|AC|正解|
|WA|不正解|
|&#x2014;|未着手|
|NS|未提出|
|N\A|問題 未設定|

## AtCoder Beginner Contest ##

|Task             |Version|A                                |B                                |C                                |D                                 |E                                      |F                                      |
|:---------------:|:-----:|:-------------------------------:|:-------------------------------:|:-------------------------------:|:--------------------------------:|:-------------------------------------:|:-------------------------------------:|
|[001](ABC/ABC001)|   1   |[AC](ABC/ABC001/ABC001_A_v01.hs) |[AC](ABC/ABC001/ABC001_B_v01.hs) |[AC](ABC/ABC001/ABC001_C_v01.hs) |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |[AC](ABC/ABC001/ABC001_A_v02.hs) |&#x2014;                         |[NS](ABC/ABC001/ABC001_C_v02.hs) |&#x2014;                          |N\A                                    |N\A                                    |
|[002](ABC/ABC002)|   1   |[AC](ABC/ABC002/ABC002_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |[AC](ABC/ABC002/ABC002_A_v02.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   3   |[AC](ABC/ABC002/ABC002_A_v03.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[003](ABC/ABC003)|   1   |[AC](ABC/ABC003/ABC003_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |[AC](ABC/ABC003/ABC003_A_v02.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   3   |[AC](ABC/ABC003/ABC003_A_v03.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[004](ABC/ABC004)|   1   |[AC](ABC/ABC004/ABC004_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[064](ABC/ABC064)|   1   |[AC](ABC/ABC064/ABC064_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[081](ABC/ABC081)|   1   |[AC](ABC/ABC081/ABC081_A_v01.hs) |[AC](ABC/ABC081/ABC081_B_v01.hs) |[NS](ABC/ABC081/ABC081_C_v01.hs) |&#x2014;                          |N\A                                    |N\A                                    |
|[086](ABC/ABC086)|   1   |[AC](ABC/ABC086/ABC086_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |[AC](ABC/ABC086/ABC086_A_v02.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[087](ABC/ABC087)|   1   |[AC](ABC/ABC087/ABC087_A_v01.hs) |[NS](ABC/ABC087/ABC087_B_v01.hs) |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[100](ABC/ABC100)|   1   |[AC](ABC/ABC100/ABC100_A_v01.hs) |[AC](ABC/ABC100/ABC100_B_v01.hs) |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |[AC](ABC/ABC100/ABC100_A_v02.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[101](ABC/ABC101)|   1   |[AC](ABC/ABC101/ABC101_A_v01.hs) |[AC](ABC/ABC101/ABC101_B_v01.hs) |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|                 |   2   |&#x2014;                         |[AC](ABC/ABC101/ABC101_B_v02.hs) |&#x2014;                         |&#x2014;                          |N\A                                    |N\A                                    |
|[126](ABC/ABC126)|   1   |&#x2014;                         |&#x2014;                         |&#x2014;                         |&#x2014;                          |&#x2014;                               |&#x2014;                               |
|[132](ABC/ABC132)|   1   |&#x2014;                         |&#x2014;                         |[NS](ABC/ABC132/ABC132_C_v01.hs) |&#x2014;                          |&#x2014;                               |&#x2014;                               |
|[133](ABC/ABC133)|   1   |[AC](ABC/ABC133/ABC133_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |&#x2014;                               |&#x2014;                               |
|[134](ABC/ABC134)|   1   |[AC](ABC/ABC134/ABC134_A_v01.hs) |&#x2014;                         |&#x2014;                         |&#x2014;                          |&#x2014;                               |&#x2014;                               |

## テンプレート ##

```Haskell
-- modules to import --
import qualified Data.ByteString.Char8
import qualified Data.Maybe
import           Prelude

-- functions to read given data
tuplify2 (x:y:_) = (x,y)
tuplify2 _       = Prelude.undefined

readInteger'     = Prelude.fst . Data.Maybe.fromJust   . Data.ByteString.Char8.readInteger
readListInteger  = Prelude.map readInteger'            . Data.ByteString.Char8.words
readTupleInteger = tuplify2 . Prelude.map readInteger' . Data.ByteString.Char8.words

getInteger      = readInteger'     <$> Data.ByteString.Char8.getLine
getListInteger  = readListInteger  <$> Data.ByteString.Char8.getLine
getTupleInteger = readTupleInteger <$> Data.ByteString.Char8.getLine

-- functions to output the answers
Data.ByteString.Char8.putStrLn (Data.ByteString.Char8.pack $ "hoge")
Prelude.print (1 :: Integer)
```

## 参考サイト ##

* [Haskell.org](https://www.haskell.org/)
  * [Data.ByteString.Char8](http://hackage.haskell.org/package/bytestring-0.10.8.2/docs/Data-ByteString-Char8.html)
  * [Data.Vector.Unboxed](http://hackage.haskell.org/package/vector-0.12.0.3/docs/Data-Vector-Unboxed.html)
  * [Prelude](http://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html)
  * [Text.Printf](http://hackage.haskell.org/package/base-4.12.0.0/docs/Text-Printf.html)
* [Qiita](https://qiita.com/)
  * [HaskellでAtCoderの問題を解く（入力の高速化編）](https://qiita.com/hnw/items/3f7d27b742c5a1a99a9a)
* [The curse of λ](https://myuon.github.io/)
  * [Haskellで解くAtCoder](https://myuon.github.io/posts/haskell-atcoder/)

<!-- EOF -->
