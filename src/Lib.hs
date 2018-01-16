module Lib
    ( someFunc
    ) where


import Data.Maybe 
import Control.Applicative
import qualified Data.Vector as V
import qualified Data.Vector.Generic as G
import Control.Monad
import Control.Monad.ST
import qualified Data.Vector.Mutable as MV

someFunc :: IO ()
someFunc = do
        let inputData = ['a'..'p']
        let initialImmutableVector = V.fromList inputData

        print $ runST $ do
            mutableState <- V.thaw initialImmutableVector
            
            -- uncomment below to throw error
            -- y <- (G.findIndex (=='c') mutableState)
            
            MV.swap mutableState 0 6 
            frozen <- V.freeze mutableState
            return frozen
        

