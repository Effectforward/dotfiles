# My Dotfiles

This directory contains the dotfiles for my system

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo dnf install git
```

### Stow

```
sudo dnf install stow
```

## Installation

First, check out the dotfiles repo in your `$HOME` directory using git

```
$ git clone git@github.com/effectforward/dotfiles.git
$ cd dotfiles
```

Before stowing, pre-create any directories that should not be symlinked wholesale:

```
$ mkdir -p ~/.config ~/scripts
```

Then use GNU stow to create symlinks:

```
$ stow .
```

Finally, generate the per-machine Flameshot config:

```
$ ./scripts/setup-flameshot.sh
```

Flameshot requires a literal absolute `savePath` and does not expand `~` or
`$HOME`, so the tracked file is a template in `templates/flameshot.ini`. The
setup script writes the real `~/.config/flameshot/flameshot.ini` for the
current machine.

## What's Tracked

| Path | Description |
|------|-------------|
| `.bashrc` | Bash shell config |
| `.config/alacritty.toml` | Alacritty terminal config |
| `.config/niri/config.kdl` | Niri compositor config |
| `.config/starship.toml` | Starship prompt config |
| `.config/starship_Tokyo_night.toml` | Starship Tokyo Night theme preset |
| `templates/flameshot.ini` | Flameshot config template (uses `@HOME@` placeholder) |
| `scripts/setup-flameshot.sh` | Generates the local Flameshot config |
| `scripts/fix-spicetify.sh` | Spicetify fix script |

## Desktop Preview

![Desktop](assets/desktop.png)

**Wallpaper:** [Buddha](https://whvn.cc/j83emp)

![Wallpaper](assets/wallpaper.jpg)

## Watch This Video For More Information

[![Watch This Video For More Information](https://img.youtube.com/vi/y6XCebnB9gs/maxresdefault.jpg)](https://www.youtube.com/watch?v=y6XCebnB9gs)