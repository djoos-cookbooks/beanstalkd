name 'beanstalkd'
maintainer 'David Joos'
maintainer_email 'development@davidjoos.com'
license 'MIT'
description 'Installs/Configures beanstalkd'
version '0.4.0'

%w(debian ubuntu redhat centos fedora scientific amazon).each do |os|
  supports os
end

source_url 'https://github.com/djoos-cookbooks/beanstalkd'
issues_url 'https://github.com/djoos-cookbooks/beanstalkd/issues'
depends 'php'
depends 'poise-python'
