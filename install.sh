#!/bin/bash
dnf install -y https://packages.chef.io/stable/el/6/chef-12.11.18-1.el6.x86_64.rpm

curl https://packagecloud.io/install/repositories/PronghornDigital/mtna-server-cookbook/script.rpm.sh | bash
dnf install -y mtna-server-cookbook

chef-solo -c /opt/PronghornDigital/mtna-server-cookbook/solo.rb -o "recipe[mtn_server::autochef]"
