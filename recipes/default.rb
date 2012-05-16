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