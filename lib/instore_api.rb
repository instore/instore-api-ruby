require 'httparty'
require 'settings'

class Instore
include HTTParty
base_uri 'api.instoredoes.com' + @@version + @@api_path

#set the access_token to an instance variable
def initialize(access_token)
  @access_token = access_token
end

#urls such as list_..., destroy_... are built automatically by lib/actions.rb
#the define_method options hash should have the id and argument parameters of the action:
#example: @instore.list_categories(:id =>..., :name =>...)
def self.build_url(methods={})
	methods.each do |k, v|
    define_method k do |options={}|
  	    options[:id] ||= ''
  	    self.class.send v[:method], (v[:url] + options[:id] + "?access_token=#{@access_token}"), :query => options
  	end
	end
end

#the when is the first half of the method, example: 'the list_ in list_categories'
#in the array, the first method is the http CRUD operation, example :get, :post, 
#in the array, the second is the method call, example" the 'categories' in 'list_categories'
#in the array, the third is the url path such as the 'categories' in /api/categories
#in the pluralize method, 1 is singular and not 1 is plural
def self.fetch_operation operation, path
  case operation
    when 'list'   then [:get,    path.pluralize(0)]
    when 'create' then [:post,   path.pluralize(1)]
    when 'update' then [:put,    path.pluralize(1)]
    when 'delete' then [:delete, path.pluralize(1)]
    when 'add'    then [:post,   path.pluralize(1)]
    when 'remove' then [:delete, path.pluralize(1)]
    when 'fetch'  then [:get,    path.pluralize(1)]
    when 'refund' then [:post,   path.pluralize(1)]
    when 'void'   then [:post,   path.pluralize(1)]
    when 'hold'   then [:post,   path.pluralize(1)]
    when 'unhold' then [:post,   path.pluralize(1)]
  end
end


#this defines the base URL, for example order_payments starts with /orders...
def self.fetch_base_url action
  case action
  when 'menu_category'         then 'categories'
  when 'menu_item'             then 'categories'
  when 'tax'                   then 'taxes'
  when 'discount'              then 'discounts'
  when 'ingredients'           then 'ingredients'
  when 'unique_quality'        then 'unique_qualities'
  when 'location'              then 'locations'
  when 'location_group'        then 'location_groups'
  when 'order'                 then 'orders'
  when 'order_payment'         then 'orders'
  when 'held_order'            then 'orders'
  when 'order_line'            then 'orders'
  when 'order_line_ingredient' then 'orders'
  when 'order_discount'        then 'orders'
  end
end 

require 'actions'
debug_output $stdout if @@debug == true

end



