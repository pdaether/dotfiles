#!/bin/bash

# Setup script that runs all configuration scripts in order

echo "Starting setup process..."

# Run basics.sh
echo "Running basics.sh..."
./basics.sh
if [ $? -ne 0 ]; then
    echo "Error: basics.sh failed"
    exit 1
fi

# Run tmux-nord-theme.sh
echo "Running tmux-nord-theme.sh..."
./tmux-nord-theme.sh
if [ $? -ne 0 ]; then
    echo "Error: tmux-nord-theme.sh failed"
    exit 1
fi

# Run conky.sh
echo "Running conky.sh..."
./conky.sh
if [ $? -ne 0 ]; then
    echo "Error: conky.sh failed"
    exit 1
fi

# Run nvm.sh
echo "Running nvm.sh..."
./nvm.sh
if [ $? -ne 0 ]; then
    echo "Error: nvm.sh failed"
    exit 1
fi

# Ask for confirmation before running valet.sh
read -p "Do you want to setup php and valet plus? (y/n) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Running valet.sh..."
    ./valet.sh
    if [ $? -ne 0 ]; then
        echo "Error: valet.sh failed"
        exit 1
    fi
else
    echo "Skipping valet.sh setup"
fi

# Run gh.sh
echo "Running gh.sh..."
./gh.sh
if [ $? -ne 0 ]; then
    echo "Error: gh.sh failed"
    exit 1
fi

echo "Setup process completed successfully!"
