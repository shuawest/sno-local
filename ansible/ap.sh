#!/bin/sh

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export DYLD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$DYLD_LIBRARY_PATH

if [ ! -d collections ]; then
    ansible-galaxy collection install -r requirements.yaml
fi

ansible-playbook $@

