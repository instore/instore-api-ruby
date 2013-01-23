require 'instore/endpoints/base'

module Instore
  module EndPoints
    class AppliedDiscounts < Base
      def resource
        "applied_discounts"
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