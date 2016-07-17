# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "icalvete/ubuntu-14.04-64-puppet"
  config.vm.box_version = "<= 0.0.1"
  config.vm.hostname = "ror"

  config.vm.provision :shell do |shell|
    shell.path = "https://raw.githubusercontent.com/icalvete/vagrant-ror-box/master/installing_ruby_on_rails_ubuntu_trusty.sh"
    shell.privileged = false
  end

  config.vm.provider :virtualbox do |vb|
    # Don't boot with headless mode
    #vb.gui = true
    #
    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "1024"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.name = "ror"
  end
end
