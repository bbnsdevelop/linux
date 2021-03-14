#!/bin/bash

"""
  Esse arquivo faz a instalação
  de forma automática em sistemas
  Disto baseada no Debian

  Modificado em 19 de fevereiro de 2020
  por Bruno (bbnsdevelop@gmail.com)
"""

sudo apt-get update

# remove previously installed Docker
sudo apt-get remove docker docker-engine docker.io
# install dependencies 4 cert
sudo apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common
# add Docker repo gpg key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
echo 'deb [arch=amd64] https://download.docker.com/linux/debian buster stable' | sudo tee /etc/apt/sources.list.d/docker.list
sudo apt-get update
# install Docker
sudo apt-get install docker-ce
# run Hellow World image
sudo docker run hello-world
# manage Docker as a non-root user
sudo groupadd docker
sudo usermod -aG docker $USER
# configure Docker to start on boot
sudo systemctl start docker
sudo systemctl enable docker
