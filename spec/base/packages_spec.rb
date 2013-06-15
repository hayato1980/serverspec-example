require 'spec_helper'

installed_packages = [
  'httpd'
]

not_installed_packages = [
  'notinstalled'
]

installed_packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end

not_installed_packages.each do |p|
  describe package(p) do
    it { should_not be_installed }
  end
end