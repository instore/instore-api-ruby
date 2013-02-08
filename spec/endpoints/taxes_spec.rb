require 'spec_helper'

describe 'Instore::Api#taxes' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch taxes' do
    VCR.use_cassette('taxes/index') do
      response = subject.taxes.fetch
      response.should be_instance_of(Instore::EndPoints::Mash)
    end
  end

  it 'should fetch tax' do
    VCR.use_cassette('taxes/show') do
      response = subject.taxes.find('258d9dcc-30b4-652a-56a5-e24b918308b2')
      response.status.should be_true
    end
  end

  it 'should create tax' do
    VCR.use_cassette('taxes/create') do
      response = subject.taxes.create(location_id: '1e36bfbc-d1a8-4cce-8073-add1c6a2f3d0', tax_rate: 5, name: 'Test tax 7!')
      response.status.should be_true
    end
  end

  it 'should update tax' do
    VCR.use_cassette('taxes/update') do
      response = subject.taxes.update('de78687a-c212-432a-0abb-1aaa51b9ee66', name: 'Test tax 99!')
      response.status.should be_true
    end
  end

  it 'should destroy tax' do
    VCR.use_cassette('taxes/destroy') do
      response = subject.taxes.destroy('258d9dcc-30b4-652a-56a5-e24b918308b2')
      response.status.should be_true
    end
  end
end