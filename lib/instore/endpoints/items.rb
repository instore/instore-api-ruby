require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Items < Base
      def create(params = {})
        create_resource(params)
      end

      def update(id, params = {})
        update_resource(id, params)
      end

      def destroy(id)
        destroy_resource(id)
      end

      private

      def resource
        "items"
      end
    end
  end
end