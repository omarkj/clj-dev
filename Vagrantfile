# -*- mode: ruby -*-

# Dir to sync to the Virtualbox
SYNC = [["#{ENV['CLJ_SYNC']}", "/home/vagrant/synced"]]

Vagrant.configure("2") do |config|
  config.vm.box = "chef/ubuntu-14.04"
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

  # Setup ssh forwarding for repos
  config.ssh.forward_agent = true
  config.omnibus.chef_version = :latest
  config.berkshelf.enabled = true

  # Setup sync dirs
  SYNC.each do |dir|
    config.vm.synced_folder(dir.first, dir.last)
  end

  # Run chef solo
  config.vm.provision :chef_solo do |chef|
    chef.log_level = "debug"
    chef.add_recipe("apt::default")
    chef.add_recipe("java::default")
    chef.add_recipe("clojure::default")
    chef.json = {
      "java" => {
        "install_flavor" => "oracle",
        "jdk_version" => "7",
        "oracle" => {
          "accept_oracle_download_terms" => true
        }
      },
      "apt" => {
        "compile_time_update" => true
      }
    }
  end

end
