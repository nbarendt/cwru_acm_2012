# Cookbook Name:: roster
# Recipe:: app_server
#
# Copyright 2012, Nick Barendt

include_recipe "apache2"
include_recipe "apache2::mod_wsgi"
include_recipe "python"

node[:roster]["DEPLOY_DIR"] = File.expand_path(
	File.join( File.expand_path( File.dirname(__FILE__) ),
	"..","..","..",".."))

node[:roster]["VIRTUALENV_DIR"] = File.expand_path(
	File.join(node[:roster]["DEPLOY_DIR"], "env"))

# disable default, regardless of how it is symlinked
apache_site "default" do
    enable false
end
apache_site "000-default" do
    enable false
end


# we need a few packages
package "libpq-dev"

python_virtualenv node[:roster]["VIRTUALENV_DIR"] do
    interpreter "python2.7"
    action :create
end

pip_cmd = File.join(node[:roster]["VIRTUALENV_DIR"], "bin", "pip")
requirements_txt = File.join(node[:roster]["DEPLOY_DIR"], "requirements.txt")

execute "#{pip_cmd} install -r #{requirements_txt}"  do 
end

web_app "roster" do
    template "roster_apache.conf.erb"
end

