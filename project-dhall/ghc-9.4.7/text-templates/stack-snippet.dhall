\(stackage-resolver : Optional Text) ->
  let resolver =
        merge
          { None = ""
          , Some =
              \(r : Text) ->
                ''

                resolver: ${r}''
          }
          stackage-resolver

  in  ''
      user-message: "WARNING: This stack project is generated."

      # NOTE: We need allow-newer: true because of cabal-testsuite has a
      # custom-setup depending on 3.10.* of Cabal and Cabal-syntax while the
      # rest of the package depends on 3.13.*.
      #
      # In the dependencies for hackage-security-0.6.2.3(+cabal-syntax):
      #   * Cabal-syntax must match >=3.7 && <3.12, but Cabal-syntax-3.13.0.0 is in the Stack configuration
      #     (latest matching version is 3.10.3.0).
      # The above is/are needed due to cabal-install-3.13.0.0 -> hackage-security-0.6.2.3
      allow-newer: true

      flags:
        rere:
          rere-cfg: false

      ghc-options:
        "$locals": -fhide-source-paths
      ${resolver}
      ''
