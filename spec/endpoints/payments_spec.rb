require 'spec_helper'

describe 'Instore::Api#payments' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch payments', vcr: {cassette_name: 'payments/index'} do
    response = subject.payments.fetch
    response.should be_instance_of(Instore::EndPoints::Mash)
  end

  it 'should fetch payment', vcr: {cassette_name: 'payments/show'} do
    response = subject.payments.find('b26e58ca-c094-ae39-9f0d-2df3e4b92189')
    response.status.should be_true
  end

  it 'should create payment', vcr: {cassette_name: 'payments/create'} do
    response = subject.payments.create(order_id: '97bdeb9b-d4bf-bddb-aa5a-6368d2b9f4ea', amount: 1, payment_type: 'cash')
    response.status.should be_true
  end
end