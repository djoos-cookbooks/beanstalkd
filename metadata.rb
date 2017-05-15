name 'beanstalkd'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures beanstalkd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.3.0'

%w(debian ubuntu redhat centos fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/beanstalkd' if respond_to?(:source_url)
issues_url 'https://github.com/djoos-cookbooks/beanstalkd/issues' if respond_to?(:issues_url)
depends 'php'
depends 'python'

recipe 'beanstalkd', 'Installs beanstalkd.'
