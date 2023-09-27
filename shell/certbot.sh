#/bin/sh

domain=$1

docker run -it --rm --name certbot \
           -v "/tmp:/etc/letsencrypt" \
           -v "/var/lib/letsencrypt:/var/lib/letsencrypt" \
           certbot/certbot certonly  \
           --manual --preferred-challenges dns \
           -d "${domain}" -d "*.${domain}" 
