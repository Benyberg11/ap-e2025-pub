module APL.Eval_Tests (tests) where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import APL.AST (Exp(..))
import APL.Eval (Val(..), eval)
tests :: TestTree
tests =
  testGroup
    "Evaluation"
    []
