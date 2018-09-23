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
      --it "should validate valid VISA cards" do
      --  map (\card -> (PCV.isValidInput card) `shouldEqual` true) validVisaCards

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

    describe "isValidArray" do
      it "should be valid for [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5,5]" do
        (PCV.isValidArray [4,5,5,6,7,3,7,5,8,6,8,9,9,8,5,5]) `shouldEqual` true

      it "should be valid for [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0,3]" do
        (PCV.isValidArray [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0,3]) `shouldEqual` true


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



validVisaCard :: Array String
validVisaCard =
  [ "4539324182536314"
  , "4532046628477970"
  , "4532461822386178872"
  ]



validMastercard :: Array String
validMastercard =
  [ "5541644686842758"
  , "5470779949661424"
  , "5480790241259930"
  ]



validVisaElectron :: Array String
validVisaElectron =
  [ "4508840051628590"
  , "4508427997800176"
  , "4844167321853185"
  ]



validDiscover :: Array String
validDiscover =
  [ "6011404418580021"
  , "6011285498148072"
  , "6011046227793953817"
  ]



validMaestro :: Array String
validMaestro =
  [ "6763841669740483"
  , "5038372407600103"
  , "5038020730919001"
  ]



validAmericanExpress :: Array String
validAmericanExpress =
  [ "373793444502560"
  , "370631702533955"
  , "347302864432556"
  ]



validJCB :: Array String
validJCB =
  [ "3539739743079276"
  , "3528826390724008"
  , "3529509932736809851"
  ]



invalidCreditCardNumbers :: Array String
invalidCreditCardNumbers =
  [ "4716292509375979"
  , "471629vv09375979"
  ]
