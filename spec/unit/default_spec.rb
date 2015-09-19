require 'spec_helper'

describe 'beanstalkd::default' do
  context 'When all attributes are default, on debian platform' do
    let(:chef_run) do
      ChefSpec::ServerRunner.new(:platform => 'ubuntu', :version => 14.04)
        .converge(described_recipe)
    end

    it 'installs beanstalkd package' do
      expect(chef_run).to upgrade_package('beanstalkd')
    end

    it 'creates /etc/default/beanstalkd.erb template' do
      expect(chef_run).to create_template('/etc/default/beanstalkd').with(
        :source => 'beanstalkd.erb',
        :owner  => 'root',
        :group  => 'root',
        :mode   => 0644
      )
    end

    it 'enables the beanstalkd service' do
      expect(chef_run).to enable_service('beanstalkd').with(
        :start_command  => '/etc/init.d/beanstalkd start',
        :stop_command   => '/etc/init.d/beanstalkd stop',
        :status_command => '/etc/init.d/beanstalkd status'
      )
    end

    it 'starts the beanstalkd service' do
      expect(chef_run).to start_service('beanstalkd').with(
        :start_command  => '/etc/init.d/beanstalkd start',
        :stop_command   => '/etc/init.d/beanstalkd stop',
        :status_command => '/etc/init.d/beanstalkd status'
      )
    end
  end

  let(:chef_run_other) do
    ChefSpec::ServerRunner.new(:platform => 'centos', :version => 7.0)
      .converge(described_recipe)
  end

  context 'When all attributes are default, on other linux platforms' do
    it 'creates /etc/sysconfig/beanstalkd.erb template' do
      expect(chef_run_other).to create_template('/etc/sysconfig/beanstalkd').with(
        :source => 'beanstalkd.erb',
        :owner  => 'root',
        :group  => 'root',
        :mode   => 0644
      )
    end
  end
end
