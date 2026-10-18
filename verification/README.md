# Initial standalone verification

Verified locally on October 18, 2026 with Venticorn commit
`05db3d411fda1a983726a62f01d2a2b65c269c1c`, corresponding to Acorn checkpoint
1070 (`7cb4ccb3ca93974b459ad152afc385a8f8ddf541`, April 4, 2025).

Both release builds verified this repository as the complete library selected
by `VENTICORN_LIBRARY`. The only `.ac` files were `nat.ac`, `pair.ac`, and
`nat_gcd.ac`; no bundled-library imports were needed.

| Scorer | Result | Full searches | Filtered searches |
| --- | ---: | ---: | ---: |
| Default ONNX | 895/895 obligations | 895 | 0 |
| Built-in heuristic (`--no-default-features`) | 895/895 obligations | 895 | 0 |

The commands were `cargo build --locked --release --bin verify` and
`cargo build --locked --release --no-default-features --bin verify`, followed
by `bash scripts/verify.sh /absolute/path/to/the/built/verify` for each binary.
The helper supplies `--no-cache`; neither run reused verified results.
The ONNX run emitted no model-load failure or scorer fallback warning.

Logs are retained in [2026-10-18-onnx.log](2026-10-18-onnx.log) and
[2026-10-18-heuristic.log](2026-10-18-heuristic.log).
[initial.json](initial.json) records source and log hashes and the build
environment. These are library verification results, not a claim that all
prover or editor tests were rerun for this extraction. Single-run timings
are diagnostic only and do not establish a speed improvement.

An independent review checked source hashes against the pinned Acornlib
revision, exact equality with Venticorn's adapted bundled copies, the
three-module import closure, unchanged theorem statements, the single
explicit GCD proof step, licensing, and the verification helper.
