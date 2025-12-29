#!/bin/bash

# Create the themes directory if it doesn't exist
mkdir -p ~/.config/tmux/themes

# Clone the Nord tmux theme repository
git clone git@github.com:nordtheme/tmux.git ~/.config/tmux/themes/nord-tmux

echo "Nord tmux theme cloned successfully to ~/.config/tmux/themes/nord-tmux"
