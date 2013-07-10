case node["platform"]
when "ubuntu"
  apt_repository "beanstalkd" do
    uri "http://ppa.launchpad.net/jernej/beanstalkd/ubuntu"
    distribution node['lsb']['codename']
    components ["main"]
    keyserver "keyserver.ubuntu.com"
    key "422D2977"
  end
end
