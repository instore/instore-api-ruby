require 'spec_helper'

describe 'Instore::Api#special_qualities' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch special_qualities' do
    VCR.use_cassette('special_qualities/index') do
      response = subject.special_qualities.fetch
      response.should be_instance_of(Instore::EndPoints::Mash)
    end
  end

  it 'should fetch special_quality' do
    VCR.use_cassette('special_qualities/show') do
      response = subject.special_qualities.find('074bfaea-392d-5d4e-e495-aef5e4997a02')
      response.status.should be_true
    end
  end
  
  it 'should create special_quality' do
    VCR.use_cassette('special_qualities/create') do
      response = subject.special_qualities.create(item_id: '57deb0d5-da5b-40c7-a5ed-3bfabc93f380', unique_quality_id: '849e5c92-271f-48fc-ae42-38b67176b492')
      response.status.should be_true
    end
  end

  it 'should destroy special_quality' do
    VCR.use_cassette('special_qualities/destroy') do
      response = subject.special_qualities.destroy('074bfaea-392d-5d4e-e495-aef5e4997a02')
      response.status.should be_true
    end
  end
end