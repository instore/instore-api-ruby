require 'instore/endpoints/me'
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

    def me
      EndPoints::Me.new(@host, @access_token).fetch()
    end

    def categories
      EndPoints::Categories.new(@host, @access_token)
    end

    def items
      EndPoints::Items.new(@host, @access_token)
    end

    def item_sizes
      EndPoints::ItemSizes.new(@host, @access_token)
    end

    def special_qualities
      EndPoints::SpecialQualities.new(@host, @access_token)
    end

    def item_ingredients
      EndPoints::ItemIngredients.new(@host, @access_token)
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

    def orders
      EndPoints::Orders.new(@host, @access_token)
    end

    def order_lines
      EndPoints::OrderLines.new(@host, @access_token)
    end

    def order_line_ingredients
      EndPoints::OrderLineIngredients.new(@host, @access_token)
    end

    def applied_discounts
      EndPoints::AppliedDiscounts.new(@host, @access_token)
    end

    def payments
      EndPoints::Payments.new(@host, @access_token)
    end

    def method_missing(method, *args, &block)
      raise Instore::UnsupportedMethod.new(method, self)
    end
  end
end