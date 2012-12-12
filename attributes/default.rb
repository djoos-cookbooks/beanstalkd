#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright 2012, Escape Studios
#

default['beanstalkd']['listen_addr'] = '0.0.0.0'
default['beanstalkd']['listen_port'] = '11300'
default['beanstalkd']['user'] = 'beanstalkd'
default['beanstalkd']['start_during_boot'] = false