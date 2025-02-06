#!/bin/bash

# Выполняем команду сброса пароля и сохраняем новый пароль в переменную


#!/bin/bash

Elastic_PASSWORD="elastic"
Kibana_PASSWORD="kibana"


echo -e "y\n$Elastic_PASSWORD\n$Elastic_PASSWORD" | sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u elastic  -i
echo -e "y\n$Kibana_PASSWORD\n$Kibana_PASSWORD" | sudo /usr/share/elasticsearch/bin/elasticsearch-reset-password -u kibana_system  -i
