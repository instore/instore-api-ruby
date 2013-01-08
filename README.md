api-ruby-client
===============

Client ruby wrapper for the Instore API

Getting started

1. In your application pass in your access_token to the Instore class:
  example: @instore = Instore("Your Access Token")

2. Call methods and pass in parameters to the @instore instance variable.
  example: @instore.list_menu_categories
  output: "scope"=>"api", "data"=>[{"id"=>"ecfbb8f6-c2e1-4547-a295-ba0f8ec0a4fd", "location_id"=>"93546f68-cb2c-48a6-ae91-1b800575ea81", "name"=>"Espresso", "active"=>true, "position"=>nil, "created_at"=>"2011-07-14T17:56:01.496Z", "updated_at"=>"2011-08-15T19:22:59.673Z", "items"=>{"data"=>[], "count"=>4, "paging"=>{"fetch"=>...


Further information

To see a list of methods call .methods 

  example: @instore.methods
  output: [:list_menu_categories, :create_menu_category, :update_menu_category, :delete_menu_category, :add_menu_item, :hold_menu_item, :list_taxes, :add_tax, :update_tax, :remove_tax, :add_discount, :delete_discount, :list_discounts, :update_discount, :list_ingredients, :create_ingredients, :delete_ingredients, :update_ingredients, :list_unique_qualities, :list_locations, :list_location_groups, :fetch_location_group, :list_orders, :create_order, :fetch_order, :refund_order, :void_order, :add_order_payment, :hold_held_order, :unhold_held_order, :add_order_line, :remove_order_line, :add_order_line_ingredient, :remove_order_line_ingredient, :add_order_discount, :remove_order_discount]

You can view the full Instore api documentation at https://instoredoes.com/developer/documentation/api