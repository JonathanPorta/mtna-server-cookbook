#
# Cookbook Name::mtna_server
# Recipe::autochef
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# ensures that the base system stuff is setup when bootstraping
include_recipe 'mtna_server::system'

packagecloud_repo 'PronghornDigital/mtna-server-cookbook' do
  type 'rpm'
  metadata_expire '0'
  force_os 'fedora'
  force_dist '23'
end

bash 'mtna-server-cookbook' do
  code <<-EOH
    dnf install -y mtna-server-cookbook
    dnf upgrade -y mtna-server-cookbook
    EOH
  ignore_failure true
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
  action [:start, :enable]
end

# ensure the correct permissons on the script
file '/opt/PronghornDigital/mtna-server-cookbook/autochef.sh' do
  owner 'root'
  group 'mtna'
  mode '0775'
end
