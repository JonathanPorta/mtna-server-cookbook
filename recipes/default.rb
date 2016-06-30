#
# Cookbook Name::mtna_server
# Recipe::default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'mtna_server::system'
include_recipe 'mtna_server::autochef'
include_recipe 'mtna_server::backup'
include_recipe 'mtna_server::mtna'
