#
# Cookbook Name::mtna_server_installer_test
# Recipe::default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.
# Testing our install.sh script.

bash 'install.sh' do
  ignore_failure true
  code <<-EOH
    curl https://raw.githubusercontent.com/PronghornDigital/mtna-server-cookbook/master/install.sh | bash
    EOH
end
