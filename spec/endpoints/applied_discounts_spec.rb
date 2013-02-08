require 'spec_helper'

describe 'Instore::Api#applied_discounts' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch applied_discounts' do
    VCR.use_cassette('applied_discounts/index') do
      response = subject.applied_discounts.fetch
      response.should be_instance_of(Instore::EndPoints::Mash)
    end
  end

  it 'should fetch applied_discount' do
    VCR.use_cassette('applied_discounts/show') do
      response = subject.applied_discounts.find('672e580e-7607-6de2-3ed1-8e0c042e1cde')
      response.status.should be_true
    end
  end
  
  it 'should create applied_discount' do
    VCR.use_cassette('applied_discounts/create') do
      response = subject.applied_discounts.create(order_line_id: 'd9345047-1fa2-17e3-4178-5dace041ec83', discount_id: '4d0ae4f3-5b6f-663a-d1c9-93b87d1a5ee4')
      response.status.should be_true
    end
  end

  it 'should destroy applied_discount' do
    VCR.use_cassette('applied_discounts/destroy') do
      response = subject.applied_discounts.destroy('672e580e-7607-6de2-3ed1-8e0c042e1cde')
      response.status.should be_true
    end
  end
end