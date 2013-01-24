require 'spec_helper'

describe 'Instore::Api#location_groups' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch location_groups' do
    VCR.use_cassette('location_groups/index') do
      response = subject.location_groups.to_a
      response.should be_instance_of(Array)
    end
  end

  it 'should fetch location_group' do
    VCR.use_cassette('location_groups/show') do
      response = subject.location_groups.find('de99abb1-f0e9-51d3-3386-72bd77c24590')
      response.status.should be_true
    end
  end
end