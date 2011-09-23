require 'active_record'
require 'active_record/attribute_methods/write'
require 'active_record/connection_adapters/abstract/schema_definitions.rb'

module ActiveRecord
  class Base
    def self.acts_as_set column_name, allowed_values
      #validates_inclusion_of column_name, :in => allowed_values
      define_method :"#{column_name}=" do |value|
        if value.respond_to?(:join)
          value = value.join ","
        end
        write_attribute column_name, value
      end
    end
  end
end
