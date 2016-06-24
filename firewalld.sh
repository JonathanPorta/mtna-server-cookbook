#!/bin/bash

set -e # bail if we fail, dale!

echo 'Manually setting firewall settings as a workaround for broken firewall cookbook issues.'
echo '------------------------------'

echo 'Setting default firewall zone to "home"...'
firewall-cmd --set-default-zone=home

echo 'Allowing SSH through the firewall...'
firewall-cmd --add-service=ssh --permanent

# echo 'Opening ports 135, 139, and 445 for TCP traffic for smbd'
# firewall-cmd --add-port=135/tcp --permanent
# firewall-cmd --add-port=139/tcp --permanent
# firewall-cmd --add-port=445/tcp --permanent
#
# echo 'Opening ports 137 and 138 for UDP traffic for nmbd'
# firewall-cmd --add-port=137/udp --permanent
# firewall-cmd --add-port=138/udp --permanent

echo 'Reloading firewall config...'
firewall-cmd --reload

echo 'The firewall is now configured as follows:'
firewall-cmd --list-all
