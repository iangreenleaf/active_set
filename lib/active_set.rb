require 'active_record'
require 'active_record/attribute_methods/write'
require 'active_record/connection_adapters/abstract/schema_definitions.rb'

module ActiveRecord
  module AttributeMethods
    module Write
      def write_attribute_with_enum(attr_name, value)
        if (column = column_for_attribute(attr_name)) && column.set? && value.respond_to?(:join)
          value = value.join ","
        end
        write_attribute_without_enum attr_name, value
      end
      alias_method :write_attribute_without_enum, :write_attribute
      alias_method :write_attribute, :write_attribute_with_enum
    end
  end
end

module ActiveRecord
  module ConnectionAdapters
    class Column
      def initialize_with_enum name, default, sql_type=nil, *args
        initialize_without_enum name, default, sql_type, *args
        @type = simplified_type_with_enum sql_type
      end
      alias_method :initialize_without_enum, :initialize
      alias_method :initialize, :initialize_with_enum

      def simplified_type_with_enum field_type
        if field_type =~ /enum|set/i
          $&.to_sym
        else
          simplified_type field_type
        end
      end

      def set?
        type == :set
      end

      def enum?
        type == :enum
      end
    end
  end
end
