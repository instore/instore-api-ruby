require 'instore/endpoints/base'

module Instore
  module EndPoints
    class SpecialQualities < Base
      def create(params = {})
        create_resource(params)
      end

      def destroy(id)
        destroy_resource(id)
      end

      private
      
      def resource
        "special_qualities"
      end
    end
  end
end