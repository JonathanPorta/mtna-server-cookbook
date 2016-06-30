require 'spec_helper'

describe 'mtna_server::backup' do
  describe file('/var/archives/backups') do
    it { should be_directory }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe file('/opt/PronghornDigital/mtna-server-cookbook/backup.sh') do
    it { should be_file }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe service('mtna-backup.timer') do
    it { should be_enabled }
    it { should be_running }
  end

  describe service('mtna-backup.service') do
    it { should be_installed }
  end
end
