require 'spec_helper'

describe 'mtna_server::mtna::deps' do
  describe file('/usr/local/bin/node') do
    it { should be_file }
  end
end

describe 'mtna_server::mtna::directories' do
  describe file('/var/archives') do
    it { should be_directory }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe file('/var/archives/data') do
    it { should be_directory }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe file('/var/archives/incoming') do
    it { should be_directory }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe file('/var/archives/data/.db.json') do
    it { should be_file }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end
end

describe 'mtna_server::mtna::backups' do
  # make sure our forced, pre-install backup happened.
  t = Time.new
  backup_file = t.strftime('backup-%b-%d-%y-mtna-chef-preinstall.tar.gz')

  describe file("/var/archives/backups/#{backup_file}") do
    it { should be_file }
  end
end

describe 'mtna_server::mtna::service' do
  describe service('mtna') do
    it { should be_enabled }
    it { should be_running }

    describe port(8080) do
      it { should be_listening }
    end
  end
end
