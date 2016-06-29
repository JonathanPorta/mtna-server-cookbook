#
# Cookbook Name::mtna_server
# Recipe::mtna
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# ensure node.js is installed
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '6.2.2'
node.default['nodejs']['binary']['checksum'] = '7a6df881183e70839857b51653811aaabc49a2ffb93416a1c9bd333dcef84ea3'
include_recipe 'nodejs'

# default mtna data directory
directory '/var/archives' do
  owner 'root'
  group 'mtna'
  mode '0775'
  action :create
end

# default mtna data directory
directory '/var/archives/data' do
  owner 'root'
  group 'mtna'
  mode '0775'
  action :create
end

# ensure that the .db.json at least exists
file '/var/archives/data/.db.json' do
  content '{}'
  mode '0775'
  owner 'root'
  group 'mtna'
  action :create_if_missing
end

# ensure perms are correct always
file '/var/archives/data/.db.json' do
  mode '0775'
  owner 'root'
  group 'mtna'
end

# before we install the new version, let's backup
bash '/opt/PronghornDigital/backup.sh' do
  ignore_failure false
end

# tell rpm where to find the mtna repo
packagecloud_repo 'PronghornDigital/mtna' do
  type 'rpm'
  metadata_expire '0'
  force_os 'fedora'
  force_dist '23'
end

# install the mtna rpm
# TODO: Use package - currently package doesn't support dnf and the dnf cookbook is broken.
bash 'mtna' do
  code <<-EOH
    dnf install -y mtna
    dnf upgrade -y mtna
    EOH
  ignore_failure true
end

# install the systemd service file that runs mtna
template '/etc/systemd/system/mtna.service' do
  mode '0755'
  source 'mtna.service.erb'
  notifies :restart, 'service[mtna.service]', :delayed
end

service 'mtna.service' do
  reload_command 'systemctl daemon-reload'
  action [:start, :enable]
end
