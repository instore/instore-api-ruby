require 'rubygems'
require 'instore'

instore = Instore::Api.new('9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569', host: 'http://own-dev3.railwaymen.org:4006')
p instore.order_line_ingredients.create(order_line_id: 'd9345047-1fa2-17e3-4178-5dace041ec83', ingredient_id: '895cc2ea-19a7-a4ef-fb3a-b266f12dc9d0')

# instore = Instore::Api.new('xxxxx')

# instore.categories.create
# instore.categories.update('xxx', :description => 'ddd')
# instore.categories.destroy('xxx')

# instore.categories # => obj
# instore.categories.first # 1 requests
# instore.categories.to_a # 1 requests
# instore.categories.each # 1 requests
# instore.categories.map # 1 requests
# instore.categories.first.items # 2 requests
# instore.categories.first.items # 2 requests
# instore.categories.find('xxx').items # 2 requests

# instore.items.create(:category_id => 'xx', :description => 'asdds')
# instore.items.update('xxx', :description => 'ddd')
# instore.items.destroy('xxx')

# /categories
# /categories/xxx
# /categories/xxx/items
# POST /items
# UPDATE /items
# DELETE /items
# /orders/xxx
# /orders/xxx/payments
# /orders/xxx/order_lines
# /orders/xxx/hold

# /orders/xxx/order_lines/xxx/applied_discounts
# /orders/xxx/applied_discounts

# /applied_discounts