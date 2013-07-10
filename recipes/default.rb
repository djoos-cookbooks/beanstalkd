#
# Cookbook Name:: beanstalkd
# Recipe:: default
#
# Copyright 2012-2013, Escape Studios
#

package "beanstalkd" do
  action :upgrade if node["beanstalkd"]["upgrade"]
end

case node["platform_family"]
when "debian"
  template "beanstalkd default file" do
    source "beanstalkd.default.erb"
    path "/etc/default/beanstalkd"
    owner "root"
    group "root"
    mode 0640
    variables(
      :opts => node["beanstalkd"]["opts"],
      :start_during_boot => node["beanstalkd"]["start_during_boot"]
    )
  end
when "rhel"
  template "beanstalkd sysconfig file" do
    source "beanstalkd.sysconfig.erb"
    path "/etc/sysconfig/beanstalkd"
    owner "root"
    group "root"
    mode 0640
    variables(
      :opts => node["beanstalkd"]["opts"]
    )
    notifies :restart, "service[beanstalkd]"
  end
end

service "beanstalkd" do
  start_command "/etc/init.d/beanstalkd start"
  stop_command "/etc/init.d/beanstalkd stop"
  status_command "/etc/init.d/beanstalkd status"
  supports [:start, :stop, :status]
  #starts the service if it's not running and enables it to start at system boot time
  action [:enable, :start]
end
