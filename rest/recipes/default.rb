#
# Cookbook:: rest
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Read the contents of the JSON file as a string
json_string = File.read('/Users/rdhyani/Desktop/mine/git/Chef-automation-rest/file.json')
#json_string = File.read('/var/chef/cookbooks/graphql/file.json')

# Parse the JSON string into a Ruby hash
json_data = JSON.parse(json_string)

# Access the value associated with the "cities" key
graph = json_data["tables"]

projectName = json_data["projectName"]

# projectName = json_data["subOrganizationID"]
organizationID = json_data["organizationID"]
subOrganizationID = json_data["subOrganizationID"]
enviromentID = json_data["enviromentID"]
graphID = json_data["graphID"]
version = json_data["version"]

Chef::Log.debug("projectName: #{projectName.inspect}")
Chef::Log.debug("organizationID: #{organizationID.inspect}")
Chef::Log.debug("subOrganizationID: #{subOrganizationID.inspect}")
Chef::Log.debug("enviromentID: #{enviromentID.inspect}")
Chef::Log.debug("graphID: #{graphID.inspect}")
Chef::Log.debug("version: #{version.inspect}")

installDirectory = "/var/chef/output/"

#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file_names.json'))
#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file.json'))






[
  "#{installDirectory}#{projectName}/kubernates",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/control",
  "#{installDirectory}#{projectName}/src/main/resources"
].each do |dir_path|
  directory dir_path do
    owner 'rdhyani'
    mode '0755'
    recursive true
    action :create
  end
end


[
  { file: 'pom.xml',        source: 'pom.xml.erb',        vars: { projectName: projectName } },
  { file: 'Dockerfile',     source: 'Dockerfile.erb',     vars: { projectName: projectName } },
  { file: 'kubernates/rest-deployment.yaml', source: 'kubernates/rest-deployment.yaml.erb', vars: {
      name: 'rdhyani',
      project_name: json_data["subOrganizationID"],
      organizationID: json_data["organizationID"],
      sub_organization_id: json_data["subOrganizationID"],
      enviroment_id: json_data["enviromentID"],
      graph_id: json_data["graphID"],
      version: json_data["version"]
    }
  },
  { file: 'kubernates/rest-ingress.yaml', source: 'kubernates/rest-ingress.yaml.erb', vars: { name: 'rdhyani' } },
  { file: 'kubernates/rest-service.yaml', source: 'kubernates/rest-service.yaml.erb', vars: { name: 'rdhyani' } }
].each do |t|
  template "#{installDirectory}#{projectName}/#{t[:file]}" do
    source t[:source]
    variables t[:vars]
    owner 'rdhyani'
    mode '0644'
  end
end


