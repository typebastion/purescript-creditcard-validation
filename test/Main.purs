module Test.Main where
  
import Effect

import Payment.CreditCard.Validation as PCV
import Prelude (Unit, discard)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

import Data.Array (reverse)



main :: Effect Unit
main = run [consoleReporter] do
  describe "Payment.CreditCard.Validation" do
    describe "isValidInput" do
      it "Should validate valid credit card number 4916864428336303" do
        (PCV.isValidInput "4916864428336303") `shouldEqual` true

      it "Should validate valid credit card number 4485186432004102" do
        (PCV.isValidInput "4485186432004102") `shouldEqual` true

      it "Should validate valid credit card number 5498671212144998" do
        (PCV.isValidInput "5498671212144998") `shouldEqual` true

      it "Should validate valid credit card number 4556737586899855" do
        (PCV.isValidInput "4556737586899855") `shouldEqual` true
        
      it "Should validate invalid credit card numbers as invalid" do
        (PCV.isValidInput "4716292509375979") `shouldEqual` false

      it "Should reject non digit inputs" do
        (PCV.isValidInput "471629vv09375979") `shouldEqual` false

      it "Should reject 0 input" do
        (PCV.isValidInput "0") `shouldEqual` false  

    describe "doubleEachSecond" do
      it "should double each second number in an array" do
        (PCV.doubleEachSecond [1,1,1,1,1]) `shouldEqual` [2,1,2,1,2]
        (PCV.doubleEachSecond [1,1,1,1,1,1]) `shouldEqual` [2,1,2,1,2,1]

    describe "luhnCorrection" do
      it "should correct numbers higher than 9" do
        (PCV.luhnCorrection [1,12,5,14,1,9,0]) `shouldEqual` [1,3,5,5,1,9,0]

    describe "luhnCheck" do
      it "should yield correct result for [4,5,1,3,2,9,2,1,0,9,3,5,5,9,7,7] 2" do  
        (PCV.luhnCheck [4,5,1,3,2,9,2,1,0,9,3,5,5,9,7,7] 2) `shouldEqual` true

      it "should yield correct result for reverse [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5]) 5" do  
        (PCV.luhnCheck (reverse [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5]) 5) `shouldEqual` true

      it "should yield correct result for reverse [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0]) 3" do  
        (PCV.luhnCheck (reverse [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0]) 3) `shouldEqual` true

    describe "isValidArray" do
      

      it "should be valid for [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5,5]" do
        (PCV.isValidArray [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5,5]) `shouldEqual` true

      it "should be valid for [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0,3]" do
        (PCV.isValidArray [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0,3]) `shouldEqual` true

    describe "convertToNumbers" do
      it "should parse digits correctly" do
        (PCV.convertToNumbers "4716292509375978" `shouldEqual` [4,7,1,6,2,9,2,5,0,9,3,7,5,9,7,8])


validCreditCardNumbers :: Array String
validCreditCardNumbers = 
  [ "4716292509375978"
  , "4556737586899855"
  , "3531168289082072776"
  , "5165931105525576"
  , "6011614571497239441"
  , "374419708153838"
  , "5402037708659565"
  , "6759852307247696"
  , "4913039979863954"
  , "36398213939610"
  , "5559962008860640"
  ]



invalidCreditCardNumbers :: Array String
invalidCreditCardNumbers =
  [ "4716292509375979"
  , "471629vv09375979"
  ]
