# Encoding: UTF-8

require 'spec_helper'

describe 'clamav enabled services' do
  let(:clamd_service) do
    @node['platform_family'] == 'debian' ? 'clamav-daemon' : 'clamd'
  end
  let(:freshclam_service) do
    @node['platform_family'] == 'debian' ? 'clamav-freshclam' : 'freshclam'
  end

  it 'is running clamd' do
    expect(service(clamd_service)).to be_enabled
    expect(service(clamd_service)).to be_running
  end

  it 'is running freshclam' do
    expect(service(freshclam_service)).to be_enabled
    expect(service(freshclam_service)).to be_running
  end
end
