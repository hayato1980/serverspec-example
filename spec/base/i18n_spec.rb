require 'spec_helper'

describe file("/etc/sysconfig/keyboard") do
  it { should contain "jp106"}
end

describe command("date +%Z") do
  it { should return_stdout "JST"}
end