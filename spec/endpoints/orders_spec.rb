require 'spec_helper'

describe 'Instore::Api#orders' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch orders', vcr: {cassette_name: 'orders/index'} do
    response = subject.orders.fetch
    response.should be_instance_of(Instore::EndPoints::Mash)
  end

  it 'should fetch order', vcr: {cassette_name: 'orders/show'} do
    response = subject.orders.find('81abf62f-adfe-4aa1-8203-697322cbcf34')
    response.status.should be_true
  end

  it 'should create order', vcr: {cassette_name: 'orders/create'} do
    response = subject.orders.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0')
    response.status.should be_true
  end

  it 'should update order', vcr: {cassette_name: 'orders/update'} do
    response = subject.orders.update('81abf62f-adfe-4aa1-8203-697322cbcf34', no_tax: true)
    response.status.should be_true
  end

  it 'should void order', vcr: {cassette_name: 'orders/void'} do
    response = subject.orders.void('a30b292f-1feb-002d-9306-082699d83a21')
    response.status.should be_true
  end

  it 'should refund order', vcr: {cassette_name: 'orders/refund'} do
    response = subject.orders.refund('97bdeb9b-d4bf-bddb-aa5a-6368d2b9f4ea')
    response.status.should be_true
  end

  it 'should hold order', vcr: {cassette_name: 'orders/hold'} do
    response = subject.orders.hold('bf0e7732-e6dd-db6a-57ab-b4dc85024a8f', customer_name: 'John')
    response.status.should be_true
  end

  it 'should unhold order', vcr: {cassette_name: 'orders/unhold'} do
    response = subject.orders.unhold('bf0e7732-e6dd-db6a-57ab-b4dc85024a8f')
    response.status.should be_true
  end
end