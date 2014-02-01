#
# Cookbook Name:: razor-server
# Recipe:: deps

include_recipe "build-essential"

package node[:razor][:libarchive]

package "unzip"
package "curl"

# Install Java
include_recipe "java"

group node[:razor][:group]

user node[:razor][:user] do
  group node[:razor][:group]
  system true
  password '*'
  home node[:razor][:torquebox][:dest]
  shell '/bin/bash'
  comment 'razor-server daemon user'
end

include_recipe "razor-server::postgresql"