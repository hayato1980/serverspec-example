require 'spec_helper'

describe command('yum search wget') do
  it { should exit_status 0 }
end
