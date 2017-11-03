#
# Cookbook Name::mtna_server
# Recipe::system
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

bash 'ops_tools' do
  code <<-EOH
    dnf install -y jq https://github.com/JonathanPorta/ops/releases/download/0.0.4/ops-0.0.4-local.git860078f.x86_64.rpm
    EOH
  ignore_failure false
end

# ensure sshd is running
service 'sshd.service' do
  action %i[start enable]
end

# default mtna user account
user 'mtna' do
  system true
end

# ensure node.js is installed
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '8.9.0'
node.default['nodejs']['binary']['checksum'] = '7a6df881183e70839857b51653811aaabc49a2ffb93416a1c9bd333dcef84ea3'
include_recipe 'nodejs'

# default mtna data directory
directory '/var/archives' do
  owner 'root'
  group 'mtna'
  mode '0775'
  action :create
end
