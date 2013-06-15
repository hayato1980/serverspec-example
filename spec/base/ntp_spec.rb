require 'spec_helper'

describe package('ntp') do
  it { should be_installed }
end

describe service('ntpd') do
  it { should be_running }
  it { should be_enabled }
end

describe file('/etc/ntp.conf') do
  it { should be_file }
  it { should contain '^server ntp.nict.jp' }
  it { should contain '^server ntp.jst.mfeed.ad.jp' }
end

# アスタリスク "*" が左端に表示され参照中であること
describe command('ntpq -pn') do
  it { should return_stdout /^\*\d/}
end