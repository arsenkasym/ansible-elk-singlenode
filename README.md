# ansible-elk
Deploy ELK-stack in single node with ansible

1. Clone this repository
   git remote set-url origin git@github.com:arsenkasym/ansible-elk.git
2. Run playbook
   ansible-playbook -i hosts.ini playbook.yml -e "elastic_address=change to your address"
3. Go to URL https://(your address):5601

Login for elastic: elastic
Password: elastic
