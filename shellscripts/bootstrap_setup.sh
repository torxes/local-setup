#!/usr/bin/env sh

setup_dir="$(pwd)/local-setup"


zypper install -y python python-virtualenv git

git clone https://github.com/torxes/local-setup.git "$setup_dir"

virtualenv -p python2 "$setup_dir/venv"

pip="$setup_dir/venv/bin/pip"

$pip install -U pip
$pip install ansible

local_alias="alias ansible-local='ansible-playbook -i localhost, -c local'"
echo $local_alias >> $setup_dir/venv/bin/activate

cat << EOF


Bootstrap done, run

$ source $setup_dir/venv/bin/activate
$ ansible-local playbooks/<playbook-name>

Edit variable files of plays as required.
EOF
