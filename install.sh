#!/bin/bash
echo 'Installing jq...'
dnf install -y jq

echo 'Starting install of ChefDk package...'
dnf install -y https://packages.chef.io/stable/el/6/chef-12.11.18-1.el6.x86_64.rpm

echo 'Starting install of JonathanPorta/ops package...'
dnf install -y https://github.com/JonathanPorta/ops/releases/download/0.0.4/ops-0.0.4-local.git860078f.x86_64.rpm

echo 'Starting install of PronghornDigital/mtna-server-cookbook package...'
dnf install -y $(gh latest PronghornDigital/mtna-server-cookbook --download-url)

chef-solo -c /opt/PronghornDigital/mtna-server-cookbook/solo.rb -o "recipe[mtna_server::autochef]"
