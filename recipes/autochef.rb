#
# Cookbook Name::mtna_server
# Recipe::autochef
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packagecloud_repo 'PronghornDigital/mtna-server-cookbook' do
  type 'rpm'
  metadata_expire '0'
end

bash 'mtna' do
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
