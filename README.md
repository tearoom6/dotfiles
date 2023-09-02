# tearoom6 dotfiles

## Update Git submodules

```sh
git submodule update --init
```

## Create symlinks to dotfiles

```sh
$ git clone https://github.com/tearoom6/dotfiles.git
$ cd dotfiles/
$ ./setup.sh
```

## Install Homebrew & packages (macOS only)

```sh
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
$ brew tap Homebrew/bundle
$ brew bundle

# Optional: Remove unlisted items in Brewfile.
$ brew bundle cleanup
$ brew bundle cleanup --force
```

```sh
$ anyenv install --init
```

## Setup Atom (macOS only)

```sh
$ ~/.atom/setup.sh
```

## Setup VSCode (macOS only)

```sh
$ ~/.vscode/setup.sh
```
