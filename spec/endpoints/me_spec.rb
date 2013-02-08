require 'spec_helper'

describe 'Instore::Api#me' do
  let(:access_token) { 'C5UsOlYriXWFq_o2saWcVaBDFt4=slyco8pu4d175553cc17c88fdd26223ca88e41651689e417b1960460435aa998279497bce78c5bdc08250ca0af71705ac44dacd7d7acf49ec94e97f4acde9b1805f3d09e94db7ee09cf264828a44a8def0d7fda2d47cae2f5130d1bc0822839f1ba7b098348b9ca551ffc4cd500989c1de340a1bbf9dfc6de10148c79af922828e49cfc0ec7859097a9ff6a7c85cfdea4251ce89' }
  subject { Instore::Api.new(access_token) }
 
  it 'should fetch information' do
    VCR.use_cassette('me/show') do
      response = subject.me
      response.should be_instance_of(Instore::EndPoints::Mash)
      response.status.should be_true
    end
  end
end