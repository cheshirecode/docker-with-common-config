#!/bin/bash
sudo apt-get purge -y docker-engine docker docker.io docker-ce
sudo apt-get autoremove -y --purge docker-engine docker docker.io docker-ce
sudo rm -rf /var/lib/docker
sudo rm /etc/apparmor.d/docker
sudo groupdel docker
sudo rm -rf /var/run/docker.sock
sudo apt-get update;
sudo apt-get -y install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";
sudo apt-get -y install docker-ce=17.12.0~ce-0~ubuntu
sudo usermod -aG docker `whoami`
# enable swap resource limiting
sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)"/\1cgroup_enable=memory swapaccount=1"/' /etc/default/grub;
sudo update-grub;
sudo apt autoremove -y;