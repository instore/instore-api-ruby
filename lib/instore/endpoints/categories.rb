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
    end
  end
end