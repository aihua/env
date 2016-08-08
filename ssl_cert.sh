#!/bin/sh

# self-signed
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx.key -out /etc/nginx/ssl/nginx.crt

# certificate request for WoSign
open genrsa -aes256 -out www.mydomain.com.key 2048
openssl req –new –key www.mydomain.com.key –out www.mydomain.com.csr

# remove a passphrase from a key for Nginx
# 1) standalone key file
openssl rsa -in original.key -out unencripted.key

# 2) private key and public certificate stored in the same file
openssl rsa -in mycert.pem -out newcert.pem
openssl x509 -in mycert.pem >>newcert.pem

