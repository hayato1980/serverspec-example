require 'rake'
require 'rspec/core/rake_task'
require 'yaml'
 
hosts = YAML.load_file('attributes.yaml')
 
desc "Run serverspec to all hosts"
task :serverspec => 'serverspec:all'
 
namespace :serverspec do
  task :all => hosts.keys.map {|k| 'serverspec:' + k.split('.').first }
  hosts.keys.each do |host|
    desc "Run serverspec to #{host}"
    RSpec::Core::RakeTask.new(host.split('.').first.to_sym) do |t|
      ENV['TARGET_HOST'] = host
      t.pattern = 'spec/{' + hosts[host][:roles].join(',') + '}/*_spec.rb'
    end
  end
end
