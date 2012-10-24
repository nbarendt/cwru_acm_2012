# Cookbook Name:: roster
# Recipe:: app_server
#
# Copyright 2012, Nick Barendt

include_recipe "apache2"
include_recipe "apache2:mod_wsgi"

#web_app "roster" do
#    template "roster_apache.conf.erb"
#    docroot roster_apache_documentroot_dir
#end

