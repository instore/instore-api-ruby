require 'instore/endpoints/base'

module Instore
  module EndPoints
    class LocationGroups < Base
      private
      
      def resource
        "location_groups"
      end
    end
  end
end