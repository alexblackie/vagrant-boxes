#!/bin/bash

set -e

cat /dev/null > /vagrant/provision.log

run() {
  $@ >> /vagrant/provision.log 2>&1
}

# Deps
echo "Installing Dependencies..."
run sudo yum install -y unzip curl
run mkdir /home/vagrant/bin

# Erlang
echo "Installing Erlang..."
run curl -Lo erlang.rpm http://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_17.1-1~centos~6_amd64.rpm
run sudo yum install -y erlang.rpm

# Elixir
echo "Installing Elixir..."
run curl -Lo elixir.zip https://github.com/elixir-lang/elixir/releases/download/v1.0.0/Precompiled.zip
run unzip -d/home/vagrant/bin/elixir elixir.zip

# Configure
echo 'export PATH=$HOME/bin/elixir/bin:$PATH' >> /home/vagrant/.bashrc

# Done!
echo "Complete!"
