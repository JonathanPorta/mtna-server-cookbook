#!/bin/bash
dnf install -y https://opscode-omnibus-packages.s3.amazonaws.com/el/6/x86_64/chefdk-0.6.0-1.el6.x86_64.rpm

curl https://packagecloud.io/install/repositories/PronghornDigital/mtna-server-cookbook/script.rpm.sh | bash
dnf install -y mtna_server

chef-solo -c /opt/PronghornDigital/mtna-server-cookbook/solo.rb -o "recipe[mtn_server::autochef]"
