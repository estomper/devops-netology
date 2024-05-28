# non-interactive and 10 years expiration
openssl req -x509 -newkey rsa:4096 -keyout ./cer/key.pem -out ./cer/cert.pem -sha256 -days 3650 -nodes -subj "/C=RU/ST=PRM/L=Perm/O=Netology/OU=Netology/CN=alex-2024-05-14"


openssl req -x509 -newkey rsa:4096 -keyout ./cer/key.pem -out ./cer/cert.pem -sha256 -days 3650 -nodes -subj "/C=RU/ST=PRM/L=Perm/O=Netology/OU=Netology/CN=alex-2024-05-14" -addext "subjectAltName = DNS: alex-2024-05-14"

openssl req -x509 -newkey rsa:4096 -keyout ./cer/key.pem -out ./cer/cert.pem -sha256 -days 3650 -nodes -subj "/C=RU/ST=PRM/L=Perm/O=Netology/OU=Netology/CN=alex-2024-05-14.website.yandexcloud.net" -addext "subjectAltName = DNS:alex-2024-05-14,DNS:*.yandexcloud.net,DNS:alex-2024-05-14.website.yandexcloud.net"


openssl req -x509 -newkey rsa:4096 -keyout ./cer/key.pem -out ./cer/cert.pem -sha256 -days 3650 -nodes -subj "/C=RU/ST=PRM/L=Perm/O=Netology/OU=Netology/CN=netology.alex.com" -addext "subjectAltName = DNS:netology.alex.com"

https://alex-2024-05-14.storage.yandexcloud.net/index.html


openssl req -x509 -newkey rsa:4096 -nodes \
  -keyout ./cerkey.pem \
  -out ./cercert.pem \
  -days 365 \
  -subj '/CN=alex-2024-05-14' \
  -addext 'subjectAltName = DNS:alex-2024-05-14.website.yandexcloud.net'


openssl req -x509 -newkey rsa:4096 -nodes \
  -keyout ./cerkey.pem \
  -out ./cercert.pem \
  -days 365 \
  -subj '/CN=alex-2024-05-14.website.yandexcloud.net' \
  -addext 'subjectAltName = DNS:alex-2024-05-14'
