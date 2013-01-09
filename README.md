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


More complicated requests can be passed into the method using :id, :url2, :id2, :url3, :id3 attributes, 

Example: 

Remove order_line

v1/api/orders/d8ead597-084d-1663-5744-dba953a0c95f/order_lines/360c522d-a510-9f04-98fb-732c8ccdaf74?access_token=YOUR_TOKEN_VALUE

@instore.remove_order_line(:id => 'd8ead597-084d-1663-5744-dba953a0c95f', :url2 => '/order_lines/', :id2 => '360c522d-a510-9f04-98fb-732c8ccdaf74')

Example 2:

Remove order_line_ingredient

DELETE v1/api/orders/d8ead597-084d-1663-5744-dba953a0c95f/order_lines/360c522d-a510-9f04-98fb-732c8ccdaf74/ingredients/3dad819e-282f-bafe-e1e7-80549bf709e4?access_token=YOUR_TOKEN_VALUE

@instore.remove_order_line_ingredient(:id => 'd8ead597-084d-1663-5744-dba953a0c95f', :url2 => '/order_lines/', :id2 => '360c522d-a510-9f04-98fb-732c8ccdaf74', :url3 => '/ingredients/', :id3 => '3dad819e-282f-bafe-e1e7-80549bf709e4'  )

Documentation

You can view the full Instore api documentation at https://instoredoes.com/developer/documentation/api

Oauth

Code
to get the code, call .generate_code and pass in the client_id and redirect_uri,
example:
@instore.generate_code(:client_id => '9633303903654421834118' ,:redirect_uri => 'http://localhost:3000' )

Access Token
to get the access token, call .generate_access_token and pass in the client_id, client_secret, and code,
example:
@instore.generate_access_token(:client_id => '9633303903654421834118', :client_secret => '5FB941F6-99B0-4D58-88E9-CDD641084354', :code => '6anclEyubeGDt1KluBOIrfA2P_lITt_NJUPlqcRK9z5')

