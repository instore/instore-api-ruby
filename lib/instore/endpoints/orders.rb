require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Orders < Base
      def resource
        "orders"
      end

      def create(params = {})
        create_resource(params)
      end

      def update(id, params = {})
        update_resource(id, params)
      end

      def void(id)
        build_response self.class.post("#{path}/#{id}/void", @options)
      end

      def refund(id)
        build_response self.class.post("#{path}/#{id}/refund", @options)
      end
    end
  end
end