### Install privacyIDEA locally on bare-metal or VM with ansible using docker container

> [!Note]
> Early beta version...

Easy deploy a privacyIDEA stack with container from [privacyidea-docker](https://github.com/gpappsoft/privacyidea-docker/) project on a VM or bare-metal.

#### Requirements

A fresh Ubuntu 22.04 Base (or minimal) installation.

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
On target host run and install privacyIDEA. User needs ```sudo``` permissions.

```
chmod +x install.sh
./install.sh
```

Check ```environment.env``` file after installing for privacyIDEA-WebUI admin password (Username: **admin**)

#### Bugs/TODOs:
 - secrets, passwords  will be overwritten if running again (work in progress)
 - only **Ubuntu** (24.04) supported at the moment
 - not really tested at the moment

#### Disclaimer

This project is my private project doing in my free time. This project is not from the NetKnights company. The project uses the open-source version of privacyIDEA. There is no official support from NetKnights for this project.
