#!/bin/bash

echo 'Starting update of mtna-server-cookbook package...'
dnf upgrade -y mtna-server-cookbook

echo 'Kicking off chef converge...'
chef-solo -c /opt/PronghornDigital/mtna-server-cookbook/solo.rb -j /opt/PronghornDigital/mtna-server-cookbook/solo.json

# echo 'Handling the great wall of fire-d...'
# /opt/PronghornDigital/mtna-server-cookbook/firewalld.sh
