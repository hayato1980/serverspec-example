require 'spec_helper'

enable_services = ['httpd','ntpd']
disable_services = ['postfix']

enable_services.each do |s|
  describe service(s) do 
    it { should be_enabled   };
    it { should be_running   } 
  end
end

disable_services.each do |s|
  describe service(s) do 
    it { should_not be_enabled   };
    it { should_not be_running   } 
  end
end
