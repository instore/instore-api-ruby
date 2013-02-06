require 'spec_helper'

describe 'Instore::Api#order_lines' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch order_lines' do
    VCR.use_cassette('order_lines/index') do
      response = subject.order_lines.fetch
      response.should be_instance_of(Hashie::Mash)
    end
  end

  it 'should respond to previous_page?' do
    VCR.use_cassette('order_lines/index_with_limit') do
      response = subject.order_lines.fetch(limit: 1)
      response.previous_page?.should be_false
    end
  end

  it 'should respond to next_page?' do
    VCR.use_cassette('order_lines/index_with_limit') do
      response = subject.order_lines.fetch(limit: 1)
      response.next_page?.should be_true
    end
  end

  it 'should fetch order_line' do
    VCR.use_cassette('order_lines/show') do
      response = subject.order_lines.find('d9345047-1fa2-17e3-4178-5dace041ec83')
      response.status.should be_true
    end
  end
  
  it 'should create order_line' do
    VCR.use_cassette('order_lines/create') do
      response = subject.order_lines.create(order_id: 'a30b292f-1feb-002d-9306-082699d83a21', item_id: '57deb0d5-da5b-40c7-a5ed-3bfabc93f380', item_size_id: '424b9981-c10f-4d0c-a867-f9ea8fec0789', quantity: 1)
      response.status.should be_true
    end
  end

  it 'should destroy order_line' do
    VCR.use_cassette('order_lines/destroy') do
      response = subject.order_lines.destroy('66daa60f-e72d-4f5c-acbc-d196e99c763f')
      response.status.should be_true
    end
  end
end