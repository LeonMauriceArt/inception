apt-get update -y
apt-get install nginx -y
mkdir -p /etc/nginx/ssl
apt-get install openssl -y
openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=lmaurin-.42.fr/UID=lmaurin-" 
mkdir -p /var/run/nginx