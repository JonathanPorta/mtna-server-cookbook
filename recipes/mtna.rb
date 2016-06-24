#
# Cookbook Name::mtna_server
# Recipe::mtna
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# tell rpm where to find the mtna repo
packagecloud_repo 'PronghornDigital/mtna' do
  type 'rpm'
  metadata_expire '0'
end

# install the mtna rpm
package 'mtna' do
  action [:upgrade]
end

# install the systemd service file that runs mtna
template '/etc/systemd/system/mtna.service' do
  mode '0755'
  source 'mtna.service'
  notifies :restart, 'service[mtna.service]', :delayed
end

service 'mtna.service' do
  action [:start, :enable]
end
