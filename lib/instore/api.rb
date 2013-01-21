require 'instore/endpoints/categories'

module Instore
  class Api
    attr_reader :access_token

    def initialize(access_token)
      @access_token = access_token
    end

    def categories
      EndPoints::Categories.new(@access_token)
    end
  end
end