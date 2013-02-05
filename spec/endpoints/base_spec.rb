require 'spec_helper'

describe 'Instore::Api' do
  context 'with invalid token' do
    let(:access_token) { 'xxxxxxxxxxxxx' }
    subject { Instore::Api.new(access_token, host: 'http://own-dev3.railwaymen.org:4006') }

    it 'should handle fetch' do
      response = subject.categories.fetch
      response.status.should be_false
      response.previous_page.should be_false
      response.next_page.should be_false
      response.data.should be_empty
    end

    it 'should handle find' do
      response = subject.categories.find('xxxxxxxx')
      response.status.should be_false
      response.data.should be_nil
    end
  end 
end