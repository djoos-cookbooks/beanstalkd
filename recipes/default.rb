#
# Cookbook:: beanstalkd
# Recipe:: default
#
# Copyright:: (c) 2016, David Joos
#

package 'beanstalkd' do
  action :upgrade
end

template_path = if platform?('debian', 'ubuntu')
                  '/etc/default/beanstalkd' # templates/ubuntu
                else
                  '/etc/sysconfig/beanstalkd' # templates/default
                end

template template_path do
  source 'beanstalkd.erb'
  owner 'root'
  group 'root'
  mode '644'
  variables(
    opts: node['beanstalkd']['opts'],
    listen_addr: node['beanstalkd']['listen_addr'],
    start_during_boot: node['beanstalkd']['start_during_boot']
  )
  notifies :restart, 'service[beanstalkd]'
end

service 'beanstalkd' do
  supports [:start, :stop, :status]
  # starts the service if it's not running and enables it to start at system boot time
  action [:enable, :start]
end
