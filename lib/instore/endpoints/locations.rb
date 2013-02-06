require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Locations < Base
      private
      
      def resource
        "locations"
      end
    end
  end
end