require 'spec_helper'

describe 'Instore::Api#categories' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
  
  it 'should fetch categories', vcr: {cassette_name: 'categories/index'} do
    response = subject.categories.fetch
    response.should be_instance_of(Instore::EndPoints::Mash)
  end

  it 'should fetch category', vcr: {cassette_name: 'categories/show'} do
    response = subject.categories.find('17b530c0-fd28-4091-94b0-aab2417936ae')
    response.status.should be_true
  end

  it 'should create category', vcr: {cassette_name: 'categories/create'} do
    response = subject.categories.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0', name: 'Test!')
    response.status.should be_true
  end

  it 'should update category', vcr: {cassette_name: 'categories/update'} do
    response = subject.categories.update('17b530c0-fd28-4091-94b0-aab2417936ae', name: 'Test 99!')
    response.status.should be_true
  end

  it 'should destroy category', vcr: {cassette_name: 'categories/destroy'} do
    response = subject.categories.destroy('6511f34c-beea-0488-170c-82038ee1306f')
    response.status.should be_true
  end
end