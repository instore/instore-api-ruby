require 'spec_helper'

describe 'Instore::Api#locations' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch locations', vcr: {cassette_name: 'locations/index'} do
    response = subject.locations.fetch
    response.should be_instance_of(Instore::EndPoints::Mash)
  end

  it 'should fetch location', vcr: {cassette_name: 'locations/show'} do
    response = subject.locations.find('1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0')
    response.status.should be_true
  end
end