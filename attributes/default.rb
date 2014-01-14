#
# Cookbook Name:: openstack-database_service
# Recipe:: default
#
# Copyright 2012-2013, AT&T Services, Inc.
# Copyright 2013, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Set to some text value if you want templated config files
# to contain a custom banner at the top of the written file
default["openstack"]["database_service"]["custom_template_banner"] = "
# This file autogenerated by Chef
# Do not edit, changes will be overwritten
"

default["openstack"]["database_service"]["verbose"] = false
default["openstack"]["database_service"]["debug"] = false

default["openstack"]["database_service"]["syslog"]["use"] = false

case platform
when "suse"
  default["openstack"]["database_service"]["user"] = "openstack-trove"
  default["openstack"]["database_service"]["group"] = "openstack-trove"
  default["openstack"]["database_service"]["platform"] = {
    "api_packages" => [ "openstack-trove-api" ],
    "api_service" => "openstack-trove-api",
    "conductor_packages" => [ "openstack-trove-conductor" ],
    "conductor_service" => "openstack-trove-conductor",
    "taskmanager_packages" => [ "openstack-trove-taskmanager" ],
    "taskmanager_service" => "openstack-trove-taskmanager",
    "guestagent_packages" => [ "openstack-trove-guestagent" ],
    "guestagent_service" => "openstack-trove-guestagent",
  }
end

default["openstack"]["database_service"]["db"]["username"] = "trove"

default["openstack"]["database_service"]["service_user"] = "trove"
# TODO set this in the proposal
default["openstack"]["database_service"]["service_password"] = "secret"
default["openstack"]["database_service"]["service_role"] = "admin"
default["openstack"]["database_service"]["service_tenant_name"] = "service"
default["openstack"]["database_service"]["region"] = "RegionOne"

default["openstack"]["database_service"]["rabbit"]["username"] = "guest"
default["openstack"]["database_service"]["rabbit"]["host"] = "127.0.0.1"

# Keystone PKI signing directory
default["openstack"]["trove"]["api"]["auth"]["cache_dir"] = "/var/cache/trove/api"
