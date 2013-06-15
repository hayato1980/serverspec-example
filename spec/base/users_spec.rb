require 'spec_helper'

users = [
  { :user => 'root', :group => 'root' ,:uid => 0, :home => '/root' , :loginshell => '/bin/bash' , :authorized_key => ''}
]

users.each do |u|
  describe user(u[:user]) do
    it { should exist }
    it { should belong_to_group u[:group] }
    it { should have_uid u[:uid] }
    it { should have_home_directory u[:home] }
    it { should have_login_shell u[:loginshell] }
    it { should have_authorized_key u[:authorized_key] } unless u[:authorized_key].nil?
  end
end

groups = [
  { :group => 'root', :gid => 0 }
]

groups.each do |g|
  describe group(g[:group]) do
    it { should exist }
    it { should have_gid g[:gid] }
  end
end
