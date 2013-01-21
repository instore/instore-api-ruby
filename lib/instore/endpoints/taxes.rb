require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Taxes < Base
      def resource
        "taxes"
      end
    end
  end
end