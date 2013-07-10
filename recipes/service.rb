service "beanstalkd" do
  supports :status => true
  #starts the service if it's not running and enables it to start at system boot time
  action [:enable, :start]
end
