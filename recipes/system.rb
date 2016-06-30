#
# Cookbook Name::mtna_server
# Recipe::system
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# Dependency needed for installing our repo
bash 'pygpgme' do
  code <<-EOH
    dnf install -y pygpgme
    EOH
end

# ensure sshd is running
service 'sshd.service' do
  action [:start, :enable]
end

# default mtna user account
user 'mtna' do
  system true
end

# ensure node.js is installed
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '6.2.2'
node.default['nodejs']['binary']['checksum'] = '7a6df881183e70839857b51653811aaabc49a2ffb93416a1c9bd333dcef84ea3'
include_recipe 'nodejs'
