require 'spec_helper'

describe 'Instore::Api#item_sizes' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch item_sizes' do
    VCR.use_cassette('item_sizes/index') do
      response = subject.item_sizes.to_a
      response.should be_instance_of(Hashie::Mash)
    end
  end

  it 'should respond to previous_page?' do
    VCR.use_cassette('item_sizes/index_with_limit') do
      response = subject.item_sizes.fetch(limit: 1)
      response.previous_page?.should be_false
    end
  end

  it 'should respond to next_page?' do
    VCR.use_cassette('item_sizes/index_with_limit') do
      response = subject.item_sizes.fetch(limit: 1)
      response.next_page?.should be_true
    end
  end

  it 'should fetch item_size' do
    VCR.use_cassette('item_sizes/show') do
      response = subject.item_sizes.find('befc7f09-33ae-6d5a-fbf9-732bc182b56b')
      response.status.should be_true
    end
  end
  
  it 'should create item_size' do
    VCR.use_cassette('item_sizes/create') do
      response = subject.item_sizes.create(item_id: '57deb0d5-da5b-40c7-a5ed-3bfabc93f380', name: 'Test item_size 13!')
      response.status.should be_true
    end
  end

  it 'should update item_size' do
    VCR.use_cassette('item_sizes/update') do
      response = subject.item_sizes.update('befc7f09-33ae-6d5a-fbf9-732bc182b56b', name: 'Test item_size 99!')
      response.status.should be_true
    end
  end

  it 'should destroy item_size' do
    VCR.use_cassette('item_sizes/destroy') do
      response = subject.item_sizes.destroy('befc7f09-33ae-6d5a-fbf9-732bc182b56b')
      response.status.should be_true
    end
  end
end