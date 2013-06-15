require 'spec_helper'

describe package('nc') do
  it { should be_installed }
end

describe host('localhost') do
  it { should be_reachable }
  it { should be_reachable.with( :port => 22 ) }
end

describe host('www.yahoo.co.jp') do
  it { should be_reachable }
  it { should_not be_reachable.with( :port => 22 ) }
  it { should_not be_reachable.with( :port => 80 ) }
  it { should_not be_reachable.with( :port => 443 ) }
end