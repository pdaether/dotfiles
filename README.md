# Patrick's Ubuntu Linux Dotfiles

A curated collection of dotfiles and setup scripts for configuring a productive Ubuntu Linux development environment. Managed with GNU Stow for easy deployment and maintenance.

## Overview

This repository contains configuration files and automated setup scripts for my personal Ubuntu workspace, including:

- **Shell Configuration**: Zsh with Oh My Zsh, custom aliases, functions, and exports
- **Terminal Tools**: Modern CLI replacements (bat, eza, ripgrep, fd, zoxide)
- **Development Setup**: Git, tmux, vim/neovim, starship prompt, conky system monitor
- **Language Support**: Node.js (via NVM), PHP (with Valet+ option)
- **File Management**: yazi file manager integration
- **Additional Tools**: lazygit, lazydocker, fzf, tldr, and more

## Features

### Shell Enhancements
- **Zsh** with Oh My Zsh framework
- **Starship** prompt for a beautiful, fast shell prompt
- **Zoxide** for smart directory jumping (enhanced cd)
- Custom aliases for git, docker, npm, PHP/Laravel development
- Automatic NVM initialization and .nvmrc support

### Modern CLI Tools
- **bat**: Syntax-highlighted cat replacement
- **eza**: Modern ls replacement with icons
- **ripgrep**: Fast grep alternative
- **fd**: User-friendly find alternative
- **fzf**: Fuzzy finder for files and command history
- **yazi**: Terminal file manager with cd integration

### Development Tools
- **lazygit**: Terminal UI for git commands
- **lazydocker**: Terminal UI for docker
- **tmux**: Terminal multiplexer with Nord theme
- **conky**: System monitoring on desktop
- **starship**: Fast, customizable shell prompt

## Installation

### Prerequisites

This setup is designed for Ubuntu Linux. Ensure you have sudo access.

### Quick Start

1. Clone this repository:
   ```bash
   git clone <repo-url> ~/dotfiles
   cd ~/dotfiles
   ```

2. Install all applications and tools:
   ```bash
   sudo ./apps.sh
   ```

3. Run the setup scripts:
   ```bash
   cd scripts
   ./setup.sh
   ```
   This will run configuration scripts for:
   - Basic vim/neovim setup
   - tmux with Nord theme
   - Conky system monitor
   - NVM (Node Version Manager)
   - Optionally: PHP and Valet+ (you'll be prompted)

4. Link the dotfiles to your home directory using GNU Stow:
   ```bash
   cd ~/dotfiles
   stow .
   ```
   This creates symlinks for all configuration files in your home directory.

5. Set zsh as your default shell (if not already):
   ```bash
   chsh -s $(which zsh)
   ```

6. Restart your terminal or reload your shell:
   ```bash
   exec zsh -l
   ```

## File Structure

```
.
├── .config/           # Application configurations
│   ├── systemd/      # Systemd user services (conky)
│   └── yazi/         # Yazi file manager theme
├── scripts/          # Setup and configuration scripts
│   ├── setup.sh      # Main setup orchestrator
│   ├── basics.sh     # Basic vim/neovim setup
│   ├── tmux-nord-theme.sh
│   ├── conky.sh      # Conky system monitor setup
│   ├── nvm.sh        # Node Version Manager setup
│   └── valet.sh      # PHP and Valet+ setup
├── apps.sh           # Install all CLI tools and applications
├── .aliases          # Shell aliases
├── .exports          # Environment variables
├── .functions        # Custom shell functions
├── .gitconfig        # Git configuration
├── .tmux.conf        # Tmux configuration
├── .vimrc            # Vim configuration
└── .zshrc            # Zsh configuration
```

## Key Aliases

### Navigation
- `..`, `...`, `....` - Navigate up directories
- `p` - cd to ~/projects
- `c` - cd to ~/code
- `w` - cd to ~/www

### Git
- `g` - git
- `gs` - git status
- `gd` - git diff
- `lg` - lazygit
- `nah` - Reset repository to clean state

### Docker
- `ld` - lazydocker
- `dps` - Show running containers in table format

### File Listing
- `l` - List files with eza (long format, icons)
- `ll` - List all files including hidden
- `lt` - List files in tree format

### Development
- `art` - php artisan (Laravel)
- `nrd` - npm run dev
- `nrb` - npm run build

See `.aliases` for the complete list.

## Customization

- **Additional environment variables**: Edit `.exports`
- **Custom aliases**: Edit `.aliases`
- **Shell functions**: Edit `.functions`
- **Private settings**: Create `~/.extra` for settings you don't want to commit

The `.zshrc` automatically sources all these files on shell startup.

## Updating

To update applications:
```bash
alias update='sudo apt update && sudo apt full-upgrade && sudo flatpak update'
```

To pull latest dotfiles changes:
```bash
cd ~/dotfiles
git pull
stow .  # Re-apply symlinks if needed
```

## TODO

* [ ] Install Nerd Font (CascadiaCode for example)
* [ ] Setup zsh as default shell
* [ ] Add more apps to `apps.sh` (flatpack of Inkscape, Gimp, Spotify, Super Productivity, etc.)
* [ ] Setup VSC
* [ ] Setup neovim (lazyvim)
* [ ] Setup lazydocker
* [ ] Setup docker + docker desktop

## License

These are my personal dotfiles - feel free to use them as inspiration for your own setup!

## Credits

Inspired by various dotfiles repositories in the community, particularly [Mathias Bynens' dotfiles](https://github.com/mathiasbynens/dotfiles).
