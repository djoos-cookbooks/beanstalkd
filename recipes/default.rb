#
# Cookbook Name:: beanstalkd
# Recipe:: default
#
# Copyright 2012, Escape Studios
#

package "beanstalkd" do
	action :upgrade
end

if platform?("centos","redhat","fedora","scientific")
	so_template = "/etc/sysconfig/beanstalkd"
	template_src = "beanstalkd_rhel.erb"
else
	so_template = "/etc/default/beanstalkd"
	template_src = "beanstalkd.erb"
end

template "#{so_template}" do
	source template_src
	owner "root"
	group "root"
	mode 0640
	variables(
		:start_during_boot => node['beanstalkd']['start_during_boot'],
		:listen_addr => node['beanstalkd']['listen_addr'],
		:listen_port => node['beanstalkd']['listen_port'],
		:user => node['beanstalkd']['user'],
	)
	notifies :restart, "service[beanstalkd]"
end


service "beanstalkd" do
	start_command "/etc/init.d/beanstalkd start"
	stop_command "/etc/init.d/beanstalkd stop"
	status_command "/etc/init.d/beanstalkd status"
	supports [:start, :stop, :status]
    #starts the service if it's not running and enables it to start at system boot time
	action [:enable, :start]
end