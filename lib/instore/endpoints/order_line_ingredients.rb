require 'instore/endpoints/base'

module Instore
  module EndPoints
    class OrderLineIngredients < Base
      def create(params = {})
        create_resource(params)
      end

      def destroy(id)
        destroy_resource(id)
      end

      private

      def resource
        "order_line_ingredients"
      end
    end
  end
end