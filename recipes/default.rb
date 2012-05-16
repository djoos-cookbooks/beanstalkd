#
# Cookbook Name:: chef-beanstalk
# Recipe:: default
#
# Copyright 2012, Escape Studios
#

package "beanstalkd" do
	action :install
end

service "beanstalkd" do
	service_name "beanstalkd"

	start_command "/etc/init.d/beanstalkd start"
	stop_command "/etc/init.d/beanstalkd stop"
	restart_command "/etc/init.d/beanstalkd restart"
	status_command "/etc/init.d/beanstalkd status"

	supports value_for_platform(
		"default" => {
			"default" => [
				:start,
				:stop,
				:restart,
				:status
			]
		}
	)

	action :enable
end

template "/etc/default/beanstalkd" do
	source "beanstalkd.erb"
	owner "root"
	group "root"
	mode 0640
	variables(
		:daemon_opts => node['beanstalk']['daemon_opts'],
		:start_during_boot => node['beanstalk']['start_during_boot']
	)
end