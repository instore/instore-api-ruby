require 'spec_helper'

describe 'Instore::Api#order_line_ingredients' do
  let(:access_token) { '9JkAmIetQcJg_ZJ-w-GEU9EphBg=pERJPFtga8b1ce5ca5a12dec17ef1fe9c2add4aa61ba85b5ea6f40beeebef19e4873e77c67d386830f31aed43c3d87b41110d6cc39f9be179e22ff4ec198b5516caa923256c12b96e4b7b5806e810c51a9061b0974465429844a21501c067030cb5dee2cdb653ebd918f0598f0112323bdf07d033e8a12e694349b2998753e330edec3dbbbc1c567e0bba2160b65a3ae47632569' }
  subject { Instore::Api.new(access_token) }

  it 'should fetch order_line_ingredients', vcr: {cassette_name: 'order_line_ingredients/index'} do
    response = subject.order_line_ingredients.fetch
    response.should be_instance_of(Instore::EndPoints::Mash)
  end

  it 'should fetch order_line_ingredient', vcr: {cassette_name: 'order_line_ingredients/show'} do
    response = subject.order_line_ingredients.find('c7e10881-1070-0dd8-95e6-d327c58361ec')
    response.status.should be_true
  end
  
  it 'should create order_line_ingredient', vcr: {cassette_name: 'order_line_ingredients/create'} do
    response = subject.order_line_ingredients.create(order_line_id: 'd9345047-1fa2-17e3-4178-5dace041ec83', ingredient_id: '895cc2ea-19a7-a4ef-fb3a-b266f12dc9d0')
    response.status.should be_true
  end

  it 'should destroy order_line_ingredient', vcr: {cassette_name: 'order_line_ingredients/destroy'} do
    response = subject.order_line_ingredients.destroy('4fb17df7-3123-b8c9-d097-bef926681ed4')
    response.status.should be_true
  end
end