#!/bin/bash

#CA cert
HOST_IP=$(hostname -I | awk '{print $1}')

echo -e "\n\n" | sudo /usr/share/elasticsearch/bin/elasticsearch-certutil ca

#HTTPS KIBANA

echo -e "\n" | sudo /usr/share/elasticsearch/bin/elasticsearch-certutil csr -name kibana-server --dns $HOSTNAME --ip $HOST_IP

unzip /usr/share/elasticsearch/csr-bundle.zip -d /etc/kibana/certs/

openssl pkcs12 -in /usr/share/elasticsearch/elastic-stack-ca.p12 -out /usr/share/elasticsearch/elastic-stack-ca.crt -clcerts -nokeys -passin pass:

openssl pkcs12 -in /usr/share/elasticsearch/elastic-stack-ca.p12 -out /usr/share/elasticsearch/elastic-stack-ca.key -nocerts -nodes -passin pass:

openssl x509 -req -in /etc/kibana/certs/kibana-server/kibana-server.csr -CA /usr/share/elasticsearch/elastic-stack-ca.crt -CAkey /usr/share/elasticsearch/elastic-stack-ca.key  -CAcreateserial -days 1800 -out /etc/kibana/certs/kibana-server/kibana-server.crt
