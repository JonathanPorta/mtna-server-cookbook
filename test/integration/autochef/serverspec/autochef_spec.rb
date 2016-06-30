require 'spec_helper'

describe 'mtna_server::autochef' do
  describe package('mtna-server-cookbook') do
    it { should be_installed }
  end

  describe file('/opt/PronghornDigital/mtna-server-cookbook/autochef.sh') do
    it { should be_file }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe service('autochef.timer') do
    it { should be_enabled }
    it { should be_running }
  end

  # TODO: be_installed is not implemented for service types yet. Workaround:
  describe file('/etc/systemd/system/autochef.service') do
    it { should be_file }
  end

  # describe service('autochef.service') do
  #   it { should be_installed }
  # end
end
