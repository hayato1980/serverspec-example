require 'spec_helper'

describe command('host www.google.com') do
  it { should return_exit_status 0 }
end
