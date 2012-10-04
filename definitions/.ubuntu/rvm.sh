#!/bin/bash

# these were needed for test-kitchen, I think. The reason escapes me. Bollocks.
apt-get -y install curl libxml2-dev libxslt1-dev

#echo 'TERM=dumb curl -L https://get.rvm.io | bash -s -- --path "/home/vagrant/.rvm" --user-install stable' | sudo -H -u vagrant bash
#echo "~/.rvm/bin/rvm install 1.9.3" | sudo -H -u vagrant bash
