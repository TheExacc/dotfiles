#!/usr/bin/env bash

echo "Starting display and bar setup..."

# 1. Install required packages
echo "Installing autorandr..."
sudo pacman -S --needed autorandr

# 2. Ensure pulled scripts have executable permissions
echo "Setting executable permissions..."
chmod +x ~/.config/autorandr/postswitch
chmod +x ~/.config/polybar/launch.sh

# 3. Enable autorandr background service
echo "Enabling and starting autorandr background service..."
sudo systemctl enable --now autorandr.service

echo "Setup script finished successfully."
