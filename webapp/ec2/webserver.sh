#!/bin/bash

#update the package
sudo yum update -y
#install apache web server 
sudo yum install httpd -y
sudo systemctl start httpd  
sudo systemctl enable httpd
#configure firewall
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --reload
#webpage
sudo chmod 777 /var/www/html
echo "This is a web server" | sudo tee /var/www/html/index.html

#mounting additional volume
sudo mkfs.ext4  /dev/xvdf
sudo mkdir -p /var/log
sudo mount /dev/xvdf /var/log
sudo echo "$(blkid -o export /dev/xvdf | grep ^UUID=) /var/log xfs defaults,nofail 0 2" | sudo tee /etc/fstab
