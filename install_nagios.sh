#!/bin/bash
yum update -y
sudo yum install httpd php php-cli gcc glibc glibc-common gd gd-devel net-snmp openssl-devel wget -y
sudo yum install make gettext autoconf net-snmp-utils epel-release perl-Net-SNMP postfix unzip automake -y
echo "done prerequiests" > ~/install.log
cd /usr/src/
sudo wget https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.2.tar.gz
echo "downloaded nagios" >> ~/install.log
sudo tar zxf nagios-*.tar.gz
ls
cd nagioscore-nagios-*/
sudo ./configure
sudo make all
sudo make install-groups-users
sudo usermod -a -G nagios apache
echo "added nagios and apache user" >> ~/install.log
sudo make install
sudo make install-commandmode
sudo make install-config
sudo make install-webconf
sudo make install-daemoninit
echo "done make install" >> ~/install.log
