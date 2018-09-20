module Payment.CreditCard.Validation where
  
import Prelude (map, (==))

import Data.String.Common
import Data.String.Pattern (Pattern(..))
import Data.Int (fromString)
import Data.Maybe (isJust, fromMaybe)
import Data.Array (length, filter)



isValidInput :: String -> Boolean
isValidInput creditCardNumber =
  let
    numbers = convertToNumbers creditCardNumber
  in 
    if (length numbers == 0) then
      false
    else
      isValidArray numbers



isValidArray :: Array Int -> Bool
isValidArray arr =
  false



convertToNumbers :: String -> Array Int
convertToNumbers creditCardNumber =
   let 
     numbers = map (fromString) (split (Pattern "") creditCardNumber)
     unparsed = filter isJust numbers
   in
     if (length unparsed) == 0 then
       map (fromMaybe 0) numbers
     else
       []