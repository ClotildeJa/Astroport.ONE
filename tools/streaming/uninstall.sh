#!/usr/bin/env bash
## TO CONTROL & REWRITE
exit 0
set -e

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo systemctl stop process-stream
sudo systemctl disable process-stream
sudo rm -f /usr/bin/process-stream.sh
sudo rm -f /etc/systemd/system/process-stream.service
sudo systemctl daemon-reload

# Remove ffmpeg and supporting tools
sudo apt-get -y remove ffmpeg lsof inotify-tools

# Revert permissions
sudo chmod 755 /var/www/html
sed -i "/ipfs repo gc/d" | sudo tee --append /etc/crontab
