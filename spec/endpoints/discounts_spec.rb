require 'spec_helper'

describe 'Instore::Api#discounts' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch discounts' do
    VCR.use_cassette('discounts/index') do
      response = subject.discounts.to_a
      response.should be_instance_of(Hashie::Mash)
    end
  end

  it 'should respond to previous_page?' do
    VCR.use_cassette('discounts/index_with_limit') do
      response = subject.discounts(limit: 1).to_a
      response.previous_page?.should be_false
    end
  end

  it 'should respond to next_page?' do
    VCR.use_cassette('discounts/index_with_limit') do
      response = subject.discounts(limit: 1).to_a
      response.next_page?.should be_true
    end
  end

  it 'should fetch discount' do
    VCR.use_cassette('discounts/show') do
      response = subject.discounts.find('4d0ae4f3-5b6f-663a-d1c9-93b87d1a5ee4')
      response.status.should be_true
    end
  end

  it 'should create discount' do
    VCR.use_cassette('discounts/create') do
      response = subject.discounts.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0', percent: 15, calculations_base: 'percent', name: 'Test discount 4!')
      response.status.should be_true
    end
  end

  it 'should update discount' do
    VCR.use_cassette('discounts/update') do
      response = subject.discounts.update('e84fa171-29ea-7981-3283-e2e68d420250', name: 'Test discount 99!')
      response.status.should be_true
    end
  end

  it 'should destroy discount' do
    VCR.use_cassette('discounts/destroy') do
      response = subject.discounts.destroy('28412090-f30f-243c-d50d-7238c3022fa5')
      response.status.should be_true
    end
  end
end