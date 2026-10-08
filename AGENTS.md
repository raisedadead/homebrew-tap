# homebrew-tap

The Homebrew tap `raisedadead/tap`. `README.md` lists each package and gives its update steps.

## Layout

- `Formula/aeroplace.rb` — source build from a git tag. Maintained by hand
- `Formula/sketchyusage.rb` — source build from a git tag. Maintained by hand
- `Formula/dp-engine.rb` — prebuilt binaries. Written by the `Homebrew Tap` workflow in `raisedadead/dotplugins`
- `Casks/wt.rb` — prebuilt binaries. Written by GoReleaser in `raisedadead/wt`

## Rules

- Change `Formula/aeroplace.rb` and `Formula/sketchyusage.rb` only. The next release overwrites `dp-engine.rb` and `wt.rb`. Fix those in the source repository's pipeline.
- Pin a source formula with `tag:` and the full `revision:` SHA of that tag. The tag must be on GitHub before the formula changes.
- `brew style <file>` is the validator before a commit. After the push, run `brew audit --strict --online`, `brew upgrade` and `brew test` on the tapped formula.
- Keep each formula `test do` block free of window, network and permission access. `<binary> --version` is enough.

## Conventions

- `main` is the only branch. Commit subjects use `type(scope): subject`, 50 characters, imperative.
- The bot commits keep their own subjects.
