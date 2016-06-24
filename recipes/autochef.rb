#
# Cookbook Name::mtna_server
# Recipe::autochef
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

packagecloud_repo 'PronghornDigital/mtna_server_cookbook' do
  type 'rpm'
  metadata_expire '0'
end

package 'mtna_server_cookbook' do
  action [:upgrade]
end
