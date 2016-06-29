#
# Cookbook Name::mtna_server
# Recipe::backup
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# install the mtna-backup systemd service and timer
template '/etc/systemd/system/mtna-backup.service' do
  mode '0755'
  source 'mtna-backup.service.erb'
end

template '/etc/systemd/system/mtna-backup.timer' do
  mode '0755'
  source 'mtna-backup.timer.erb'
end

service 'mtna-backup.timer' do
  reload_command 'systemctl daemon-reload'
  action [:start, :enable]
end

# default mtna backup directory
directory '/var/archives/backups' do
  owner 'root'
  group 'mtna'
  mode '0775'
  action :create
end

# ensure the correct permissons on the script
file '/opt/PronghornDigital/mtna-server-cookbook/backup.sh' do
  owner 'root'
  group 'mtna'
  mode '0775'
end
