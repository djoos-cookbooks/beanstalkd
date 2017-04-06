#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright (c) 2016, David Joos
#

default['beanstalkd']['opts'] = {}

# Ubuntu only
default['beanstalkd']['start_during_boot'] = false

default['beanstalkd']['listen_addr'] = '127.0.0.1'

