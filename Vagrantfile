Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 1
  end
  config.vm.provision :shell, path: "bootstrap.sh"
end