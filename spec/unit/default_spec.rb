require 'spec_helper'

describe 'beanstalkd::default' do
	let(:chef_run) { 
		ChefSpec::Runner.new.converge(described_recipe)
	 }

	 it 'should upgrade the beanstalkd' do 
	 	expect(chef_run).to upgrade_package('beanstalkd')
	 end

	 it 'should deploy the beanstalkd template' do 
	 	expect(chef_run).to create_template('/etc/sysconfig/beanstalkd').with(user: 'root')

	 end

	 it 'must enable the beanstalkd service' do 
	 	expect(chef_run).to enable_service('beanstalkd')
	 end

	 it 'should start the beanstalkd service' do 
	 	expect(chef_run).to start_service('beanstalkd')
	 end
end
