# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.box = "TutoRails"
  config.vm.box = "ubuntu/trusty64"
  config.vm.network "forwarded_port", guest: 3000, host: 3000
  config.vm.synced_folder ".", "/home/vagrant/tuto_rails"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  config.vm.provision "shell", inline: <<-SHELL

    sudo apt-get update
    sudo apt-get install -y make ruby-full ruby-dev git libsqlite3-dev sqlite3 build-essential g++ libssl-dev
    sudo apt-get install -y libreadline-dev
    sudo apt-get install libreadline6 libreadline6-dev
    
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password toor'
    sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password toor'
    sudo apt-get install -y mysql-server libmysqlclient-dev
    
    # cd /home/vagrant 
    # curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
    # export RBENV_ROOT="${HOME}/.rbenv" >> /home/vagrant/.bashrc
    # if [ -d "${RBENV_ROOT}" ]; then >> /home/vagrant/.bashrc
    #   export PATH="${RBENV_ROOT}/bin:${PATH}" >> /home/vagrant/.bashrc
    #   eval "$(rbenv init -)" >> /home/vagrant/.bashrc
    # fi >> /home/vagrant/.bashrc
    # source /home/vagrant/.bashrc

    # rbenv install `cat /home/vagrant/tuto_rails/.ruby-version`
    # gem install bundler
    # cd /home/vagrant/tuto-rails
    # bundle install
  SHELL
end
