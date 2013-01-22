require 'instore/endpoints/categories'
require 'instore/endpoints/ingredients'
require 'instore/endpoints/discounts'
require 'instore/endpoints/locations'
require 'instore/endpoints/location_groups'
require 'instore/endpoints/taxes'
require 'instore/endpoints/unique_qualities'

module Instore
  class Api
    BASE_URL = 'https://api.instoredoes.com'
    attr_reader :access_token

    def initialize(access_token, options = {})
      @access_token = access_token
      @host = options[:host] || BASE_URL
    end

    def categories
      EndPoints::Categories.new(@host, @access_token)
    end

    def ingredients
      EndPoints::Ingredients.new(@host, @access_token)
    end

    def discounts
      EndPoints::Discounts.new(@host, @access_token)
    end

    def locations
      EndPoints::Locations.new(@host, @access_token)
    end

    def location_groups
      EndPoints::LocationGroups.new(@host, @access_token)
    end

    def taxes
      EndPoints::Taxes.new(@host, @access_token)
    end

    def unique_qualities
      EndPoints::UniqueQualities.new(@host, @access_token)
    end
  end
end