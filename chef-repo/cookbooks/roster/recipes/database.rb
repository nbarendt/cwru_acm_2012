# Cookbook Name:: roster
# Recipe:: database
#
# Copyright 2012, Nick Barendt

include_recipe "postgresql::client"
include_recipe "postgresql::server"

package "ruby-pg" do
  package_name "libpgsql-ruby"
  action :upgrade
end

# Snippet from opscode to reload gems
require 'rubygems'
Gem.clear_paths
require "pg"

include_recipe "database"
postgresql_connection_info = {:host => "127.0.0.1", :port => 5432, :username => 'postgres', :password => node['postgresql']['password']['postgres']}

postgresql_database "roster" do
    connection postgresql_connection_info
    action :create
end

database_user 'roster' do
    connection postgresql_connection_info
    password 'spartans'
    database_name 'roster'
    provider Chef::Provider::Database::PostgresqlUser
    action :create
end

database_user 'roster' do
    connection postgresql_connection_info
    password 'spartans'
    provider Chef::Provider::Database::PostgresqlUser
    action :grant
end



