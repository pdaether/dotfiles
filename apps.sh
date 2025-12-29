nala install 7zip -y
# Replacement for cat with syntax highlighting
# https://github.com/sharkdp/bat
nala install bat -y
# Replacenent for ls
# Eza is not as good as exa, I don't know why it's not available in the repo anymore
# Install via binary: https://the.exa.website/install/linux
nala install eza -y
nala install htop -y
nala install fastfetch -y
nala install fd-find -y
nala install fzf -y
nala install git -y
nala install imagemagick -y
nala install jq -y
nala install nmap -y
# Filter for shell https://github.com/peco/peco
nala install peco -y
nala install poppler-utils -y
nala install ripgrep -y
nala install starship -y
# For symlinking the dotfiles: https://www.gnu.org/software/stow/
nala install stow
nala install tig -y
# https://tldr.sh/
nala install tldr -y
nala install tmux -y
nala install tree -y
nala install xclip -y
nala install lazygit -y
# For nice system monitoring:
nala install conky-all -y
nala install xclip -y
nala install zoxide -y

###################
# Libs for development
###################

nala install libicu-dev libxml2-dev libavif16 libmanette-0.2-0
