require 'instore/endpoints/base'

module Instore
  module EndPoints
    class OrderLineIngredients < Base
      def resource
        "order_line_ingredients"
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