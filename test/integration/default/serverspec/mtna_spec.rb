require 'spec_helper'

describe 'mtna_server::mtna' do

  describe file('/usr/local/bin/node') do
    it { should be_file }
  end

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

  describe file('/var/archives/data/.db.json') do
    it { should be_file }
    it { should be_mode 775 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'mtna' }
  end

  describe service('mtna') do
    it { should be_enabled }
    it { should be_running }

    describe port(8080) do
      it { should be_listening }
    end
  end
end