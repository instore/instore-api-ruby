require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Ingredients < Base
      def resource
        "ingredients"
      end
    end
  end
end