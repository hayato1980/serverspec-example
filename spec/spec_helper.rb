require 'serverspec'
require 'pathname'
require 'net/ssh'
require 'yaml'

include Serverspec::Helper::Ssh
include Serverspec::Helper::DetectOS

hosts = YAML.load_file('attributes.yaml')

RSpec.configure do |c|
  c.path = '/sbin:/usr/sbin'

  if ENV['ASK_SUDO_PASSWORD']
    require 'highline/import'
    c.sudo_password = ask("Enter sudo password: ") { |q| q.echo = false }
  else
    c.sudo_password = ENV['SUDO_PASSWORD']
  end

  c.host = ENV['TARGET_HOST']
  attr_set hosts[c.host]
  options = Net::SSH::Config.for(c.host)
  user    = options[:user] || Etc.getlogin
  if ENV['ASK_LOGIN_PASSWORD']
    options[:password] = ask("\nEnter login password: ") { |q| q.echo = false }
  elsif ENV['LOGIN_PASSWORD']
    options[:password] = ENV['LOGIN_PASSWORD']
  end
  c.ssh   = Net::SSH.start(c.host, user, options)
  c.os    = backend(Serverspec::Commands::Base).check_os

end
