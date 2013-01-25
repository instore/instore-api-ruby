require 'instore/endpoints/categories'
require 'instore/endpoints/items'
require 'instore/endpoints/item_sizes'
require 'instore/endpoints/special_qualities'
require 'instore/endpoints/item_ingredients'
require 'instore/endpoints/ingredients'
require 'instore/endpoints/discounts'
require 'instore/endpoints/locations'
require 'instore/endpoints/location_groups'
require 'instore/endpoints/taxes'
require 'instore/endpoints/unique_qualities'
require 'instore/endpoints/orders'
require 'instore/endpoints/order_lines'
require 'instore/endpoints/order_line_ingredients'
require 'instore/endpoints/applied_discounts'
require 'instore/endpoints/payments'

module Instore
  class Api
    BASE_URL = 'https://api.instoredoes.com'
    attr_reader :access_token

    def initialize(access_token, options = {})
      @access_token = access_token
      @host = options[:host] || BASE_URL
    end

    def categories(params = {})
      EndPoints::Categories.new(@host, @access_token, params)
    end

    def items(params = {})
      EndPoints::Items.new(@host, @access_token, params)
    end

    def item_sizes(params = {})
      EndPoints::ItemSizes.new(@host, @access_token, params)
    end

    def special_qualities(params = {})
      EndPoints::SpecialQualities.new(@host, @access_token, params)
    end

    def item_ingredients(params = {})
      EndPoints::ItemIngredients.new(@host, @access_token, params)
    end

    def ingredients(params = {})
      EndPoints::Ingredients.new(@host, @access_token, params)
    end

    def discounts(params = {})
      EndPoints::Discounts.new(@host, @access_token, params)
    end

    def locations(params = {})
      EndPoints::Locations.new(@host, @access_token, params)
    end

    def location_groups(params = {})
      EndPoints::LocationGroups.new(@host, @access_token, params)
    end

    def taxes(params = {})
      EndPoints::Taxes.new(@host, @access_token, params)
    end

    def unique_qualities(params = {})
      EndPoints::UniqueQualities.new(@host, @access_token, params)
    end

    def orders(params = {})
      EndPoints::Orders.new(@host, @access_token, params)
    end

    def order_lines(params = {})
      EndPoints::OrderLines.new(@host, @access_token, params)
    end

    def order_line_ingredients(params = {})
      EndPoints::OrderLineIngredients.new(@host, @access_token, params)
    end

    def applied_discounts(params = {})
      EndPoints::AppliedDiscounts.new(@host, @access_token, params)
    end

    def payments(params = {})
      EndPoints::Payments.new(@host, @access_token, params)
    end
  end
end