[![Build Status](https://secure.travis-ci.org/escapestudios/chef-beanstalkd.png)](http://travis-ci.org/escapestudios/chef-beanstalkd)
Description
===========

This cookbook provides an easy way to install beanstalkd: a fast, general-purpose work queue.

More information?
http://kr.github.com/beanstalkd/

Requirements
============

## Cookbooks:

This cookbook doesn't have direct dependencies on other cookbooks.

## Platforms:

* Ubuntu
* Debian
* RHEL
* CentOS
* Fedora
* Scientific
* Amazon

Attributes
==========

* `node[:beanstalkd][:opts]` - The opts array value, defaults to {}
* `node[:beanstalkd][:start_during_boot]` - The start during boot value, defaults to false (beanstalkd on Ubuntu only)

Usage
=====

1) include `recipe[beanstalkd]` in a run list
2) tweak the attributes via attributes/default.rb
	--- OR ---
	override the attribute on a higher level (http://wiki.opscode.com/display/chef/Attributes#Attributes-AttributesPrecedence)

Example
=======

* override_attributes(
	"beanstalkd" => {
	    start_during_boot: true,
	    opts: {
	    	l: '10.0.1.5', #-l <addr>, listen on address <addr>
	        p: '12345', #-p <port>, listen on TCP port <port>
	        b: '/path/to/binlog', #-b <dir>, use a binlog to keep jobs on persistent storage in <dir>
	        #see 'man beanstalkd' for more options
	 	}
	}
)

References
==========

* [beanstalkd home page] (http://kr.github.com/beanstalkd/)

License and Authors
===================

Author: David Joos <david@escapestudios.com>
Author: Escape Studios Development <dev@escapestudios.com>
Copyright: 2012-2013, Escape Studios

Unless otherwise noted, all files are released under the MIT license,
possible exceptions will contain licensing information in them.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.