#!/usr/bin/env bash
# Generate selfsigned certs for *.TLSDOMAIN

# always start in script's directory, exit if fails
cd "${0%/*}" || exit 1

# get TLSDOMAIN from env
source .env

if [ ! -f ./selfsigned.key ] || [ ! -f ./selfsigned.crt ]; then
  openssl req -x509 -newkey rsa:4096 -keyout ./docker/nginx/certs/origin.key -out ./docker/nginx/certs/origin.crt -sha256 -days 3650 -nodes -subj "/C=EE/ST=Torgu Kuningriik/L=Torgu vald/O=Iseallkirjastuv Sertifitseerimisasutus/OU=Fiktiivsete dokumentide valmendamise osakond/CN=*.$TLSDOMAIN" -addext "subjectAltName=DNS:$TLSDOMAIN"
  echo "Generated origin cert in ./docker/nginx/certs/"
  openssl x509 -in ./docker/nginx/certs/origin.crt -text -noout
  chmod 0644 ./docker/nginx/certs/*.*
fi