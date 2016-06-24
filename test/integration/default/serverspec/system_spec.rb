require 'spec_helper'

describe 'mtna_server::_system' do
  describe user('portaj') do
  
  end

  describe service('sshd') do
    it { should be_enabled }
    it { should be_running }

    describe port(22) do
      it { should be_listening }
    end
  end
end
