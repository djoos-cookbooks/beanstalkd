#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright 2012-2014, Escape Studios
#

default[:beanstalkd][:opts] = {
  :p => '11300',
  :l => '127.0.0.1'
}

# Debian Only
default[:beanstalkd][:start_during_boot] = false
