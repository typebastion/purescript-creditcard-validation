module Payment.CreditCard.Validation 
  (isValidInput, isValidArray)
  where
  
import Prelude

import Data.String.Common (split)
import Data.String.Pattern (Pattern(..))
import Data.Int (fromString, even, toNumber)
import Data.Maybe (isJust, fromMaybe)
import Data.Array (dropEnd, last, length, filter, reverse, toUnfoldable)
import Data.Foldable (sum)
import Math ((%))
import Data.FunctorWithIndex (mapWithIndex)



isValidInput :: String -> Boolean
isValidInput creditCardNumber = isValidArray (convertToNumbers creditCardNumber)



isValidArray :: Array Int -> Boolean
isValidArray [] = false
isValidArray [x] = false
isValidArray numbers =
  let
    reversed = reverse (dropEnd 1 numbers)
    verificationNumber = fromMaybe 0 (last numbers)
  in
    luhnCheck reversed verificationNumber



doubleEachSecond :: Array Int -> Array Int
doubleEachSecond = mapWithIndex (\idx item -> if (even idx) then item * 2 else item)



luhnCorrection :: Array Int -> Array Int
luhnCorrection = map (\number -> if (number < 10) then number else (number - 9) )



luhnNumbers :: Array Int -> Array Int
luhnNumbers input = luhnCorrection (doubleEachSecond input)



luhnCheck :: Array Int -> Int -> Boolean
luhnCheck input verificationNumber =
  (luhnSum input) % (toNumber 10) == (toNumber (10 - verificationNumber))
  where
    luhnSum :: Array Int -> Number
    luhnSum numbersArr = toNumber (sum (luhnNumbers numbersArr))



convertToNumbers :: String -> Array Int
convertToNumbers creditCardNumber =
   let 
     numbers = map (fromString) (split (Pattern "") creditCardNumber)
     unparsed = filter (not isJust) numbers
   in
     if (length unparsed) == 0 then
       toUnfoldable (map (fromMaybe 0) numbers)
     else
       toUnfoldable []
