module APL.Eval_Tests (tests) where

import Test.Tasty (TestTree, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))
import APL.AST (Exp(..))
import APL.Eval (Val(..), eval)

tests :: TestTree
tests =
 testGroup "Evaluation"
    [ testCase "CstInt evaluates" $
        eval (CstInt 42) @?=Right (ValInt 42)

        , testCase "Addition works" $
        eval (Add (CstInt 5) (CstInt 7)) @?= Right (ValInt 12)

        , testCase "Subtraction works" $
        eval (Sub (CstInt 10) (CstInt 3)) @?= Right (ValInt 7)

        , testCase "Division by zero fails" $
        eval (Div (CstInt 5) (CstInt 0)) @?= Left "Division by zero"

        , testCase "Negative exponent fails" $
        eval (Pow (CstInt 2) (CstInt (-3))) @?= Left "Negative exponent"
    ]
