include .env

ssh-keygen:
	ssh-keygen -t ed25519 -C "ansible"

ssh-copy-id:
	ssh-copy-id -i ~/.ssh/ansible.pub ${nameserver}

ssh:
	ssh -i ~/.ssh/ansible ${nameserver}

ping:
	ansible all -m ping

apt-update:
	ansible all -m apt -a update_cache=true --become --ask-become-pass

apt-sl:
	ansible all -m apt -a name=sl --become --ask-become-pass

apt-upgrade:
	ansible all -m apt -a "upgrade=dist" --become --ask-become-pass

install-apache:
	ansible-playbook --ask-become-pass playbooks/install_apache.yml

run-site:
	ansible-playbook --ask-become-pass playbooks/site.yml
