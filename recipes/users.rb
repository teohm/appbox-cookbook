# Cookbook Name:: appbox
# Recipe:: users
#
# Setup default users, groups and sudoers for
# apps deployment purpose.
#

include_recipe "user"

user_account node["appbox"]["apps_user"] do
  comment "system user to run apps only"
  system_user true
  manage_home false
  create_group true
end
user_account node["appbox"]["deploy_user"] do
  comment "deploys apps only"
  ssh_keys node["appbox"]["deploy_keys"]
end
user_account node["appbox"]["devops_user"] do
  comment "handles sysadmin operations"
  ssh_keys node["appbox"]["devops_keys"]
end

group node["appbox"]["apps_user"] do
  action :modify
  members [
    node["appbox"]["apps_user"],
    node["appbox"]["devops_user"],
    node["appbox"]["deploy_user"]
  ]
end

node.default["authorization"]["sudo"]["groups"] = [
  "sudo",
  node["appbox"]["deploy_user"],  # TODO workaround enable deploy user to restart server
  node["appbox"]["devops_user"]
]
node.default["authorization"]["sudo"]["passwordless"] = true
include_recipe "sudo"

