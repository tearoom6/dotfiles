# tearoom6 dotfiles

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
```

## Install Atom packages (macOS only)

```sh
$ apm install --packages-file ~/.atom/packages.txt
```

## Setup VSCode (macOS only)

```sh
$ ~/.vscode/setup.sh
```
