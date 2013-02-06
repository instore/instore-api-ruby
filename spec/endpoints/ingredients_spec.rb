require 'spec_helper'

describe 'Instore::Api#ingredients' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch ingredients' do
    VCR.use_cassette('ingredients/index') do
      response = subject.ingredients.fetch
      response.should be_instance_of(Hashie::Mash)
    end
  end

  it 'should fetch ingredient' do
    VCR.use_cassette('ingredients/show') do
      response = subject.ingredients.find('895cc2ea-19a7-a4ef-fb3a-b266f12dc9d0')
      response.status.should be_true
    end
  end

  it 'should respond to previous_page?' do
    VCR.use_cassette('ingredients/index_with_limit') do
      response = subject.ingredients.fetch(limit: 1)
      response.previous_page?.should be_false
    end
  end

  it 'should respond to next_page?' do
    VCR.use_cassette('ingredients/index_with_limit') do
      response = subject.ingredients.fetch(limit: 1)
      response.next_page?.should be_true
    end
  end

  it 'should create ingredient' do
    VCR.use_cassette('ingredients/create') do
      response = subject.ingredients.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0', name: 'Test ingredient 4!')
      response.status.should be_true
    end
  end

  it 'should update ingredient' do
    VCR.use_cassette('ingredients/update') do
      response = subject.ingredients.update('fb2430be-8a2e-e8f9-bb62-4360011499b1', name: 'Test ingredient 99!')
      response.status.should be_true
    end
  end

  it 'should destroy ingredient' do
    VCR.use_cassette('ingredients/destroy') do
      response = subject.ingredients.destroy('eda0a9c0-a260-200e-c39c-9e9fa667a27e')
      response.status.should be_true
    end
  end
end