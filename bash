#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

if ifconfig tun0 | grep -q "00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00"; then
    printf "${YELLOW}VPN:${NC}${GREEN} ON${NC}"
else
    printf "${YELLOW}VPN:${NC} ${RED} OFF${NC}"
fi

curl -s http://whatismycountry.com/ |
  sed -n 's|.*,\(.*\)</h3>|\1|p'

