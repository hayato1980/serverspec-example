require 'spec_helper'

describe user('root') do
  it { should exist }
  it { should belong_to_group 'root' }
  it { should have_uid 0 }
  it { should have_home_directory 'root' }
  it { should have_login_shell '/bin/bash' }
  it { should have_authorized_key '' }
end

describe group('root') do
  it { should exist }
  it { should have_gid 0 }
end
