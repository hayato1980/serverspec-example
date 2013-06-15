require 'spec_helper'

listening = [ 22,80 ]
not_listening = [ 25 ]

listening.each do |p|
  describe port(p) do
    it { should be_listening }
  end
end

not_listening.each do |p|
  describe port(p) do
    it { should_not be_listening }
  end
end
