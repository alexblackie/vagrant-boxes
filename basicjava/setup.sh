#!/bin/bash

if hash java >/dev/null 2>&1; then
  echo "Java already installed! Please destroy VM first."
  exit 1
else
  sudo yum install -y java-1.7.0-openjdk maven
  echo "cd /vagrant" >> ~/.bashrc
fi
