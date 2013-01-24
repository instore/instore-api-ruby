require 'instore/endpoints/base'

module Instore
  module EndPoints
    class SpecialQualities < Base
      def resource
        "special_qualities"
      end

      def create(params = {})
        create_resource(params)
      end

      def destroy(id)
        destroy_resource(id)
      end
    end
  end
end