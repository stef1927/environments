Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  #config.vm.provision :shell, :path => "bootstrap.sh"
  config.vm.network :forwarded_port, host: 8989, guest: 80
  config.vm.synced_folder "../../../Users/Stefi/Documents/GitHub", "/src"
  config.vm.provider "virtualbox" do |v|
  	v.name = "Ubuntu VM"
    v.gui = false
  end
end