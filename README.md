# raisedadead/tap

Homebrew formulae and casks for tools by [raisedadead](https://github.com/raisedadead).

```sh
brew install raisedadead/tap/<name>
```

| Name           | Kind    | Source                                                                  |
| -------------- | ------- | ----------------------------------------------------------------------- |
| `aeroplace`    | formula | [raisedadead/aeroplace](https://github.com/raisedadead/aeroplace)       |
| `dp-engine`    | formula | [raisedadead/dotplugins](https://github.com/raisedadead/dotplugins)     |
| `sketchyusage` | formula | [raisedadead/SketchyUsage](https://github.com/raisedadead/SketchyUsage) |
| `wt`           | cask    | [raisedadead/wt](https://github.com/raisedadead/wt)                     |

## Update a package

A release pipeline in the source repository writes `dp-engine` and `wt`. Update `aeroplace` and `sketchyusage` by hand.

### dp-engine

The `Homebrew Tap` workflow in `raisedadead/dotplugins` renders `Formula/dp-engine.rb` when the `Release` workflow completes. To publish a tag again, run `Homebrew Tap` from the Actions tab with the tag as input.

### wt

GoReleaser writes `Casks/wt.rb` when a `v*` tag is pushed to `raisedadead/wt`.

### aeroplace

The formula builds from source at a git tag. It pins the tag and the commit.

1. Release aeroplace. Its `AGENTS.md` gives the steps. Push the tag before you change the formula.

1. In `Formula/aeroplace.rb`, set `tag:` to the new tag and `revision:` to the full commit SHA of the tag:

   ```sh
   git -C <aeroplace clone> rev-parse 'v<version>^{commit}'
   ```

1. Check the formula:

   ```sh
   brew style Formula/aeroplace.rb
   ```

1. Commit as `feat(formula): update aeroplace to <version>`, then push.

1. Check the published formula:

   ```sh
   brew update
   brew audit --strict --online raisedadead/tap/aeroplace
   brew upgrade raisedadead/tap/aeroplace
   brew test raisedadead/tap/aeroplace
   ```

### sketchyusage

The formula builds from source at a git tag, like `aeroplace`. Follow the `aeroplace` steps with `Formula/sketchyusage.rb`, the SketchyUsage clone, and the commit subject `feat(formula): update sketchyusage to <version>`. Its `AGENTS.md` gives the release steps.

After an upgrade, restart the service:

```sh
brew services restart sketchyusage
```
