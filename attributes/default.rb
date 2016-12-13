#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright (c) 2016, David Joos
#

default['beanstalkd']['opts'] = {
	:p => '11300',
 	 :l => '127.0.0.1'
}

# Ubuntu only
default['beanstalkd']['start_during_boot'] = false
