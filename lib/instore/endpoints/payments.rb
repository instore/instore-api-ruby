require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Payments < Base
      def resource
        "payments"
      end

      def create(params = {})
        create_resource(params)
      end
    end
  end
end