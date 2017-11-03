#
# Cookbook Name::mtna_server
# Recipe::autochef
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# ensures that the base system stuff is setup when bootstraping
include_recipe 'mtna_server::system'

bash 'ops_tools' do
  code <<-EOH
    dnf install -y jq https://github.com/JonathanPorta/ops/releases/download/0.0.4/ops-0.0.4-local.git860078f.x86_64.rpm
    EOH
  ignore_failure false
end

bash 'mtna-server-cookbook' do
  code <<-EOH
    dnf install -y $(gh latest PronghornDigital/mtna-server-cookbook --download-url)
    EOH
  ignore_failure false
end

# install the autochef systemd service and timer
template '/etc/systemd/system/autochef.service' do
  mode '0755'
  source 'autochef.service.erb'
end

template '/etc/systemd/system/autochef.timer' do
  mode '0755'
  source 'autochef.timer.erb'
end

service 'autochef.timer' do
  reload_command 'systemctl daemon-reload'
  action %i[start enable]
end

# ensure the correct permissons on the script
file '/opt/PronghornDigital/mtna-server-cookbook/autochef.sh' do
  owner 'root'
  group 'mtna'
  mode '0775'
end
