# Working on Venticornlib

- Keep the library small and compatible with the prover revision recorded in provenance.json. Do not import current Acornlib's syntax or dependency hierarchy without an explicit compatibility review.
- Preserve theorem statements, hypotheses, and existing proof obligations. Fix an incomplete proof by supplying valid reasoning; do not replace it with an axiom, omit it from verification, or weaken its expected result.
- Preserve upstream attribution and record source revisions and any adaptations in provenance.json.
- Run scripts/verify.sh against the whole standalone library after source changes. Check both the ONNX and built-in heuristic builds when updating the supported prover baseline, and record the exact revisions and results.
- All validation is local. Do not add or enable GitHub Actions workflows.
- Use the established internal tracker and coordination records. Never create, populate, or use GitHub Issues to record work for John Clyde.
- Submit changes through reviewed pull requests and squash merges. Never force push.

## Squash commit messages

Finalize the PR title and description before merging. Pass that exact title as
`commit_title` and that exact description as `commit_message`, with
`merge_method=squash` and the reviewed head SHA. Do not rely on GitHub's editable
merge-message defaults.

After merging, read the resulting Git commit and verify its subject and body
match the PR title and description, allowing only trailing newline normalization.
Do not add a PR-number suffix to the commit title unless it is also in the PR
title. Keep main history linear.

Keep merged PR titles and descriptions aligned with their immutable commit
messages. Do not edit one side alone or rewrite published history to make an
editorial correction.
