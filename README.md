###  This is readme txt ###
---------------------------------------------------------------------------------------------------------------------------------------------------
### "Just Run" ###    

### bash <(curl -s https://raw.githubusercontent.com/Nick30806/Nginx_install/master/Nginx.sh) ###

#### We need install [Nginx] & [Geoip2]

#### yum install gcc gcc-c++ libtool zlib zlib-devel pcre pcre-devel openssl openssl-devel make unzip git wget lrzsz vim

#### wget https://http://nginx.org/download/nginx-1.17.3.tar.gz

#### tar -zxvf nginx-1.17.3.tar.gz

#### tar -xvf libmaxminddb-1.3.2.tar.gz

#### cd ~/libmaxminddb-1.3.2

#### ./configure

#### make

#### make install

#### sh -c "echo /usr/local/lib >> /etc/ld.so.conf.d/ local.conf"

#### cd

#### git clone https://github.com.leev/nginx_http_geoip2_module.git

#### mv ngx_http_geoip2_module /usr/local/src

#### mkdir /nsr/local/Geoip2/

#### cd ~/nginx-1.17.3

#### ./configure --prefix=/usr/local/nginx --with-http_ssl_ssl_module --with-http_realip_module --with-http_stub_status_module --with-stream --add-module=/usr/local/src/ngx_http_geoip2_module/

#### make

#### make install

#### rm -rf /usr/local/nginx/conf/nginx.conf

#### git clone https://github.com/****/****

#### mv nginx.conf/nginx.conf /usr/local/nginx/conf/

#### mv nginx.cong/Geo* /usr/local/Geoip2/

#### mkdur /usr/local/nginx/ssl

#### mkdir /usr/local/nginx/vhosts

#### systemctl restart firewalld

#### chkconfig /usr/local/nginx/sbin/nginx

#### firewall-cmd --zone=public --add-port=80/tcp --permanent

#### firewall-cmd --zone=public --add-port=443/tcp --permanent

#### firewall-cmd --zone=public --add-port=8080/tcp --permanent

#### firewall-cmd --add-rich-rule="rule family="ipv4" source address="XX.XX.XX.XX" service name ="ssh accept" --permanent

#### ln /usr/local/nginx/sbin/nginx /usr/local/bin/nginx

#### sbin/ldconfig

#### E n d ####
