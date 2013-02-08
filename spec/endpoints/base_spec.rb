require 'spec_helper'

describe 'Instore::Api' do
  context 'with invalid token' do
    let(:access_token) { 'xxxxxxxxxxxxx' }
    subject { Instore::Api.new(access_token) }

    it 'should handle fetch' do
      VCR.use_cassette('categories/index_invalid_token') do
        response = subject.categories.fetch
        response.status.should be_false
        response.data.should be_nil
      end
    end

    it 'should handle find' do
      VCR.use_cassette('categories/show_invalid_token') do
        response = subject.categories.find('xxxxxxxx')
        response.status.should be_false
        response.data.should be_nil
      end
    end
  end

  context 'response' do
    subject { Instore::Api.new('9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569') }
    
    it 'should throw exception for non existing fields' do
      VCR.use_cassette('categories/index') do
        response = subject.categories.fetch
        expect { response.test }.to raise_error(Instore::UnsupportedMethod)
      end
    end

    it 'should throw exception for non existing nested fields' do
      VCR.use_cassette('categories/index') do
        response = subject.categories.fetch
        expect { response.data[0].test }.to raise_error(Instore::UnsupportedMethod)
      end
    end
  end
end