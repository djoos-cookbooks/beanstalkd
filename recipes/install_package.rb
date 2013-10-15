package "beanstalkd" do
  action :upgrade if node["beanstalkd"]["upgrade"]
end
