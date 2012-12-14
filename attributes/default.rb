#
# Cookbook Name:: beanstalkd
# Attributes:: default
#
# Copyright 2012, Escape Studios
#

default[:beanstalkd][:opts] = {}

#Ubuntu only
default[:beanstalkd][:start_during_boot] = false