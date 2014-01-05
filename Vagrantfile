# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("1") do |config|

  config.vm.box = "nginx-standalone"
  config.vm.box_url = "/Volumes/ERIC_DATA/vagrant/templates/precise64.box"

  config.vm.define :ws do |ws_config|
    ws_config.vm.network :hostonly, "192.168.100.200"
    ws_config.vm.host_name = "ws.local"

    ws_config.vm.provision :chef_solo do |ws_chef|
      ws_chef.cookbooks_path = ["cookbook-nginx-standalone"]
      ws_chef.add_recipe "apt"
      ws_chef.add_recipe "build-essential"
      #ws_chef.add_recipe "nginx"
    end
  end
end

Vagrant.configure("2") do |config|
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  #config.vm.network :forwarded_port, guest: 80, host: 8000, auto_correct: true
  #config.vm.synced_folder "./shared", "/home/vagrant/host_shared"
end
