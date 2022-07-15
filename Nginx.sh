#!/bin/bash
yum install -y gcc gcc-c++ make libtool zlib zlib-devel pcre pcre-devel openssl openssl-devel wget vim unzip git lrzsz
wget https://nginx.org/download/nginx-1.22.0.tar.gz
wget https://github.com/maxmind/libmaxminddb/releases/download/1.3.2/libmaxminddb-1.3.2.tar.gz
tar -zxvf nginx-1.22.0.tar.gz
tar -xvf libmaxminddb-1.3.2.tar.gz
cd ~/libmaxminddb-1.3.2
./configure
make    
make install 
sh -c "echo /usr/local/lib  >> /etc/ld.so.conf.d/local.conf"
cd 
git clone https://github.com/leev/ngx_http_geoip2_module.git
mv ngx_http_geoip2_module /usr/local/src/
mkdir /usr/local/Geoip2/
cd ~/nginx-1.22.0
./configure --prefix=/usr/local/nginx --with-http_ssl_module --with-http_realip_module  --with-http_stub_status_module --with-stream  --add-module=/usr/local/src/ngx_http_geoip2_module/
make
make install
rm -rf  /usr/local/nginx/conf/nginx.conf
git clone https://github.com/Nick30806/Nginx-Geoip2.git
mv Nginx-Geoip2/nginx.conf /usr/local/nginx/conf/
mv Nginx-Geoip2/Geo* /usr/local/Geoip2/
sed -i 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
mkdir /usr/local/nginx/ssl
mkdir /usr/local/nginx/vhosts
systemctl restart firewalld
chkconfig /usr/local/nginx/sbin/nginx
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --zone=public --add-port=8080/tcp --permanent
firewall-cmd --add-rich-rule="rule family="ipv4" source address="61.220.250.0/24" service name="ssh" accept" --permanent
ln /usr/local/nginx/sbin/nginx /usr/local/bin/nginx
/sbin/ldconfig
