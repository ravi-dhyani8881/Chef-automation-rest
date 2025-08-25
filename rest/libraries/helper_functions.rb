# cookbooks/rest/libraries/helper_functions.rb

module Rest
  module HelperFunctions
    def map_java_type(type)
      {
        'INTEGER' => 'int',
        'VARCHAR' => 'String',
        'TEXT' => 'String',
        'BOOLEAN' => 'boolean',
        'DATE' => 'Date'
      }[type.upcase] || 'String'
    end
  end
end
