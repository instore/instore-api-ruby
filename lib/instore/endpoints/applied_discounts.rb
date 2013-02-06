require 'instore/endpoints/base'

module Instore
  module EndPoints
    class AppliedDiscounts < Base
      def create(params = {})
        create_resource(params)
      end

      def destroy(id)
        destroy_resource(id)
      end

      private

      def resource
        "applied_discounts"
      end
    end
  end
end