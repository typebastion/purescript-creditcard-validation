module Test.Main where
  
import Prelude (Unit, discard)

import Effect

import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter.Console (consoleReporter)
import Test.Spec.Runner (run)

import Payment.CreditCard.Validation as PCV



main :: Effect Unit
main = run [consoleReporter] do
  describe "Payment.CreditCard.Validation (isValid)" do
    describe "isValidInput" do
        it "Should validate valid credit card numbers as valid" do
          (PCV.isValidInput "4716292509375978") `shouldEqual` true
        
        it "Should validate invalid credit card numbers as invalid" do
          (PCV.isValidInput "4716292509375979") `shouldEqual` false

        it "Should reject non digit inputs" do
          (PCV.isValidInput "471629vv09375979") `shouldEqual` false

        it "Should reject 0 input" do
          (PCV.isValidInput "0") `shouldEqual` false  



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
