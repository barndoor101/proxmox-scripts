#!/usr/bin/env bash

# Copyright (c) 2024 barndoor101
# Author: barndoor101
# License: MIT

source /dev/stdin <<< "$FUNCTIONS_FILE_PATH"
color
verb_ip6
catch_errors
setting_up_container
network_check
update_os

msg_info "Installing Dependencies"
$STD apt-get install -y curl
$STD apt-get install -y sudo
$STD apt-get install -y mc
msg_ok "Installed Dependencies"

msg_info "Installing Opengist"
cd ..
wget wget https://github.com/thomiceli/opengist/releases/download/v1.6.1/opengist1.6.1-linux-amd64.tar.gz
tar xzvf opengist1.6.1-linux-amd64.tar.gz
cd opengist
chmod +x opengist
cd ..
rm opengist1.6.1-linux-amd64.tar.gz
msg_ok "Installed Opengist"

msg_info "Creating Service"
cat <<EOF >/etc/systemd/system/opengist.service
[Unit]
Description=Opengist Service
After=network.target

[Service]
Type=simple
WorkingDirectory=/opengist/
ExecStart=/opengist/opengist --config config.yml
Environment=HOME=/home/%u

[Install]
WantedBy=multi-user.target
EOF
systemctl enable -q --now opengist.service
msg_ok "Created Service"

motd_ssh
customize

msg_info "Cleaning up"
$STD apt-get autoremove
$STD apt-get autoclean
msg_ok "Cleaned"