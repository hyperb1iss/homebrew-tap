# hyperb1iss Homebrew Tap

Custom Homebrew formulae from [hyperb1iss](https://github.com/hyperb1iss).

## Installation

```bash
brew tap hyperb1iss/tap
```

## Available Formulae

### blocksd

ROLI Blocks device discovery, keepalive, and control on macOS. Includes the web dashboard and uses CoreMIDI.

```bash
brew install blocksd
blocksd run
```

After stopping the foreground process, run `blocksd install` to start at login. Repeat that command after upgrades to refresh the LaunchAgent. Before removing the package, run `blocksd uninstall`. Service commands do not need sudo.

Learn more: [github.com/hyperb1iss/blocksd](https://github.com/hyperb1iss/blocksd)

### git-iris

AI-powered Git workflow assistant with intelligent commit messages, code reviews, changelogs, and release notes.

```bash
brew install git-iris
```

Learn more: [github.com/hyperb1iss/git-iris](https://github.com/hyperb1iss/git-iris)
