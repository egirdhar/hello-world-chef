#
# Cookbook Name:: hello-world
# Recipe:: default
#
# Copyright (C) 2016 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "rvm::system"
package "nginx"

rvm_global_gem "unicorn" do
action :install
end

rvm_global_gem "sinatra" do
action :install
end

directory "/var/www" do
owner "root"
group "root"
mode "0755"
action :create
end

git "/var/www/simple-sinatra-app" do
repository "git://github.com/tnh/simple-sinatra-app.git"
reference "master"
action :sync
end

directory "/var/www/simple-sinatra-app/public" do
owner "root"
group "root"
mode "0777"
action :create
end

directory "/var/www/simple-sinatra-app/tmp" do
owner "root"
group "root"
mode "0777"
action :create
end

directory "/var/www/simple-sinatra-app/pids" do
owner "root"
group "root"
mode "0777"
action :create
end

directory "/var/www/simple-sinatra-app/logs" do
owner "root"
group "root"
mode "0777"
action :create
end

cookbook_file "/var/www/simple-sinatra-app/unicorn.rb" do
source 'unicorn.rb'
end

file "/etc/nginx/sites-available/default" do
action :delete
end

cookbook_file "/etc/nginx/conf.d/default.conf" do
source 'nginx.conf'
end
#bash "rvm source key" do 
#code <<-EOH
#/usr/local/rvm/bin/rvm-shell -c 'unicorn -c /var/www/simple-sinatra-app/unicorn.rb -D'
#EOH
#end

rvm_shell "run unicorn service" do
code "unicorn -c /var/www/simple-sinatra-app/unicorn.rb -D"
end

service "nginx" do
action [:restart]
end
