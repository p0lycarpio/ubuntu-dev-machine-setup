Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|

  config.vm.box = "ubuntu/jammy64"
  config.ssh.insert_key = false

  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "main.yml"
  end
    
  config.vm.provider :virtualbox do |v| 
    v.memory = 4096
    v.cpus = 2
  end
end