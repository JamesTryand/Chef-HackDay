# Instructions came from:
# http://wiki.opscode.com/display/chef/Installing+Chef+Client+on+Ubuntu+or+Debian
set -e

if [ -e /usr/bin/chef-solo ]; then
  echo chef solo already installed
  exit 0
fi

echo Updating ap-get sources
sudo apt-get update

echo Installing chef system dependencies
sudo apt-get --yes install ruby ruby-dev libopenssl-ruby rdoc ri irb build-essential wget ssl-cert curl

echo Installing ruby gems
cd /tmp
curl -O http://production.cf.rubygems.org/rubygems/rubygems-1.8.10.tgz
tar zxf rubygems-1.8.10.tgz
cd rubygems-1.8.10
sudo ruby setup.rb --no-format-executable

echo Finally... installing chef
sudo gem install chef --no-ri --no-rdoc
