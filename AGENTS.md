# Linux Dotfiles

This repository contains Patrick's personal Ubuntu Linux dotfiles configuration, managed with GNU Stow.

## Repository Overview

Personal workspace configuration for Ubuntu Linux including shell customization (Zsh with Oh My Zsh), modern CLI tools, development environment setup (Node.js, PHP/Laravel), and productivity enhancements (tmux, starship prompt, lazygit, etc.).

## Purpose

Provides automated setup and consistent configuration for a productive Ubuntu development environment with modern CLI tools and custom shell enhancements.

## Directory Structure

- **Root directory**: Configuration files for stow (.zshrc, .aliases, .functions, .exports, .vimrc, .tmux.conf, .gitconfig, etc.)
- **scripts/**: Automated setup scripts for various components
  - `setup.sh`: Main orchestrator that runs all setup scripts
  - `basics.sh`: Basic vim/neovim directory setup
  - `tmux-nord-theme.sh`: Tmux Nord theme installation
  - `conky.sh`: Conky system monitor setup
  - `nvm.sh`: Node Version Manager installation
  - `valet.sh`: PHP and Valet+ setup (optional)
- **.config/**: Application-specific configurations
  - `systemd/user/`: User systemd services (conky.service)
  - `yazi/theme.toml`: Yazi file manager theme
- **apps.sh**: System package installation script using nala

## Setup & Installation

### Initial Setup

1. Clone repository to `~/dotfiles`
2. Run `sudo ./apps.sh` to install all required packages
3. Run `cd scripts && ./setup.sh` to execute all configuration scripts
4. Run `stow .` from the dotfiles directory to symlink config files

### Working with Stow

This repository uses GNU Stow to manage symlinks. When making changes:

- Edit files directly in the `~/dotfiles` directory
- After modifications, run `stow .` to update symlinks
- Stow creates symlinks in `~` pointing to files in this repo
- Use `stow -n .` to preview changes without applying them

### Adding New Configurations

To add a new dotfile:

1. Create the file in the appropriate location in `~/dotfiles`
   - For home directory configs: Place at root (e.g., `.newconfig`)
   - For app configs: Place in `.config/` maintaining proper path structure
2. Run `stow .` to create the symlink
3. Test that the configuration works as expected

## Key Components

### Shell Configuration

- **.zshrc**: Main Zsh configuration with Oh My Zsh, plugin setup, and initialization
- **.aliases**: Custom shell aliases for navigation, git, docker, development
- **.exports**: Environment variables and shell preferences
- **.functions**: Custom shell functions for common operations

### CLI Tools & Applications

- **zoxide**: Smart directory jumping (replaces cd)
- **starship**: Fast, customizable shell prompt
- **eza**: Modern ls replacement with icons
- **bat**: Syntax-highlighted cat replacement
- **ripgrep**: Fast grep alternative
- **fd**: User-friendly find alternative
- **fzf**: Fuzzy finder
- **lazygit**: Terminal UI for git
- **yazi**: Terminal file manager

### Development Tools

- **tmux**: Terminal multiplexer with Nord theme
- **vim/neovim**: Text editor configuration
- **nvm**: Node Version Manager for Node.js
- **valet+**: PHP development environment (optional)

## Conventions

### File Organization

- Keep root-level dotfiles at the repository root
- Place application configs in `.config/` maintaining the expected path structure
- Scripts go in the `scripts/` directory
- Setup scripts should be executable and idempotent (safe to run multiple times)

### Shell Scripts

- Use bash shebang `#!/bin/bash`
- Include error handling with `set -e` where appropriate
- Scripts in `scripts/` should be self-contained
- The main `setup.sh` orchestrator runs scripts in a specific order

### Configuration Files

- Shell configs should source other relevant files (e.g., .zshrc sources .aliases, .exports, .functions)
- Keep configuration modular and focused
- Document complex configurations with comments

## Testing Changes

### After Modifying Config Files

1. Run `stow .` to apply changes
2. Reload your shell: `exec zsh -l` or open a new terminal
3. Test that the changes work as expected

### After Modifying Scripts

1. Run the specific script to test: `./scripts/scriptname.sh`
2. Verify expected behavior
3. Check that the script handles errors gracefully

### Before Committing

1. Ensure `stow .` completes without errors
2. Test any new configurations
3. Verify scripts are executable and work correctly
4. Check that `.stow-local-ignore` is updated if needed

## Common Tasks

### Installing a New CLI Tool

1. Add the installation command to `apps.sh` using `nala install <package> -y`
2. If the tool requires configuration, add appropriate config file
3. Test installation and configuration

### Adding a New Alias

1. Add alias to `.aliases` in the appropriate section
2. Use descriptive, short aliases
3. Group related aliases together

### Creating a New Setup Script

1. Create script in `scripts/` directory
2. Make it executable: `chmod +x scripts/newscript.sh`
3. Add it to `setup.sh` in the appropriate order
4. Include error handling

## Notes

- Uses `nala` as apt replacement for better package management
- NVM loads automatically in shell, supports .nvmrc files
- Yazi file manager has `y()` function wrapper for automatic cd on exit
- SSH_AUTH_SOCK is configured for Gnome Keyring integration
- Private/local settings can be added to `~/.extra` (not tracked in git)

## Troubleshooting

### Stow Issues

- If stow complains about existing files, remove them first
- Use `stow -n -v .` to see what would be symlinked
- Check `.stow-local-ignore` for files that shouldn't be symlinked

### Shell Issues

- Reload shell after changes: `exec zsh -l`
- Check that Oh My Zsh is installed at `~/.oh-my-zsh`
- Verify NVM is properly loaded in `.zshrc`

### Setup Script Failures

- Run individual scripts separately to identify issues
- Check script logs for specific error messages
- Ensure required dependencies are installed via `apps.sh`
