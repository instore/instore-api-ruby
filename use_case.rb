instore = Instore::Api.new('xxxxx')

instore.categories.create
instore.categories.update('xxx', :description => 'ddd')
instore.categories.destroy('xxx')

instore.categories # => obj
instore.categories.first # 1 requests
instore.categories.to_a # 1 requests
instore.categories.each # 1 requests
instore.categories.map # 1 requests
instore.categories.first.items # 2 requests
instore.categories.first.items # 2 requests
instore.categories.find('xxx').items # 2 requests

instore.items.create(:category_id => 'xx', :description => 'asdds')
instore.items.update('xxx', :description => 'ddd')
instore.items.destroy('xxx')

/categories
/categories/xxx
/categories/xxx/items
POST /items
UPDATE /items
DELETE /items
/orders/xxx
/orders/xxx/payments
/orders/xxx/order_lines
/orders/xxx/hold

/orders/xxx/order_lines/xxx/applied_discounts
/orders/xxx/applied_discounts

/applied_discounts