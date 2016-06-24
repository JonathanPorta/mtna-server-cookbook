require 'spec_helper'

describe 'mtna_server::autochef' do
  describe package('mtna') do
    it { should be_installed }
  end
end
