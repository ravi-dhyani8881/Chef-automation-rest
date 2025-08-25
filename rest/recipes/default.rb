#
# Cookbook:: rest
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

# Read the contents of the JSON file as a string
#json_string = File.read('/Users/rdhyani/Desktop/mine/git/Chef-automation-rest/file.json')
Chef::Mixin::Template::TemplateContext.send(:include, Rest::HelperFunctions)
json_string = File.read('/var/chef/cookbooks/rest/file.json')

# Parse the JSON string into a Ruby hash
json_data = JSON.parse(json_string)

# Access the value associated with the "cities" key
graph = json_data["tables"]

projectName = json_data["projectName"]
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

#installDirectory = "/Users/rdhyani/Desktop/mine/git/Chef-automation-rest/"
installDirectory = "/var/chef/output/"

rootDirectory="gitRepo"

#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file_names.json'))
#file_names = JSON.parse(File.read('/Users/ravi.dhyani/Desktop/mine/git/chef/file.json'))

user 'ravi.dhyani' do
    comment 'User for owning the directory'
    uid '1001' # Optional, specify the user ID if necessary
    gid 'users' # Optional, specify the group ID or group name if necessary
    home '/home/ravi.dhyani'
    shell '/bin/bash'
    manage_home true # Creates the home directory if it doesn't exist
    action :create
  end


[
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/kubernates",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/model",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/controller",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/external",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/util",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/service",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/solr",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/validation",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/resources"
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/exception",
  "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/custom"
].each do |dir_path|
  directory dir_path do
    owner 'ravi.dhyani'
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

{ file: 'src/main/java/com/spring/rest/ApiAnalyticsFilter.java',     source: 'ApiAnalyticsFilter.java.erb' },
{ file: 'src/main/java/com/spring/rest/controller/AnalyticsController.java',     source: 'AnalyticsController.java.erb' },
{ file: 'src/main/java/com/spring/rest/service/EndpointStatsService.java',     source: 'EndpointStatsService.java.erb' },

{ file: 'src/main/java/com/spring/rest/util/FieldErrorDetail.java',     source: 'FieldErrorDetail.java.erb' },
{ file: 'src/main/java/com/spring/rest/exception/GlobalExceptionHandler.java',     source: 'GlobalExceptionHandler.java.erb' },
{ file: 'src/main/java/com/spring/rest/custom/ForeignKey.java',     source: 'ForeignKey.java.erb' },
{ file: 'src/main/java/com/spring/rest/custom/ForeignKeys.java',     source: 'ForeignKeys.java.erb' },
{ file: 'src/main/java/com/spring/rest/custom/ForeignKeysValidator.java',     source: 'ForeignKeysValidator.java.erb' },
{ file: 'src/main/java/com/spring/rest/custom/ForeignKeyValidator.java',     source: 'ForeignKeyValidator.java.erb' },


{ file: 'kubernates/rest-deployment.yaml', source: 'kubernates/rest-deployment.yaml.erb', vars: {
      ID: json_data["ID"],
      name: 'ravi.dhyani',
      project_name: json_data["projectName"],
      organizationID: json_data["organizationID"],
      sub_organization_id: json_data["subOrganizationID"],
      enviroment_id: json_data["enviromentID"],
      graph_id: json_data["graphID"],
      version: json_data["version"]
    }
  },
  { file: 'kubernates/rest-ingress.yaml', source: 'kubernates/rest-ingress.yaml.erb', vars: { 
      ID: json_data["ID"],
      domain: json_data["domain"],
      name: 'ravi.dhyani',
      project_name: json_data["projectName"],
      organizationID: json_data["organizationID"],
      sub_organization_id: json_data["subOrganizationID"],
      enviroment_id: json_data["enviromentID"],
      graph_id: json_data["graphID"],
      version: json_data["version"]
     } },
  { file: 'kubernates/rest-service.yaml', source: 'kubernates/rest-service.yaml.erb', vars: {
      ID: json_data["ID"],
      name: 'ravi.dhyani',
      project_name: json_data["projectName"],
      organizationID: json_data["organizationID"],
      sub_organization_id: json_data["subOrganizationID"],
      enviroment_id: json_data["enviromentID"],
      graph_id: json_data["graphID"],
      version: json_data["version"]
      } }
].each do |t|
  template "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/#{t[:file]}" do
    source t[:source]
    variables t[:vars]
    owner 'ravi.dhyani'
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
        path: "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/controller/#{key.split('_').map(&:capitalize).join}Controller.java",
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
  table.each do |table_name, value|
    all_table_names << table_name

    next unless value['fields'] # skip if no fields

  class_name = table_name.to_s[0].upcase + table_name.to_s[1, table_name.length]

 file_path = "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/model/#{class_name}.java"

    template file_path do
          source 'ApiModels.java.erb' # Assuming you have a template file named controller_template.erb
          variables(
           # file_name: table_name,
           file_name: "#{table_name}",
           
            fields: value['fields']
          )
          action :create # Use :create_if_missing if you only want to create the file if it doesn't exist
        end
  end
end

all_table_names.uniq!

# Step 2: Render a single SolrUrls.java file
template "#{installDirectory}#{rootDirectory}/#{subOrganizationID}/#{enviromentID}/#{graphID}/#{projectName}/src/main/java/com/spring/rest/util/SolrUrls.java" do
  source 'SolrUrls.java.erb'
  variables(
    ID: json_data["ID"],
    table_names: all_table_names,
    graph_id: json_data["graphID"]
  )
  action :create
end
