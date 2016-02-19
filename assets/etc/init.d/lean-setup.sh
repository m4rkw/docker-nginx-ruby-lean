#!/bin/bash
cd /root
git clone https://github.com/m4rkw/lean
cd lean
gem build lean.gemspec
gem install lean*.gem
cd ..
rm -rf lean

RACK_ENV=production sudo -E -u lean /var/www/lean/run.sh
