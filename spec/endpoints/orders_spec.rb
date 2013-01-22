require 'spec_helper'

describe 'Instore::Api#orders' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  let(:host) { 'http://own-dev3.railwaymen.org:4006' }
  let(:instore) { Instore::Api.new(access_token, :host => host) }
  let(:location_id) { '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0' }
 
  it 'should fetch orders' do
    VCR.use_cassette('orders/index') do
      orders = instore.orders.to_a
      orders.should have(2).items
    end
  end

  it 'should fetch order' do
    VCR.use_cassette('orders/show') do
      response = instore.orders.find('81abf62f-adfe-4aa1-8203-697322cbcf34')
      response.status.should be_true
    end
  end

  it 'should create order' do
    VCR.use_cassette('orders/create') do
      response = instore.orders.create(location_id: location_id)
      response.status.should be_true
    end
  end

  it 'should update order' do
    VCR.use_cassette('orders/update') do
      response = instore.orders.update('81abf62f-adfe-4aa1-8203-697322cbcf34', no_tax: true)
      response.status.should be_true
    end
  end

  # it 'should void order' do
  #   # VCR.use_cassette('orders/destroy') do
  #     response = instore.orders.void('81abf62f-adfe-4aa1-8203-697322cbcf34')
  #     p response
  #     response.status.should be_true
  #   # end
  # end

  # it 'should refund order' do
  #   # VCR.use_cassette('orders/destroy') do
  #     response = instore.orders.refund('81abf62f-adfe-4aa1-8203-697322cbcf34')
  #     p response
  #     response.status.should be_true
  #   # end
  # end
end