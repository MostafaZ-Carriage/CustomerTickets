require 'rails_helper'
RSpec.describe CreateCustomer do
  include ModelHelper

  after do
    Customer.destroy_all
  end

  it 'Create Customer interactor exists' do
    expect(class_exists?(CreateCustomer)).to eq(true)
  end

  it 'successful create' do
    result = CreateCustomer.call(response: {authenticated: true}, customer: build(:customer).as_json.merge(password: '12312321312'))
    expect(result.success?).to eq(true)
    expect(result.response[:customer][:id]).to eq(Customer.last.id)
  end

  it 'unsuccessful create' do
    result = CreateCustomer.call(response: {authenticated: true}, customer: build(:customer).as_json)
    expect(result.success?).to_not eq(true)
    expect(result.response[:customer]).to eq(nil)
  end
end