require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Items < Base
      def resource
        "items"
      end
    end
  end
end