#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/tteck/Proxmox/main/misc/build.func)
# Copyright (c) 2024 barndoor101
# Author: barndoor101
# License: MIT

function header_info {
clear
cat <<"EOF"

   ____                         _      __ 
  / __ \____  ___  ____  ____ _(_)____/ /_
 / / / / __ \/ _ \/ __ \/ __ `/ / ___/ __/
/ /_/ / /_/ /  __/ / / / /_/ / (__  ) /_  
\____/ .___/\___/_/ /_/\__, /_/____/\__/  
    /_/               /____/              

EOF
}
header_info
echo -e "Loading..."
APP="Opengist"
var_disk="4"
var_cpu="1"
var_ram="1024"
var_os="debian"
var_version="12"
variables
color
catch_errors

function default_settings() {
  CT_TYPE="1"
  PW=""
  CT_ID=$NEXTID
  HN=$NSAPP
  DISK_SIZE="$var_disk"
  CORE_COUNT="$var_cpu"
  RAM_SIZE="$var_ram"
  BRG="vmbr0"
  NET="dhcp"
  GATE=""
  APT_CACHER=""
  APT_CACHER_IP=""
  DISABLEIP6="no"
  MTU=""
  SD=""
  NS=""
  MAC=""
  VLAN=""
  SSH="no"
  VERB="no"
  echo_default
}

function update_script() {
header_info
if [[ ! -d /opt/opengist ]]; then msg_error "No ${APP} Installation Found!"; exit; fi
msg_info "Stopping Opengist"
systemctl stop opengist
msg_ok "Stopped Opengist"

msg_info "Updating Opengist"
cd /opt/opengist
rm commafeed.jar
wget -q https://github.com/Athou/commafeed/releases/latest/download/commafeed.jar
msg_ok "Updated CommaFeed"

msg_info "Starting CommaFeed"
systemctl start commafeed
msg_ok "Update Completed Successfully"
exit
}

start
build_container
description

msg_ok "Completed Successfully!\n"
echo -e "${APP} should be reachable by going to the following URL.
         ${BL}http://${IP}:6157${CL} \n"