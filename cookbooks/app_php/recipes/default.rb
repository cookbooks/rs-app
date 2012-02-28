#
# Cookbook Name:: app_php
#
# Copyright RightScale, Inc. All rights reserved.  All access and use subject to the
# RightScale Terms of Service available at http://www.rightscale.com/terms.php and,
# if applicable, other agreements such as a RightScale Master Subscription Agreement.

rs_utils_marker :begin

log "  Setting provider specific settings for php application server."

node[:app][:provider] = "app_php"
node[:app][:app_port] = "8000"
node[:app][:destination]="#{node[:web_apache][:docroot]}"

case node[:platform]
  when "ubuntu", "debian"
    node[:app][:packages] = ["php5", "php5-mysql", "php-pear", "libapache2-mod-php5"]
  when "centos","fedora","suse","redhat"
    node[:app][:packages] = ["php53u", "php53u-mysql", "php53u-pear", "php53u-zts"]
  else
    raise "Unrecognized distro #{node[:platform]}, exiting "
end
rs_utils_marker :end
