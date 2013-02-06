require 'instore/endpoints/base'

module Instore
  module EndPoints
    class ItemIngredients < Base
      def create(params = {})
        create_resource(params)
      end

      def destroy(id)
        destroy_resource(id)
      end

      private

      def resource
        "item_ingredients"
      end
    end
  end
end