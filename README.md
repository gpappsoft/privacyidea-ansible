### Install privacyIDEA locally on bare-metal or VM with ansible using docker containers

Easy deploys a privacyIDEA stack with container from [privacyidea-docker](https://github.com/gpappsoft/privacyidea-docker/) project on an Ubuntu 22.04/24.04 VM or bare-metal.

#### Requirements

A fresh:
- Ubuntu 22.04/24.04 LTS base or minimal installation.
- User with sudo privileges

**Do not install the Ubuntu Docker snap-in. The ansible role will install Docker-CE from the official Docker repository.**

#### Setup

Download and copy ```install.sh``` from the release page to the target host and run the script:

```
chmod +x install.sh
sudo ./install.sh
```
or build and run your installer on the target host:
```
git clone https://github.com/gpappsoft/privacyidea-ansible.git
cd privacyidea-ansible
# create install.sh with PAYLOAD in /tmp
tar czvf /tmp/privacyidea.tgz privacyidea
cat install.sh /tmp/privacyidea.tgz > /tmp/install.sh
chmod +x /tmp/install.sh
sudo /tmp/installer.sh
```

#### privacyIDEA stack

The stack contains:
- privacyIDEA
- MariaDB Database
- Freeradius with privacyIDEA plugin
- NGINX as a reverse proxy
- OpenLDAP (optional)

Check ```container/environment.env``` file after installing for privacyIDEA-WebUI admin password (Username: **admin**)

Access to WebUI via HTTPS (8443)

#### How to configure

- Use the ```privacyidea/roles/privacyidea/files/environment.env``` file to configure the stack. 
- Set service for the stack in ```privacyidea/group_vars/allprivacyidea/group_vars/all```

**SECRET, PEPPER, DB_PASSWORD, ENCKEY** will be generated on the first run by the ansible role.  

#### Manual deployment with ansible

```
python3 -m venv ~/privacyidea-ansible
source ~/privacyidea-ansible/bin/activate 
pip3 install -q  ansible-core==2.17.5 ansible==10.5.0
```
Run ansible playbook

```
cd ~/privacyidea-ansible/privacyidea
ansible-playbook -i production site.yml -b
```
To run on multiple hosts or on a remote host, adjust the ```production``` inventory

#### Disclaimer

This project is my private project doing in my spare time. This project is not from the NetKnights company. The project uses the open-source version of privacyIDEA. There is no official support from NetKnights for this project.
