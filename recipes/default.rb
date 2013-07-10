#
# Cookbook Name:: beanstalkd
# Recipe:: default
#
# Copyright 2012-2013, Escape Studios
#

include_recipe "beanstalkd::repo" if node["beanstalkd"]["repo"]
include_recipe "beanstalkd::install"
include_recipe "beanstalkd::conf"
include_recipe "beanstalkd::service"
