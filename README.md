# purescript-creditcard-validation

[![Build Status](https://travis-ci.org/ersocon/purescript-creditcard-validation.svg?branch=master)](https://travis-ci.org/ersocon/purescript-creditcard-validation)

Purescript utility library to check for validity of credit card numbers

## Installation

```
bower install purescript-creditcard-validation
```

## Usage

Here's a motivating example:

```purescript

import Payment.CreditCard.Validation (isValidInput, isValidArray)


-- isValidInput can be used to validate input from HTML fields
isValidInput "4916864428336303" -- will return true

-- isValidArray does the same but in another input format
isValidArray [4,9,1,6,8,6,4,4,2,8,3,3,6,3,0,3] -- will return true
```
