# -*- mode: ruby -*-
# vi: set ft=ruby :

update = <<SCRIPT
if [ ! -f /tmp/up ]; then
  sudo sed -i.bak s/us.archive/il.archive/g /etc/apt/sources.list
  sudo aptitude update 
  touch /tmp/up
fi
SCRIPT


Vagrant.configure("2") do |config|

  config.vm.define :grafana do |node|
    bridge = ENV['VAGRANT_BRIDGE']
    bridge ||= 'eth0'

    env  = ENV['PUPPET_ENV']
    env ||= 'dev'

    node.vm.box = 'ubuntu-14.10_puppet-3.7.3' 
    
    node.vm.provider :virtualbox do |vb,override|
	vb.customize ['modifyvm', :id, '--memory', 2048, '--cpus', 2]
	override.vm.network :public_network, :bridge => bridge
	override.vm.network :private_network, ip: '192.168.1.25'
	override.vm.hostname = 'grafana.local'
    end

    node.vm.provider :libvirt do |domain,override|
      override.vm.network :public_network, :dev => "eth0", :mode => 'bridge'
	domain.uri = 'qemu+unix:///system'
	domain.host = 'grafana.local'
	domain.memory = 2048
	domain.cpus = 2
    end

    node.vm.provision :shell, :inline => update
    node.vm.provision :puppet do |puppet|
	puppet.manifests_path = 'manifests'
	puppet.manifest_file  = 'default.pp'
	puppet.options = "--modulepath=/vagrant/modules:/vagrant/static-modules --hiera_config /vagrant/hiera_vagrant.yaml --environment=#{env}"

    end
  end

end
