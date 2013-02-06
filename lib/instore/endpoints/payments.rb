require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Payments < Base
      def create(params = {})
        create_resource(params)
      end

      private

      def resource
        "payments"
      end
    end
  end
end