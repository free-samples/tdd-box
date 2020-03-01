#
# Cookbook Name:: tdd-box
# Recipe:: default
#


yum_package 'openssl-devel'
include_recipe "nginx"



