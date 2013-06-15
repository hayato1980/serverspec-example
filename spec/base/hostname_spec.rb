require 'spec_helper'

describe command('hostname') do
  it { should return_stdout(attr[:hostname]) }
end