# Astnai ZSH Theme

A minimal ZSH theme with clean design and smart functionality.

![screenshot](https://i4jauuo5gk.ufs.sh/f/bg1v3x3oGVlZwFhVqpbyEokbUOj65igKaIvfVYeTM20mGPX3)

## **Features**

- **Minimal design** with only two colors
- **Smart ls command** that shows directories first with `/` prefix
- **Responsive output** that wraps based on terminal width
- **Clean prompt** showing only path without clutter
- **No Git integration** for distraction-free coding

## Preview

```
astnai/projects/personal ls
/docs  /src  /tests  config.json  package.json  README.md
astnai/projects/personal 
```

## Requirements

- [Oh My Zsh](https://ohmyz.sh/) installed
- ZSH shell

## Quick Install

1. Clone this repository:
```bash
git clone https://github.com/astnai/astnai-theme.git
cd astnai-theme
```

2. Run the installer:
```bash
chmod +x install.sh
./install.sh
```

3. Restart your terminal or run:
```bash
source ~/.zshrc
```

## Manual Install

1. Copy the theme file:
```bash
cp astnai.zsh-theme ~/.oh-my-zsh/themes/
```

2. Edit your `~/.zshrc` file:
```bash
ZSH_THEME="astnai"
```

3. Apply changes:
```bash
source ~/.zshrc
```

## Color Palette

- **Primary text**: `#f5f5f5` (light gray)
- **Secondary text**: `#737373` (medium gray)
- **Background**: Works best with dark terminals

## Customization

To modify colors, edit the theme file at `~/.oh-my-zsh/themes/astnai.zsh-theme` and change the color definitions at the top.

## Uninstall

1. Change theme in `~/.zshrc`:
```bash
ZSH_THEME="robbyrussell"  # or any other theme
```

2. Remove theme file:
```bash
rm ~/.oh-my-zsh/themes/astnai.zsh-theme
```

## License

MIT License - feel free to customize and share!