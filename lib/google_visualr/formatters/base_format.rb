module GoogleVisualr
  module Formatters
  
    class BaseFormat
      include GoogleVisualr::Utilities::AttributeReflection
      include GoogleVisualr::Utilities::GoogleClassReflection

      # http://code.google.com/apis/visualization/documentation/reference.html#formatters

      attr_accessor :columns

      def initialize(options = {})
        options.each_pair do | key, value |
          self.send "#{key}=", value
        end
      end

      def columns(*columns)
        @columns = columns.flatten
      end

      def script
        script   = "var formatter = new google.visualization.#{determine_google_class}("
        script  <<  determine_parameters
        script  << ");"

        @columns.each do |column|
         script << "formatter.format(chart_data, #{column});"
        end
        return script
      end
            
      private
            
      # determines defined instance variables of child class
      def determine_parameters
        
        parameters = Array.new
        attributes  = get_attributes_except(["@columns"])

        attributes.each do |attribute|
          key         = attribute.gsub("@", "")
          value       = instance_variable_get(attribute)
          parameter   = key + ":" + (value.is_a?(String) ? "'" + value + "'" : value.to_s)
          parameters << parameter
        end

        return "{" + parameters.join(",") + "}"
      end
      
    end
    
 end
end