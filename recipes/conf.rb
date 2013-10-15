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
