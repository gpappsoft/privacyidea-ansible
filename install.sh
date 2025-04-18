#!/bin/bash

# License: MIT license
# (c)2024 Marco Moenig 


HST=$(hostname -A | cut -f1 -d ' ')
ANSIBLE_CORE=2.17.5
ANSIBLE=10.5.0
#DEBUG="-vv" # Enable to debug ansible
set +o history
clear

# PrivacyIDEA Logo
cat <<EOF
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;m#[38;5;006m#[38;5;m#[38;5;m#[38;5;m#[38;5;006m[38;5;006m#[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;015m [38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;006m%[38;5;006m%[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;003m([38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;m 
[38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m#[38;5;006m#[38;5;006m#
[38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;014m,[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m#
[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;014m,[38;5;014m,[38;5;014m,[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;014m/[38;5;014m/[38;5;014m/[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%
[38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;014m,[38;5;014m,[38;5;014m,[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;014m/[38;5;014m/[38;5;014m/[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%
[38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;014m,[38;5;014m,[38;5;014m,[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;014m/[38;5;014m/[38;5;014m/[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%
[38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;008m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;015m [38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;015m [38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;014m/[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m 
[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m#[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;006m%[38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m [38;5;m 
[0m
EOF

# Extract payload
PAYLOAD_LINE=`awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' $0`
tail -n+$PAYLOAD_LINE $0 |  tar xz -C ~ &> /dev/null

# Start installation
cd ~/privacyidea/
cat <<EOF
#########################################
# install and build setup environment   #
#########################################
EOF

# sudo hwclock --hctosys # only for testing with VM snapshots
sudo NEEDRESTART_MODE=a apt-get -q=2 -y update
sudo NEEDRESTART_MODE=a apt-get -q=2 -y install python3-venv sshpass vim git 

python3 -m venv ~/privacyidea && cd ~/privacyidea && source bin/activate && pip3 install -q  ansible-core==$ANSIBLE_CORE ansible==$ANSIBLE

cat <<EOF

#########################################
# Installing privacyIDEA                #
#########################################
EOF

ansible-playbook $DEBUG -i production site.yml -b 

cat <<EOF

#########################################
# privacyidea installation successfully #
#########################################


EOF
cd ~
deactivate
rm -rf privacyidea
source container/environment.env

cat <<EOF
Access to privacyIDEA: https://localhost:$PROXY_PORT
username / password:  $PI_ADMIN / $PI_ADMIN_PASS
EOF

set -o history
# switch group to prevent logout/login....
exec newgrp docker
exec newgrp -
exit 0
__PAYLOAD_BELOW__
