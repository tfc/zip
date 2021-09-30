{-# LANGUAGE OverloadedStrings   #-}

import           Control.Concurrent.Async
import qualified Codec.Archive.Zip             as Z

unz :: FilePath -> FilePath -> IO ()
unz a b = putStrLn ("unziping " ++ a ++ " to " ++ b) >> Z.withArchive a (Z.unpackInto b)

ns :: [Int]
ns = [0..3]

main :: IO ()
main = do
    mapM (async . unz "archive.zip" . ("lel/" ++) . show) ns >>= mapM_ wait
