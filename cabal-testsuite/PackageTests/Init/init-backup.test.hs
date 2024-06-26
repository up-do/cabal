import Test.Cabal.Prelude

main = cabalTest $
  withSourceCopyDir "app" $ do
    cwd <- fmap testSourceCopyDir getTestEnv

    (initOut, buildOut) <- withDirectory cwd $ do
      initOut <- cabalWithStdin "init" ["-i"]
        "2\ny\n5\n\n\n2\n\n\n\n\n\n\n\n\n\n"
      setup "configure" []
      buildOut <- setup' "build" ["app"]
      return (initOut, buildOut)

    assertFileDoesContain (cwd </> "app.cabal")   "3.0"
    assertFileDoesContain (cwd </> "app.cabal")   "BSD-3-Clause"
    assertFileDoesContain (cwd </> "app.cabal")   "Simple"
    shouldDirectoryExist (cwd </> "app.save0")
    assertOutputContains "Backing up old version in app.save0" initOut
    assertOutputContains "Overwriting directory ./app" initOut
    assertOutputContains "Linking" buildOut
