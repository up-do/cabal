''
tests: True

optional-packages: ./vendored/*/*.cabal

-- avoiding extra dependencies
constraints: rere -rere-cfg
constraints: these -assoc

program-options
  ghc-options: -fno-ignore-asserts
''
