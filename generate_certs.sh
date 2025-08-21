#!/usr/bin/env bash
# Generate selfsigned certs for *.SERVERNAME

# always start in script's directory, exit if fails
cd "${0%/*}" || exit 1

# get SERVERNAME from env
source .env

if [ ! -f ./docker/nginx/certs/origin.key ] || [ ! -f ./docker/nginx/certs/origin.crt ]; then
  openssl req -x509 -newkey rsa:4096 -keyout ./docker/nginx/certs/origin.key -out ./docker/nginx/certs/origin.crt -sha256 -days 3650 -nodes -subj "/C=EE/ST=Torgu Kuningriik/L=Torgu vald/O=Iseallkirjastuv Sertifitseerimisasutus/OU=Fiktiivsete dokumentide valmendamise osakond/CN=*.$SERVERNAME" -addext "subjectAltName=DNS:$SERVERNAME"
  echo "Generated origin cert in ./docker/nginx/certs/"
  openssl x509 -in ./docker/nginx/certs/origin.crt -text -noout
  chmod 0644 ./docker/nginx/certs/origin.*
fi
