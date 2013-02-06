Instore
===============

Client ruby wrapper for the Instore API

## Getting started

1. Initialize Instore::Client class which wraps OAuth2 client and pass your client\_id and client\_secret values.

        client = Instore::Client.new('346C7E9A9577844A1DD7', 'A777255B68BDDDE0AC3015D056E17364E3DEF85F')

2. Get Instore Api authorization page url and redirect user to this page.

        client.authorize_url(redirect_uri: 'example.com')

3. Retrieve code value from url on which user was redirected after successful authorization.

4. Exchange code into access_token

        access_token = client.get_token(code)

5. Store access_token and use it to communicate with Instore Api.

        instore = Instore::Api.new(access_token)


## Further information

Response object maps API fields with indifferent acccess :

    response = instore.categories.find('17b530c0-fd28-4091-94b0-aab2417936ae')
    response.status # => true
    response['status'] # => true
    response[:status] # => true
    response.scope # => "api"
    response.code # => "ok"
    response.message # => ""
    response.data # => {...}

Each endpoint support limit and page options for paginating API results

    instore.categories.fetch(page: 2)
    instore.categories.fetch(page: 2, limit: 10)

Additionally collections responds to methods : previous_page? and next_page?

    instore.categories.fetch.previous_page?
    instore.categories.fetch(page: 10).next_page?

When creating or updating resources Instore API can return validation errors. In that case response will have status equal false along with the errors field :

    response = instore.categories.create(name: '')
    response.status # => false
    response.errors # => {...}

## Full list of methods
       
    instore.me()
    instore.categories.fetch(params = {})
    instore.categories.find(id)
    instore.categories.create(params)
    instore.categories.update(id, params)
    instore.categories.destroy(id)
    instore.items.fetch(params = {})
    instore.items.find(id)
    instore.items.create(params)
    instore.items.update(id, params)
    instore.items.destroy(id)
    instore.item_sizes.fetch(params = {})
    instore.item_sizes.find(id)
    instore.item_sizes.create(params)
    instore.item_sizes.update(id, params)
    instore.item_sizes.destroy(id)
    instore.ingredients.fetch(params = {})
    instore.ingredients.find(id)
    instore.ingredients.create(params)
    instore.ingredients.update(id, params)
    instore.ingredients.destroy(id)
    instore.item_ingredients.fetch(params = {})
    instore.item_ingredients.find(id)
    instore.item_ingredients.create(params)
    instore.item_ingredients.destroy(id)
    instore.special_qualities.fetch(params = {})
    instore.special_qualities.find(id)
    instore.special_qualities.create(params)
    instore.special_qualities.destroy(id)
    instore.unique_qualities.fetch(params = {})
    instore.unique_qualities.find(id)
    instore.locations.fetch(params = {})
    instore.locations.find(id)
    instore.location_groups.fetch(params = {})
    instore.location_groups.find(id)
    instore.taxes.fetch(params = {})
    instore.taxes.find(id)
    instore.taxes.create(params)
    instore.taxes.update(id, params)
    instore.taxes.destroy(id)
    instore.discounts.fetch(params = {})
    instore.discounts.find(id)
    instore.discounts.create(params)
    instore.discounts.update(id, params)
    instore.discounts.destroy(id)
    instore.orders.fetch(params = {})
    instore.orders.find(id)
    instore.orders.create(params)
    instore.orders.update(id, params)
    instore.orders.void(id)
    instore.orders.refund(id)
    instore.orders.hold(id, params)
    instore.orders.unhold(id)
    instore.order_lines.fetch(params = {})
    instore.order_lines.find(id)
    instore.order_lines.create(params)
    instore.order_lines.destroy(id)
    instore.applied_discounts.fetch(params = {})
    instore.applied_discounts.find(id)
    instore.applied_discounts.create(params)
    instore.applied_discounts.destroy(id)
    instore.order_line_ingredients.fetch(params = {})
    instore.order_line_ingredients.find(id)
    instore.order_line_ingredients.create(params)
    instore.order_line_ingredients.destroy(id)
    instore.payments.fetch(params = {})
    instore.payments.find(id)
    instore.payments.create(params)

## Documentation

You can view the full Instore api documentation at <https://instoredoes.com/developer/documentation/api>
