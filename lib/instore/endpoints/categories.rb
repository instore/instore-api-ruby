require 'instore/endpoints/base'
require 'instore/endpoints/items'

module Instore
  module EndPoints
    class CategoriesResponse < BaseResponse
      def items
        EndPoints::Items.new(@host, @access_token, :prepend_path => "categories/#{id}")
      end
    end

    class Categories < Base
      response_class CategoriesResponse

      def resource
        "categories"
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