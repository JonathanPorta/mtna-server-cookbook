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
    dnf install -y mtna-server
    dnf upgrade -y mtna-server
    EOH
  ignore_failure true
end
