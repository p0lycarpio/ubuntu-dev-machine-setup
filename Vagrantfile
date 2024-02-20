Vagrant.require_version ">= 1.8.0"

Vagrant.configure(2) do |config|

  # Ubuntu
  config.vm.define "ubuntu" do |ubuntu|
    ubuntu.vm.box = "ubuntu/jammy64"
  end

  # Fedora
  config.vm.define "fedora" do |fedora|
    fedora.vm.box = "fedora/39-cloud-base"
  end

  config.vm.provision "ansible_local" do |ansible|
    ansible.verbose = "v"
    ansible.playbook = "main.yml"
    ansible.galaxy_role_file = "requirements.yml"
    ansible.galaxy_roles_path = "/etc/ansible/roles"
    ansible.galaxy_command = "sudo ansible-galaxy install --role-file=%{role_file} --roles-path=%{roles_path} --force"
  end
    
  config.vm.provider :virtualbox do |v| 
    v.memory = 2048
    v.cpus = 2
  end
end