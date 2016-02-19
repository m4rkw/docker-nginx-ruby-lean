#!/bin/bash
cd /root
git clone https://github.com/m4rkw/lean
cd lean
gem build lean.gemspec
gem install lean*.gem
cd ..
rm -rf lean

cd /var/www/lean

while :
do
    rackup -o 127.0.0.1 -p 9292
done
