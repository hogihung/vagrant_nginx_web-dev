Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/precise64"
  config.vm.hostname = "web-dev" 

  config.vm.provision "shell", path: "provision.sh"

  # Support for Nginx
  config.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx"

  # Support for Rails Server on the VM 
  config.vm.network "forwarded_port", guest: 3000, host: 3000, id: "rails-server"
end
