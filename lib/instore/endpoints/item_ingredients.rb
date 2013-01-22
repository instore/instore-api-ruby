require 'instore/endpoints/base'

module Instore
  module EndPoints
    class ItemIngredients < Base
      def resource
        "item_ingredients"
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