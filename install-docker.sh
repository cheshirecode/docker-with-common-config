#!/bin/bash
sudo apt-get remove docker docker-engine docker.io docker-ce;
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common;
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable";
sudo apt-get update;
sudo apt-get install -y docker-ce=17.12.0~ce-0~ubuntu;
# enable swap resource limiting
sudo sed -i 's/\(GRUB_CMDLINE_LINUX_DEFAULT="\)"/\1cgroup_enable=memory swapaccount=1"/' /etc/default/grub;
sudo update-grub;
sudo apt autoremove;