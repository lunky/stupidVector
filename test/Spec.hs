import Lib
import Test.Hspec

main :: IO ()
main = hspec $ do 
    describe "Lib" $ do
        it "should run a noop test" $
            1 `shouldBe` 1
