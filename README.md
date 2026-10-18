# Venticornlib

A small mathematical library for [Venticorn](https://github.com/johnclyde/venticorn), using the language supported at its April 4, 2025 Acorn checkpoint.

The first version contains three modules and all of their library dependencies:

| Module | Contents | Named theorems | Proof obligations |
| --- | --- | ---: | ---: |
| `nat.ac` | Natural arithmetic, order, division, divisibility, factorials, and primes | 122 | 680 |
| `pair.ac` | Generic ordered pairs and swapping twice | 1 | 3 |
| `nat_gcd.ac` | Euclid's algorithm, termination, and GCD properties | 30 | 212 |
| Total | 1,946 source lines | 153 | 895 |

Proof obligations include intermediate claims and definition obligations, so they outnumber named theorems. `nat` and `pair` import no library modules; `nat_gcd` imports only those two. Integers, rationals, reals, and the general algebra hierarchy are outside this initial scope.

## Verify locally

Clone the two repositories beside one another and build the prover:

```sh
git clone https://github.com/johnclyde/venticorn.git
git clone https://github.com/johnclyde/venticornlib.git
cd venticorn
git checkout --detach 05db3d411fda1a983726a62f01d2a2b65c269c1c
cargo build --locked --release --bin verify
cd ../venticornlib
bash scripts/verify.sh
```

The helper sets `VENTICORN_LIBRARY` to this checkout and verifies every module with `--no-cache`. It defaults to the sibling Venticorn release binary. To use another build:

```sh
bash scripts/verify.sh /absolute/path/to/verify
```

To select the library explicitly for the CLI or a VS Code session:

```sh
export VENTICORN_LIBRARY=/absolute/path/to/venticornlib
../venticorn/target/release/verify --no-cache nat_gcd
```

The directory name `venticornlib` is not automatically discovered by the current prover; use the helper or the environment variable. The existing larger editor bundle remains available in Venticorn.

The initial library is checked with Venticorn commit `05db3d411fda1a983726a62f01d2a2b65c269c1c`. That commit is the reproducible prover baseline; later prover revisions must pass the library checks before updating the compatibility record. Default builds use ONNX scoring. For the built-in heuristic scorer, build with `cargo build --locked --release --no-default-features --bin verify` and run the same helper. [Verification evidence](verification/README.md) records the initial runs.

## Provenance and compatibility

The source comes from Acornlib commit [`95cb6651`](https://github.com/acornprover/acornlib/tree/95cb66513ebf373ca0d411011ce11cba4fafd0d3), dated March 17, 2025. This is the library revision pinned by Acorn's April 4 prover checkpoint, rather than a guessed library snapshot based on a calendar date.

`nat.ac` and `pair.ac` retain the upstream bytes. `nat_gcd.ac` retains Venticorn's previously verified adaptation: one explicit intermediate step in the scaled-divisibility proof and a modification comment. No theorem statement, assumption, or existing proof step was removed. Exact hashes, the adaptation, and modern module counterparts are recorded in [provenance.json](provenance.json).

These mathematical foundations remain in current Acornlib, but newer source uses different syntax, imports, and APIs. This repository targets Venticorn's stated baseline; it does not claim that the same source compiles on modern Acorn.

Venticorn records the exact adopted Venticornlib commit and shared module hashes in `venticornlib.lock.json`. Changes to this library and adoption by the prover are reviewed separately. Validation runs locally, with GitHub Actions and GitHub Issues disabled. Use the project's internal tracking and coordination records for work planning.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE) for Acorn attribution and the Venticorn adaptation.
