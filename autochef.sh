#!/bin/bash
echo 'Installing jq...'
dnf install -y jq

echo 'Starting update of JonathanPorta/ops package...'
dnf install -y https://github.com/JonathanPorta/ops/releases/download/0.0.4/ops-0.0.4-local.git860078f.x86_64.rpm

echo 'Starting update of mtna-server-cookbook package...'
dnf install -y $(gh latest PronghornDigital/mtna-server-cookbook --download-url)

echo 'Kicking off chef converge...'
chef-solo -c /opt/PronghornDigital/mtna-server-cookbook/solo.rb -j /opt/PronghornDigital/mtna-server-cookbook/solo.json

echo 'Handling the great wall of fire-d...'
/opt/PronghornDigital/mtna-server-cookbook/firewalld.sh
