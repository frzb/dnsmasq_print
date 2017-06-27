Vagrant.configure(2) do |config|

  config.vm.box = "bento/ubuntu-16.04"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "dhcpclient"
    config.vm.network "private_network", ip: "192.168.57.2",
      auto_config: false
  end
end


