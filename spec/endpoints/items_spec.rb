require 'spec_helper'

describe 'Instore::Api#items' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch items' do
    VCR.use_cassette('items/index') do
      response = subject.items.to_a
      response.should be_instance_of(Array)
    end
  end

  it 'should fetch item' do
    VCR.use_cassette('items/show') do
      response = subject.items.find('a259f474-1dba-e53f-d88f-5925cdeb8085')
      response.status.should be_true
    end
  end
  
  it 'should create item' do
    VCR.use_cassette('items/create') do
      response = subject.items.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0', item_category_id: '17b530c0-fd28-4091-94b0-aab2417936ae', name: 'Test item 13!')
      response.status.should be_true
    end
  end

  it 'should update item' do
    VCR.use_cassette('items/update') do
      response = subject.items.update('a259f474-1dba-e53f-d88f-5925cdeb8085', name: 'Test item 99!')
      response.status.should be_true
    end
  end

  it 'should destroy item' do
    VCR.use_cassette('items/destroy') do
      response = subject.items.destroy('a259f474-1dba-e53f-d88f-5925cdeb8085')
      response.status.should be_true
    end
  end
end