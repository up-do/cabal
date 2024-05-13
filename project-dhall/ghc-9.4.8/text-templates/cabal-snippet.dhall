''
import: project-cabal/ghc-options.config
import: project-cabal/ghc-latest.config
import: project-cabal/constraints.config

-- WARNING: The custom setup of cabal-testsuite is upsetting stack. Can it use
-- two versions of Cabal at once? For now, I'm just going to disable this
-- package here but add it in manually for cabal with the dhall2cabal text
-- template.
packages: cabal-testsuite
''
