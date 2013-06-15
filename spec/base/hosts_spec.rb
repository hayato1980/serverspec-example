require 'spec_helper'

hosts = [
  "localhost"
]

hosts.each do |h|
  describe host(h) do
    it { should be_resolvable.by('hosts') }
  end
end
