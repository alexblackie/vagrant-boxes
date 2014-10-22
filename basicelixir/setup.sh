#!/bin/bash

set -e

cat /dev/null > /vagrant/provision.log

run() {
  $@ >> /vagrant/provision.log 2>&1
}

# Deps
echo "Installing Dependencies..."
run sudo apt-get install -y unzip curl
run mkdir /home/vagrant/bin

# Erlang
echo "Installing Erlang..."
run curl -LO http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
run sudo dpkg -i erlang-solutions_1.0_all.deb
run sudo apt-get update
run sudo apt-get install -y erlang

# Elixir
echo "Installing Elixir..."
run curl -Lo elixir.zip https://github.com/elixir-lang/elixir/releases/download/v1.0.2/Precompiled.zip
run unzip -d /home/vagrant/bin/elixir elixir.zip

# Configure
echo 'export PATH=$HOME/bin/elixir/bin:$PATH' >> /home/vagrant/.bashrc

# Done!
echo "Complete!"
