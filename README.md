# Boilerplate Ansible template

## Introduction

This repository contains a simple template for Ansible that can be used when creating a new Ansible project.
It contains the initial files that need to be created in order to connect and run ad-hoc commands.

## Setup Instructions

The first thing to do in order to establish a connection with your different remote machines is to create an SSH key.
Ansible is connecting to the different machines using SSH. It is necessary to have a dedicated SSH key (public + private key) to perform any action related to Ansible.

### Setup SSH

#### Generate SSH key

To generate an SSH key, run the following command:

```sh
ssh-keygen -t ed25519 -C "ansible"
```

When prompted for a name for the public and private key, enter the name `~/.ssh/ansible`.

ED25519 SSH keys are recommended to use when possible, as they can be held in one single line, and perform very well.


#### Copy SSH key

Once the SSH public and private keys have been generated, the public key `ansible.pub` needs to be copied on each remote machine that Ansible needs to connect to.

You can copy the public key on each machine, using the following command:
```sh
ssh-copy-id -i ~/.ssh/ansible.pub <MACHINE-IP-ADDRESS>
```

Once the public key is copied, you should be able to see it under the file `~/.ssh/authorized_keys` on each machine it was copied into.

#### Test SSH connection

After having the public key copied in all your remote machine, you can test if the SSH key can be established. Run the command below to connect to the machine with your SSH key:

```sh
ssh -i ~/.ssh/ansible <MACHINE-IP-ADDRESS>
```

### Setup inventory

In the file called `inventory`, enter the list of IP addresses of your machine (one IP address per row).

In the file `ansible.cfg`, edit it accordingly if your inventory file has a different name, or if your privake SSH key has a different name that the one defined in this file.

You can test if Ansible is able to connect to your machines, based on your configuration values in `ansible.cfg`, with the `ping` module:

```sh
ansible all -m ping
```

