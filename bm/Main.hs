import Codec.Archive.Zip

main :: IO ()
main = withArchive "archive.zip" $ unpackInto "output_dir"
