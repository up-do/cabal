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
      # rest of the package depends on 3.11.*.
      #
      # In the dependencies for cabal-testsuite-3:
      #   * Cabal must match ((>=3.10 && <3.11) && >=3.11.0.0 && <3.12) && >=3.10 && <3.11, but Cabal-3.11.0.0 is in the Stack configuration
      #     (no matching package and version found. Perhaps there is an error in the specification of a package's dependencies or build-tools
      #     (Hpack) or build-depends, build-tools or build-tool-depends (Cabal file) or an omission from the packages list in
      #     /.../stack.yaml (project-level configuration).)
      #   * Cabal-syntax must match ((>=3.10 && <3.11) && >=3.11.0.0 && <3.12) && >=3.10 && <3.11, but Cabal-syntax-3.11.0.0 is in the Stack
      #     configuration (no matching package and version found. Perhaps there is an error in the specification of a package's dependencies
      #     or build-tools (Hpack) or build-depends, build-tools or build-tool-depends (Cabal file) or an omission from the packages list in
      #     /.../stack.yaml (project-level configuration).)
      # needed since cabal-testsuite is a build target.
      allow-newer: true

      flags:
        rere:
          rere-cfg: false

      ghc-options:
        "$locals": -fhide-source-paths
      ${resolver}
      ''
