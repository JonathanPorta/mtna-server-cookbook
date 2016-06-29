# Testing our installer script.

bash 'install.sh' do
  ignore_failure false
  code <<-EOH
    curl https://raw.githubusercontent.com/PronghornDigital/mtna-server-cookbook/master/install.sh | bash
    EOH
end
