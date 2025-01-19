#!/bin/bash
# Install Ansible
apt-get update && apt-get install -y ansible
# Clone your Ansible repository
git clone https://github.com/thomas-mauran/openstack-tf.git /etc/ansible
# Run your initial Ansible playbook
ansible-playbook /etc/ansible/ansible/playbook.yml