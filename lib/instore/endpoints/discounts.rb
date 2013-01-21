require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Discounts < Base
      def resource
        "discounts"
      end
    end
  end
end