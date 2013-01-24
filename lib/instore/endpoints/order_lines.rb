require 'instore/endpoints/base'

module Instore
  module EndPoints
    class OrderLines < Base
      def resource
        "order_lines"
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