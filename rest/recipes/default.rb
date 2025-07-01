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

installDirectory = "/Users/rdhyani/Desktop/mine/git/Chef-automation-rest/"

#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file_names.json'))
#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file.json'))


[
  "#{installDirectory}#{projectName}/kubernates",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/model",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/controller",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/external",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/util",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/service",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/solr",
  "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/validation",
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
{ file: 'src/main/java/com/spring/rest/RestApplication.java',     source: 'RestApplication.java.erb'},
{ file: 'src/main/java/com/spring/rest/RestInterceptor.java',     source: 'RestInterceptor.java.erb'},
{ file: 'src/main/java/com/spring/rest/RestInterceptorAppConfig.java',     source: 'RestInterceptorAppConfig.java.erb' },
{ file: 'src/main/java/com/spring/rest/util/ResponseMessage.java',     source: 'ResponseMessage.java.erb' },
{ file: 'src/main/java/com/spring/rest/util/Utility.java',     source: 'Utility.java.erb' },
{ file: 'src/main/java/com/spring/rest/util/FacetFieldDTO.java',     source: 'FacetFieldDTO.java.erb' },
{ file: 'src/main/java/com/spring/rest/util/FacetValueDTO.java',     source: 'FacetValueDTO.java.erb' },

{ file: 'src/main/java/com/spring/rest/external/SolrProcessingException.java',     source: 'SolrProcessingException.java.erb' },

{ file: 'src/main/java/com/spring/rest/validation/ValidationService.java',     source: 'ValidationService.java.erb' },
{ file: 'src/main/java/com/spring/rest/validation/ValidationServiceImpl.java',     source: 'ValidationServiceImpl.java.erb' },
{ file: 'src/main/resources/application.properties',     source: 'application.properties.erb' },
{ file: 'src/main/java/com/spring/rest/SwaggerConfig.java',     source: 'SwaggerConfig.java.erb' },
{ file: 'src/main/java/com/spring/rest/solr/SolrConnection.java',     source: 'SolrConnection.java.erb' },
{ file: 'src/main/java/com/spring/rest/solr/SolrConnectionImpl.java',     source: 'SolrConnectionImpl.java.erb' },
{ file: 'src/main/java/com/spring/rest/solr/SolrResponseParser.java',     source: 'SolrResponseParser.java.erb' },
{ file: 'src/main/java/com/spring/rest/service/CommonDocumentServiceImpl.java',     source: 'CommonDocumentServiceImpl.java.erb' },
{ file: 'src/main/java/com/spring/rest/service/CommonDocumentService.java',     source: 'CommonDocumentService.java.erb' },

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



json_data['tables'].each do |table|
  table.each do |key, value|
    next unless value['fields']  # skip if no fields

    puts "Table: #{key}"
    puts "Fields:"
    value['fields'].each { |field| puts "  #{field['name']}: #{field['type']}" }

    # Define all templates to be created
    templates = [
      
      {
        path: "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/controller/#{key.split('_').map(&:capitalize).join}Controller.java",
        source: 'controller_template.erb',
        vars: {
          file_name: key,
          relations: value['relations']
        }
      }
    ]

    # Loop over and generate each template
    templates.each do |tpl|
      template tpl[:path] do
        source tpl[:source]
        variables tpl[:vars]
        action :create
      end
    end
  end
end


# Step 1: Collect all unique relation table names
all_table_names = []

json_data['tables'].each do |table|
  table.each do |table_name, _value|
    all_table_names << table_name
  end
end

all_table_names.uniq!

# Step 2: Render a single SolrUrls.java file
template "#{installDirectory}#{projectName}/src/main/java/com/spring/rest/util/SolrUrls.java" do
  source 'SolrUrls.java.erb'
  variables(
    table_names: all_table_names
  )
  action :create
end