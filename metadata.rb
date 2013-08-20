name             "beanstalkd"
maintainer       "Escape Studios"
maintainer_email "dev@escapestudios.com"
license          "MIT"
description      "Installs/Configures beanstalkd"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.3"

%w{ debian ubuntu redhat centos fedora scientific amazon }.each do |os|
supports os
end

recommends "php"
recommends "python"

recipe "beanstalkd", "Installs beanstalkd."