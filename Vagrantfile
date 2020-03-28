# -*- mode: ruby -*-
# vi: set ft=ruby :

# Documentation: https://www.vagrantup.com/docs/vagrantfile/machine_settings.html

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "kalilinux/rolling"

  # Create a private network, which allows host-only access to the machine
    config.vm.network "private_network", :type => 'dhcp', :name => 'vboxnet0', :adapter => 2

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "./tmp", "/mnt/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
      vb.gui = true
      vb.memory = "2048"
      vb.cpus = 2
      vb.name = "EIS-Kali-Training-Platform-64bit-1.0.10"

      # Find settings with VBoxManage showvminfo <vmname> or https://www.virtualbox.org/manual/ch08.html under section for modifyvm
      vb.customize ["modifyvm", :id, "--clipboard-mode", "bidirectional"]
      vb.customize ["modifyvm", :id, "--vram", "128"]
      vb.customize ["modifyvm", :id, "--description", "
EIS Training Platform based on Kali Rolling (2018.3) x64
2018-08-21
- - - - - - - - - - - - - - - - - -
Minimal Requirements: VT-X enabled BIOS, multicore 64-bit processor, 4 GB RAM, 80 GB Free Disk Space
Helpful: 8 GB RAM, SSD hard-drive
- - - - - - - - - - - - - - - - - -
Username: root
Password: mutillidae
- - - - - - - - - - - - - - - - - -
* Mutillidae GitHub
https://github.com/webpwnized/mutillidae

* Mutillidae Video Tutorials
https://www.youtube.com/user/webpwnized"]


  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end