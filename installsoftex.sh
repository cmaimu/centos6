#!/bin/bash

#Install Softether Centos:
#Link Download:

#link dl aplikasi manager: //www.softether-download.com/en.aspx?product=softether
#link cara penggunaan: http://vpsmurahmeriah.blogspot.com/2013/10/cara-instal-softether-vpn-server-centos.html

#update & install development tools
yum update
yum groupinstall "Development Tools"

#install gcc & libpcap
yum -y install gcc*
yum -y install libpcap*

echo -n "Versi berapa (1.32bit 2.64bit)? "
read versi

#download,extract dan jalankan

#Download file
if [ "$versi" == 1 ]
then
#echo "Versi 32 bit"
wget http://www.softether-download.com/files/softether/v2.00-9387-rtm-2013.09.16-tree/Linux/SoftEther%20VPN%20Server/32bit%20-%20Intel%20x86/softether-vpnserver-v2.00-9387-rtm-2013.09.16-linux-x86-32bit.tar.gz
tar zxvf softether-vpnserver-v2.00-9387-rtm-2013.09.16-linux-x86-32bit.tar.gz
elif [ "$versi" == 2 ]
then
#echo "versi debian 64 bit"
wget http://www.softether-download.com/files/softether/v2.00-9387-rtm-2013.09.16-tree/Linux/SoftEther%20VPN%20Server/64bit%20-%20Intel%20x64%20or%20AMD64/softether-vpnserver-v2.00-9387-rtm-2013.09.16-linux-x64-64bit.tar.gz
tar zxvf softether-vpnserver-v2.00-9387-rtm-2013.09.16-linux-x64-64bit.tar.gz
fi

cd ..
mv vpnserver /usr/local
cd /usr/local/vpnserver/
chmod 600 *
chmod 700 vpncmd
chmod 700 vpnserver

wget -O /etc/init.d/vpnserver "https://raw.githubusercontent.com/cmaimu/centos6/master/vpnserver"

chmod 755 /etc/init.d/vpnserver
/sbin/chkconfig --add vpnserver
/etc/init.d/vpnserver start

cd
wget https://raw.githubusercontent.com/cmaimu/centos6/master/gantipasssoftex.cmd
cd
cd /usr/local/vpnserver
./vpncmd

cd
echo "Untuk cara ganti pass, silahkan ketik: cat gantipasssoftex.cmd"
