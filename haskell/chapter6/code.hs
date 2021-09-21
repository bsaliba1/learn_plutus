import Data.Char
import qualified Geometry.Basic as Basic
import qualified Geometry.Sphere as Sphere

-- Caesar Cipher
encode :: Int -> String -> String
encode shift msg =
  let asciiValues = map ord msg
      shifted = map (+ shift) asciiValues
  in map chr shifted

decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg
