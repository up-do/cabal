-- Recommendations from stack:
--  * directory must match >=1.2 && <1.4, but this GHC boot package has been pruned from the Stack configuration. You need to add the
--    package explicitly to extra-deps. (latest matching version is 1.3.8.1).
--  * process must match >=1.2.1.0 && <1.7, but this GHC boot package has been pruned from the Stack configuration. You need to add the
--    package explicitly to extra-deps. (latest matching version is 1.6.17.0).
--  * directory must match >=1.2 && <1.4, but this GHC boot package has been pruned from the Stack configuration. You need to add the
--    package explicitly to extra-deps. (latest matching version is 1.3.8.1).
--  * process must match >=1.2.1.0 && <1.7, but this GHC boot package has been pruned from the Stack configuration. You need to add the
--    package explicitly to extra-deps. (latest matching version is 1.6.17.0).
-- This matches the result of cabal freeze, except for the version of process, that is 1.6.18.0 when frozen.
-- The unix-2.8.2.1 is recommended by stack but not by cabal freeze that prefers unix-2.8.3.0.
[ { dep = "directory", ver = "1.3.8.1" }
, { dep = "filepath", ver = "1.4.100.4" }
, { dep = "process", ver = "1.6.17.0" }
, { dep = "rere", ver = "0.2" }
, { dep = "semaphore-compat", ver = "1.0.0@rev:1" }
, { dep = "unix", ver = "2.8.2.1" }
]