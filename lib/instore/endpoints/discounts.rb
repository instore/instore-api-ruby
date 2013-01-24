require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Discounts < Base
      def resource
        "discounts"
      end

      def create(params = {})
        create_resource(params)
      end

      def update(id, params = {})
        update_resource(id, params)
      end

      def destroy(id)
        destroy_resource(id)
      end
    end
  end
end