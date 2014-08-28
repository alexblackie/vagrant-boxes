#!/bin/bash

logfile=/vagrant/provision.log

log() {
  $@ >> $logfile 2>&1
}

if hash ruby >/dev/null 2>&1; then
  echo "Ruby detected! Please destroy the VM before rebuilding."
  exit 1
else
  cat /dev/null > $logfile

  log sudo yum install -y git
  log git clone https://github.com/postmodern/ruby-install.git ~/.ruby-install
  log ~/.ruby-install/bin/ruby-install jruby 1.7.13
  echo 'PATH=$HOME/.rubies/jruby-1.7.13/bin:$PATH' >> ~/.bashrc

  echo 'cd /vagrant' >> ~/.bashrc
fi
