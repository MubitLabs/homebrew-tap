# Mubit Homebrew tap

## How do I install these formulae?

`brew install MubitLabs/tap/<formula>`

Or `brew tap MubitLabs/tap` and then `brew install <formula>`.

Or, in a `brew bundle` `Brewfile`:

```ruby
tap "MubitLabs/tap"
brew "<formula>"
```

## Formulae

| Formula | Description |
|---|---|
| `mubit-cli` | The command-line client for Mubit: manage tasks, calls, trained models, keys and settings from a terminal |

## Maintenance

`Formula/mubit-cli.rb` is generated. The release job in the Mubit platform repository rewrites it on every `cli-v*` tag, with the version and the four checksums taken from the artifacts it just built. Do not edit it by hand: the next release overwrites the file.

## Documentation

`brew help`, `man brew` or check [Homebrew's documentation](https://docs.brew.sh).
