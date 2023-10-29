include .env

ssh-keygen:
	ssh-keygen -t ed25519 -C "ansible"

ssh-copy-id:
	ssh-copy-id -i ~/.ssh/ansible.pub ${nameserver}

ssh:
	ssh -i ~/.ssh/ansible ${nameserver}

