Vagrant.configure("2") do |config|
  config.vm.box = "focal-server"


#  config.vm.define "app01" do |app|
#    app.vm.hostname = "app01"
#    app.vm.network "private_network", ip: "192.168.56.11"
#    app.vm.provision "shell", path: "provision/app01.sh"
#  end

  config.vm.define "mon01" do |mon|
    mon.vm.hostname = "mon01"
    mon.vm.network "private_network", ip: "192.168.56.12"
    mon.vm.provision "shell", path: "provision/mon01.sh"
  end

#  config.vm.define "prom01" do |prom|
#    prom.vm.hostname = "prom01"
#    prom.vm.network "private_network", ip: "192.168.56.13"
#    prom.vm.provision "shell", path: "provision/prom01.sh"
#  end
end

 