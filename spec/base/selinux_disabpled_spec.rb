require 'spec_helper'

describe selinux do
  it { should be_disabled }
end

describe file('/etc/selinux/config') do
  it { should be_file }
  it { should contain "SELINUX=disabled" }
end
