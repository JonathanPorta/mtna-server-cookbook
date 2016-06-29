#
# Cookbook Name::mtna_server
# Recipe::default
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

include_recipe 'mtna_server::mtna'
include_recipe 'mtna_server::backup'
include_recipe 'mtna_server::autochef'
