#!/bin/bash
set -e
echo "📦 Creating 12GB swapfile..."

# Disable and delete old swap if exists
sudo swapoff /swapfile || true
sudo rm -f /swapfile

# Create new 12GB swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=12288 status=progress
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile

# Make persistent in /etc/fstab
if ! grep -q '/swapfile' /etc/fstab; then
    echo '/swapfile none swap defaults 0 0' | sudo tee -a /etc/fstab
fi
echo "✅ Swapfile created and enabled."
echo "💨 Installing ZRAM..."
yay -S --noconfirm zramswap
sudo systemctl enable --now zramswap.service
echo "Final"
swapon --show
