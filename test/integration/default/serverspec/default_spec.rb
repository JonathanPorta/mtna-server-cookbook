require 'spec_helper'

describe 'mtna_server::default' do
  describe package('ops') do
    it { should be_installed }
  end

  describe service('sshd') do
    it { should be_enabled }
    it { should be_running }

    describe port(22) do
      it { should be_listening }
    end
  end

  describe user('mtna') do
    it { should exist }
  end
end
