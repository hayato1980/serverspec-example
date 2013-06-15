require 'spec_helper'

describe host('www.google.com') do
  it { should be_resolvable.by('dns') }
end