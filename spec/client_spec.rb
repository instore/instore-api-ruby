require 'spec_helper'

describe 'Instore::Client' do
  subject { Instore::Client.new('346C7E9A9577844A1DD7', 'A777255B68BDDDE0AC3015D056E17364E3DEF85F') }

  it 'should return authorize_url' do
    subject.authorize_url(redirect_uri: 'foo.com').should eql('https://api.instoredoes.com/oauth/authorize?response_type=code&client_id=346C7E9A9577844A1DD7&redirect_uri=foo.com')
  end

  it 'should get access token' do
    VCR.use_cassette('client/access_token') do
      subject.get_token('ZOuac1-X_7mxKDbpeNIE2qcuC1D62Pedwt6eRdDK7yf').should respond_to(:token)
    end
  end
end