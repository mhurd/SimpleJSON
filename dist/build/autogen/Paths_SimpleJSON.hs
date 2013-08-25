module Paths_SimpleJSON (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,0,1], versionTags = []}
bindir, libdir, datadir, libexecdir :: FilePath

bindir     = "/Users/mhurd/Library/Haskell/ghc-7.6.3/lib/SimpleJSON-0.0.1/bin"
libdir     = "/Users/mhurd/Library/Haskell/ghc-7.6.3/lib/SimpleJSON-0.0.1/lib"
datadir    = "/Users/mhurd/Library/Haskell/ghc-7.6.3/lib/SimpleJSON-0.0.1/share"
libexecdir = "/Users/mhurd/Library/Haskell/ghc-7.6.3/lib/SimpleJSON-0.0.1/libexec"

getBinDir, getLibDir, getDataDir, getLibexecDir :: IO FilePath
getBinDir = catchIO (getEnv "SimpleJSON_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "SimpleJSON_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "SimpleJSON_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "SimpleJSON_libexecdir") (\_ -> return libexecdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
