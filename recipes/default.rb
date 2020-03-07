#
# Cookbook Name:: tdd-box
# Recipe:: default
#

nginx_install 'MySite' do
  source                                "epel"
  default_site_enabled                  true
end