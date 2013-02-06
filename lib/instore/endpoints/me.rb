require 'instore/endpoints/base'

module Instore
  module EndPoints
    class Me < Base
      private
      
      def resource
        "me"
      end
    end
  end
end