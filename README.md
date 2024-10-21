### Install privacyIDEA locally on bare-metal or VM with ansible using docker container

> [!Note]
> Early beta version...

Easy deploy a privacyIDEA stack with container from [privacyidea-docker](https://github.com/gpappsoft/privacyidea-docker/) project on a VM or bare-metal.

#### Requirements

A fresh Ubuntu 22.04 or (better) Ubuntu 24.04 LTS Base (or minimal) installation.

**Do not install Docker snap-in. The ansible role will install Docker-CE from official Docker repository.**

#### Setup
```
git clone https://github.com/gpappsoft/privacyidea-ansible.git
cd privacyidea-ansible
# create install.sh with PAYLOAD in /tmp
tar czvf /tmp/privacyidea.tgz privacyidea
cat install.sh /tmp/privacyidea.tgz > /tmp/install.sh
chmod +x /tmp/install.sh
```

Run ```/tmp/install.sh``` directly on the target host or copy ```/tmp/install.sh```to target host.

#### Install
On target host run installer to install a privacyIDEA stack. User needs ```sudo``` permissions.

```
chmod +x install.sh
./install.sh
```

Check ```environment.env``` file after installing for privacyIDEA-WebUI admin password (Username: **admin**)

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

#### Bugs/TODOs:
 - secrets, passwords  will be overwritten if running again (work in progress)
 - only **Ubuntu** (22.04/24.04) supported at the moment
 - not really tested at the moment

#### Disclaimer

This project is my private project doing in my free time. This project is not from the NetKnights company. The project uses the open-source version of privacyIDEA. There is no official support from NetKnights for this project.
