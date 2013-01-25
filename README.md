Instore
===============

Client ruby wrapper for the Instore API

Getting started

1. Initialize Instore::Client class which wraps OAuth2 client and pass your client\_id and client\_secret values.

        client = Instore::Client.new('346C7E9A9577844A1DD7', 'A777255B68BDDDE0AC3015D056E17364E3DEF85F')

2. Get Instore Api authorization page url and redirect user to this page.

        client.authorize_url(redirect_uri: 'example.com')

3. Retrieve code value from url on which user was redirected after successful authorization.

4. Exchange code into access_token

        access_token = client.get_token(code)

5. Store access_token and use it to communicate with Instore Api.

        instore = Instore::Api.new(access_token)


Further information

Full list of methods
       
    instore.categories.to_a
    instore.categories.find(id)
    instore.categories.create(params)
    instore.categories.update(id, params)
    instore.categories.destroy(id)
    instore.items.to_a
    instore.items.find(id)
    instore.items.create(params)
    instore.items.update(id, params)
    instore.items.destroy(id)
    instore.item_sizes.to_a
    instore.item_sizes.find(id)
    instore.item_sizes.create(params)
    instore.item_sizes.update(id, params)
    instore.item_sizes.destroy(id)
    instore.ingredients.to_a
    instore.ingredients.find(id)
    instore.ingredients.create(params)
    instore.ingredients.update(id, params)
    instore.ingredients.destroy(id)
    instore.item_ingredients.to_a
    instore.item_ingredients.find(id)
    instore.item_ingredients.create(params)
    instore.item_ingredients.destroy(id)
    instore.special_qualities.to_a
    instore.special_qualities.find(id)
    instore.special_qualities.create(params)
    instore.special_qualities.destroy(id)
    instore.unique_qualities.to_a
    instore.locations.to_a
    instore.location_groups.to_a
    instore.location_groups.find(id)
    instore.taxes.to_a
    instore.taxes.find(id)
    instore.taxes.create(params)
    instore.taxes.update(id, params)
    instore.taxes.destroy(id)
    instore.discounts.to_a
    instore.discounts.find(id)
    instore.discounts.create(params)
    instore.discounts.update(id, params)
    instore.discounts.destroy(id)
    instore.orders.to_a
    instore.orders.find(id)
    instore.orders.create(params)
    instore.orders.update(id, params)
    instore.orders.void(id)
    instore.orders.refund(id)
    instore.orders.hold(id, params)
    instore.orders.unhold(id)
    instore.order_lines.to_a
    instore.order_lines.find(id)
    instore.order_lines.create(params)
    instore.order_lines.destroy(id)
    instore.applied_discounts.to_a
    instore.applied_discounts.find(id)
    instore.applied_discounts.create(params)
    instore.applied_discounts.destroy(id)
    instore.order_line_ingredients.to_a
    instore.order_line_ingredients.find(id)
    instore.order_line_ingredients.create(params)
    instore.order_line_ingredients.destroy(id)
    instore.payments.to_a
    instore.payments.find(id)
    instore.payments.create(params)

Documentation

You can view the full Instore api documentation at <https://instoredoes.com/developer/documentation/api>