#!/bin/bash -eux

# Omnibus install doesn't work with the pg gem. Story of my life. #fwp
# wget -O - http://opscode.com/chef/install.sh | sudo bash

# Fallback to a ruby install for now
apt-get -y install ruby1.9.1 ruby1.9.1-dev libopenssl-ruby1.9.1 ri1.9.1 libruby1.9.1 irb1.9.1 build-essential wget ssl-cert curl
update-alternatives --install /usr/bin/ruby ruby /usr/bin/ruby1.9.1 400 \
         --slave   /usr/share/man/man1/ruby.1.gz ruby.1.gz \
                        /usr/share/man/man1/ruby1.9.1.1.gz \
        --slave   /usr/bin/ri ri /usr/bin/ri1.9.1 \
        --slave   /usr/bin/irb irb /usr/bin/irb1.9.1 \
        --slave   /usr/bin/rdoc rdoc /usr/bin/rdoc1.9.1

cd /tmp
curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.24.tgz
tar zxf rubygems-1.8.24.tgz
cd rubygems-1.8.24
ruby setup.rb --no-format-executable

gem install bundler chef --no-ri --no-rdoc
