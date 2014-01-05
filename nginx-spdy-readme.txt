

/////
// useradd 
$ useradd --shell /usr/sbin/nologin www-data

////////
// openssl
$ sudo apt-get install libssl-dev openssl

or 

$ wget http://www.openssl.org/source/openssl-1.0.1e.tar.gz
$ tar -xzvf openssl-1.0.1e.tar.gz;

////////
// pcre
$ wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.32.tar.gz

///////
// nginx
$ wget http://nginx.org/download/nginx-1.3.15.tar.gz

/////////
// zlib
$ sudo apt-get install unzip
$ wget http://zlib.net/zlib128.zip
$ unzip zlib128.zip

//////////
// echo
$ wget https://github.com/agentzh/echo-nginx-module/archive/v0.45.zip;
$ unzip v0.45.zip;


///////////////////
// nginx configure
$ ./configure --with-pcre=../pcre-8.32 --with-http_ssl_module --with-http_spdy_module

or 

$ sudo ./configure --with-zlib=../zlib-1.2.8 --with-pcre=../pcre-8.32 --with-openssl=../openssl-1.0.1e --with-http_ssl_module --with-debug --add-module=../echo-nginx-module-0.45 --prefix=/usr/local/nginx --user=www-data --group=www-data

///////////////
// make
$ sudo make

///////////////////
// install
$ sudo make install


///////////////////
// nginx.conf

server {
    listen 443 spdy ssl;
    server_name  spdytest.com;
    ssl on;

        ssl_certificate /home/ubuntu/nginx/ssl/KEY.crt;
        ssl_certificate_key /home/ubuntu/nginx/ssl/KEY.key;
       
        ssl_session_timeout 5m;
        ssl_protocols SSLv2 SSLv3 TLSv1;
        ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv2:+EXP;
        ssl_prefer_server_ciphers on;

--> sample pem/key generate

$ sudo openssl req -newkey rsa:2048 -new -nodes -x509 -days 3650 -keyout key.pem -out cert.pem

/////////////////
// start
$ sudo /usr/local/nginx/sbin/nginx;

or 
$ sudo wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx;
$ sudo chmod +x /etc/init.d/nginx;

$ sudo update-rc.d -f nginx defaults

$ sudo service nginx stop/start/status


/////////////////////
// hosts -> Mac(host) or VM

$ sudo vi /etc/hosts
192.168.100.200 spdytest.com




