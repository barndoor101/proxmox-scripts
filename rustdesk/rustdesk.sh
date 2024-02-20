#!/usr/bin/env bash
source <(curl -s https://raw.githubusercontent.com/barndoor101/proxmox-scripts/master/shared/build.func)
# Copyright (c) 2024 barndoor101
# Author: barndoor101
# License: MIT

function header_info {
clear
cat <<"EOF"
    ____             __  ____            __  
   / __ \__  _______/ /_/ __ \___  _____/ /__
  / /_/ / / / / ___/ __/ / / / _ \/ ___/ //_/
 / _, _/ /_/ (__  ) /_/ /_/ /  __(__  ) ,<   
/_/ |_|\__,_/____/\__/_____/\___/____/_/|_|  
                                             
EOF
}