#!/bin/bash
sudo systemctl restart httpd
sudo systemctl enable httpd
echo "started httpd" >> ~/install.log
yum install firewalld -y
systemctl start firewalld
sudo firewall-cmd --permanent --zone=public --add-service=http
systemctl status firewalld
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload
echo "firewall setup done" >> ~/install.log
cd /usr/src/
sudo wget -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
sudo tar zxf nagios-plugins.tar.gz
cd nagios-plugins-release-2.2.1
sudo ./tools/setup
sudo ./configure
sudo make
sudo make install
sudo systemctl start nagios
sudo systemctl status nagios
echo "Done============================"
exit 0
