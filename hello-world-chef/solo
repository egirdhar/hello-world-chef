#!/bin/bash
set -e
berks install
berks vendor cookbooks/
sudo chef-solo -c solo.rb

